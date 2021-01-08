source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'puma', '~> 4.1'
gem 'pg'
gem 'rtesseract'
gem 'rack-cors'
gem 'redis'
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'simplecov', :require => false
  gem 'pry-rails'
  gem 'brakeman', require: false
end

group :development do
  gem 'listen', '~> 3.2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
