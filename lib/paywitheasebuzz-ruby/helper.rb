require 'digest'
module Easebuzz
    class Helper
        def self.generate_hash(data, key, salt)
            hash_sequence = "#{key}|#{data['txnid']}|#{data['amount']}|#{data['productinfo']}|#{data['firstname']}|#{data['email']}|#{data['udf1']}|#{data['udf2']}|#{data['udf3']}|#{data['udf4']}|#{data['udf5']}|#{data['udf6']}|#{data['udf7']}|#{data['udf8']}|#{data['udf9']}|#{data['udf10']}|#{salt}"
            Digest::SHA512.hexdigest(hash_sequence).downcase
        end

        def self.generate_reverse_hash(data, key, salt)
            hash_sequence = "#{key}|#{data['txnid']}|#{data['amount']}|#{data['productinfo']}|#{data['firstname']}|#{data['email']}|#{data['udf1']}|#{data['udf2']}|#{data['udf3']}|#{data['udf4']}|#{data['udf5']}|#{data['udf6']}|#{data['udf7']}|#{data['udf8']}|#{data['udf9']}|#{data['udf10']}|#{salt}"
            Digest::SHA512.hexdigest(hash_sequence).downcase
        end
    end
end