require 'thor/group'
require 'active_support/core_ext/string/strip'
require 'active_support/inflector/methods'
require 'active_support/core_ext/object/blank'

module Truss
    module Generators
        class Application < Thor::Group
            include Thor::Actions

            argument :application_path, type: :string

            def initialize(*args)
                raise Thor::Error, "No Application Name supplied. Please run: truss --help" if args[0].blank?
                super
            end

            def self.source_root
                @_source_root ||= File.expand_path("../templates/application", __FILE__)
            end

            def self.banner
                "truss new #{self.arguments.map(&:usage).join(' ')} [options]"
            end

            def create_root
                self.destination_root = File.expand_path(application_path, destination_root)
                valid_const?

                empty_directory '.'
                FileUtils.cd(destination_root)
            end

            def create_root_files
                template 'config.ru'
                template 'Gemfile'
                # template 'application.rb'

                empty_directory "public"
                empty_directory "public/javascripts"
                empty_directory "public/stylesheets"
                empty_directory "public/images"
            end

            def create_config
                empty_directory "config"
                inside "config" do
                    template "routes.rb"
                    template "boot.rb"
                end
            end

            def create_home_endpoint
                empty_directory "app/endpoints"

                inside "app/endpoints" do
                    template "home_endpoint.rb"
                end
            end

            protected
            def app_name
                @app_name ||= File.basename(destination_root)
            end

            def app_const
                @app_const ||= "#{app_const_base}::Application"
            end

            def app_const_base
                @app_const_base ||= ActiveSupport::Inflector.camelize(app_name.gsub(/\W/, '_').squeeze('_'), true)
            end

            def valid_const?
                if app_const =~ /^\d/
                    raise Thor::Error, "Invalid application name #{app_name}. Don't use numbers. kthnxbi"
                elsif Object.const_defined?(app_const_base)
                    raise Thor::Error, "Invalid application name #{app_name}. Ruby wants that name"
                end
            end
        end
    end
end
