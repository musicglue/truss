require "truss/version"
require "truss-router"
require "truss/config"
require "truss/helpers"
require "truss/endpoint"


module Truss
  extend Forwardable
  class << self
    attr_accessor :config
    
    [:root, :environment].each do |meth|
      define_method(meth) do
        begin
          config.__send__(meth)
        rescue NoMethodError
          self.config ||= Config.new
          restart
        end
      end
    end

  end

  def self.configure(&block)
    return nil unless block_given?
    
    self.config ||= Config.new
    yield(config)
  end

end
