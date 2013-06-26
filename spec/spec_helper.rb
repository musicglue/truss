require 'rubygems'
ENV['RACK_ENV'] = 'test'

module SharedContext
  def self.included(klass)
    klass.class_eval <<-RUBY
      require 'rack'
      require 'rspec'
      require 'truss-router'
      require 'active_support'

      RSpec.configure do |config|
          config.treat_symbols_as_metadata_keys_with_true_values = true
          config.run_all_when_everything_filtered = true
          config.filter_run :focus
          config.backtrace_clean_patterns << /gems/
          config.order = 'random'
      end

      Dir['spec/support.*.rb'].each { |file| require file }
    RUBY
  end
end

if defined?(PLATFORM) && PLATFORM =~ /java/
  include SharedContext
else
  require 'spork'
  Spork.prefork do
    include SharedContext
  end

  Spork.each_run do
    require 'truss'
  end
end