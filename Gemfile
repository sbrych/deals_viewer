source "https://rubygems.org"

ruby "2.6.3"
gem "rails", "~> 5.2.3"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "bootsnap", ">= 1.1.0", require: false
gem "envied"
gem "faraday"
gem "jbuilder", "~> 2.5"
gem "pipeline_deals"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "webpacker"

group :development, :test do
  gem "dotenv-rails"
  gem "pry-rails"
  gem "pry-remote"
  gem "rspec-rails"
  gem "rubocop", "~> 0.58.2", require: false
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end
