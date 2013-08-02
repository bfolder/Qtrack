source 'https://rubygems.org'

# Rails 3.2
gem 'rails', '3.2.13'
gem 'therubyracer'

# Authentication via Device & CanCan
gem 'devise'
gem 'cancan'

#  Database stuff: use sqlite in dev mode and mysql2 in production
group :development, :test do
	gem 'sqlite3'
end

group :production do
	gem 'mysql2'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'