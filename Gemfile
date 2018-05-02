source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
# ruby '2.3.3'
gem 'rails', '~> 5.1.4'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'administrate'
gem 'bootstrap', '~> 4.0.0'
gem 'bourbon'
gem 'kaminari'
gem 'paperclip', '~> 5.2.1'
gem 'devise'
gem 'devise-i18n'
gem 'high_voltage'
gem 'jquery-rails'
gem 'pg'
gem 'slim-rails'
gem 'rqrcode'
gem 'composite_primary_keys'
gem "simple_calendar", "~> 2.0"
gem 'phonelib', "~> 0.6.18"
gem 'wdm', '>= 0.1.0' if Gem.win_platform?


group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'capistrano', '~> 3.0.1'
  gem 'capistrano-bundler'
  gem 'capistrano-rails', '~> 1.1.0'
  gem 'capistrano-rails-console'
  gem 'capistrano-rvm', '~> 0.1.1'
  gem 'rails_layout'

end

group :development, :test do
  gem 'guard'
  gem 'guard-rspec'
  gem 'faker'
  # gem 'guard-rubocop'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rubocop'
  gem 'rspec-rails', '~> 3.7'
  # gem "factory_girl", "~> 4.0"
  gem "factory_bot_rails", "~> 4.0"
end
