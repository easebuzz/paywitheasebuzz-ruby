require 'paywitheasebuzz-ruby/constants'
require 'net/http'

module Easebuzz
    class Request
        def initialize env
            @BASE_URL = (env=='prod' || env=='production' || env=='PROD') ? PROD_URL : TEST_URL
            parsed_base_url = URI.parse(@BASE_URL)
            @HOST = parsed_base_url.host
            @PORT = parsed_base_url.port
            @HAS_SSL = parsed_base_url.scheme
        end
        
        def initiate_payment params  
            url = "#{@BASE_URL}payment/initiateLink"
            hit_it(url, Net::HTTP::Post, params)
        end

        def hit_it action, method, params
            request = method.new(action)
            request.set_form_data(params)
            http = Net::HTTP.new(@HOST, @PORT)
            http.use_ssl = @HAS_SSL
            response = http.request(request)
            response_parsed = response ? JSON.parse(response.body) : {status: false, message: "Could not reach payment gateway server."}
            response_parsed
        end
    end
end