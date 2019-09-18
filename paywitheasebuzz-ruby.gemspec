Gem::Specification.new do |s|
    s.name        = 'paywitheasebuzz-ruby'
    s.version     = '0.0.2'
    s.summary     = "Pay with easebuzz"
    s.description = "Ruby gem for easebuzz payment process."
    s.authors     = ["Karan Bhutwala"]
    s.email       = 'karan.bhutwala@easebuzz.in'
    s.files       = [
      "lib/paywitheasebuzz-ruby.rb", 
      "lib/paywitheasebuzz-ruby/payment.rb", 
      "lib/paywitheasebuzz-ruby/constants.rb", 
      "lib/paywitheasebuzz-ruby/request.rb",
      "lib/paywitheasebuzz-ruby/helper.rb"
    ]
    s.homepage    =
      'https://github.com/easebuzz/paywitheasebuzz-ruby'
    s.license       = 'MIT'
end