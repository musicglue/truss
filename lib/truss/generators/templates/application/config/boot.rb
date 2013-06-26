app_requires = File.join(Truss.root, "app", "**", "*.rb")

Dir["#{app_requires}"].each { |file| require file }

require File.join(Truss.root, "config", "routes.rb")