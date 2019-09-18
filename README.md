# paywitheasebuzz-ruby
Ruby integration kit for pay with easebuzz pay.easebuzz.in

## Installation

Add this line to your application's Gemfile:

```rb
gem 'paywitheasebuzz-ruby'
```

And then execute:
```rb
$ bundle
```

Or install it yourself as:
```rb
$ gem install paywitheasebuzz-ruby
```

## Usage

initialize Easebuzz in your application.rb
```rb
    require 'paywitheasebuzz-ruby'
    Easebuzz.init('MERCHANT_KEY', 'MERCHANT_SALT', 'env') #env: 'test', 'prod'
```

### Initiate Payment
```rb
    options = {
        "txnid" => "T3SAT0B5OL",
        "amount" => "100.0",
        "firstname" => "customer_name",
        "email" => "customer_email",
        "phone" => "customer_phone",
        "productinfo" => "Product Name",
        "surl" => "http://localhost:3000/response.php",
        "furl" => "http://localhost:3000/response.php",
        "udf1" => "aaaa",
        "udf2" => "aaaa",
        "udf3" => "aaaa",
        "udf4" => "aaaa",
        "udf5" => "aaaa",
        "address1" => "aaaa",
        "address2" => "aaaa",
        "city" => "aaaa",
        "state" => "aaaa",
        "country" => "aaaa",
        "zipcode" => "123123"
    }
    payment_response = Easebuzz::Payment.initiate(options)
    #payment_response = {"status"=>1, "data"=>"48fde15f93b80ca178asdff56ghy678345gtdh7388fcd6f5550823e2516ab5266"}
    #redirect customer to the https://[pay, testpay].easebuzz.in/pay/<<payment_response.data>>
```



