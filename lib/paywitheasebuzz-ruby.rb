require 'active_support'
require 'active_support/core_ext'
require 'paywitheasebuzz-ruby/helper'
require 'paywitheasebuzz-ruby/request'
require 'paywitheasebuzz-ruby/payment'


module Easebuzz	
	class << self
		attr_accessor :key, :salt, :env, :request
	end

	def self.init(key, salt, env='test')
		self.key = key
		self.salt = salt
		self.env = env
		self.request = Request.new(self.env)
	end
end