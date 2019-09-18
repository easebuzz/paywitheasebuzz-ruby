module Easebuzz
    class Payment
        def self.initiate params
			params = self.get_params(JSON.parse((params || {}).to_json))
			validation_result = self.params_valid? params
            if validation_result['status']
				easepay_response = Easebuzz.request.initiate_payment params
				easepay_response
			else
                validation_result
            end
        end
	
		private
		def self.params_valid? params
			result = { 'status' => true }
			if not params['key'].present? or not params['key'].instance_of?(String)
				result['status'] = false
				result['message'] = "Merchant Key is not valid. Must be string. Please refer documentation."
			elsif not params['txnid'].present? or not params['txnid'].instance_of?(String)
				result['status'] = false
				result['message'] = "Transaction ID is not valid. Must be string. Please refer documentation."
			elsif not params['amount'].present? or not params['amount'].instance_of?(Float)
				result['status'] = false
				result['message'] = "Amount is not valid. Must be float. Please refer documentation."
			elsif not params['productinfo'].present? or not params['productinfo'].instance_of?(String)
				result['status'] = false
				result['message'] = "Product Info is not valid. Must be string. Please refer documentation."
			elsif not params['firstname'].present? or not params['firstname'].instance_of?(String)
				result['status'] = false
				result['message'] = "First Name is not valid. Must be string. Please refer documentation."
			elsif not params['email'].present? or not params['email'].match? URI::MailTo::EMAIL_REGEXP
				result['status'] = false
				result['message'] = "Email is not valid. Must be a valid email. Please refer documentation."
			elsif not params['phone'].present? or not params['phone'].instance_of?(String)
				result['status'] = false
				result['message'] = "Phone number is not valid. Must be string. Please refer documentation."
			elsif not params['surl'].present? or not params['surl'].instance_of?(String)
				result['status'] = false
				result['message'] = "Success URL is not valid. Must be string. Please refer documentation."
			elsif not params['furl'].present? or not params['furl'].instance_of?(String)
				result['status'] = false
				result['message'] = "Failure URL is not valid. Must be string. Please refer documentation."
			end
			result
		end
	
		def self.get_params params
			params['key'] = Easebuzz.key
			udf_keys = ["udf1","udf2","udf3","udf4","udf5","udf6","udf7","udf8","udf9","udf10"]
            (params.keys + udf_keys).uniq.each do |param_key|
                value = params[param_key] || ''
				params[param_key] = value.instance_of?(String) ? value.strip : value
            end
			params['hash'] = Helper.generate_hash(params, Easebuzz.key, Easebuzz.salt)
            params
        end
    end
end