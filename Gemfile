source 'https://rubygems.org'

# Specify your gem's dependencies in truss.gemspec
gemspec

group :test do
  gem "rspec"
  gem "pry",          platforms: :mri
  gem "pry-debugger", platforms: :mri
  gem "guard",        platforms: :mri
  gem "guard-spork",  platforms: :mri
  gem "guard-rspec",  platforms: :mri
end

platforms :mri do
  group :test_linux do
    gem 'libnotify',                      '>= 0.7.2'
    gem 'rb-inotify',                     '>= 0.8.8'
  end

  group :test_osx do
    gem 'rb-fsevent',                     '>= 0.9.0'
    gem "terminal-notifier",              '>= 1.4.2'
    gem 'terminal-notifier-guard',        '>= 1.5.3'
  end
end