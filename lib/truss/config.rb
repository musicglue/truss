module Truss
  class Config < ActiveSupport::OrderedOptions
    def initialize(*args)
      super
      self.root        = FileUtils.pwd 
      self.environment = (ENV['RACK_ENV'] || :development).to_sym
    end
  end
end