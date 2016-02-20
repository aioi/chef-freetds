source 'https://rubygems.org'

if RUBY_VERSION =~ /^1\.9\..*/
  gem 'varia_model', '~> 0.4.0' # Workaround for berkshelf/berkshelf#1464
end

gem 'berkshelf', '~> 3.3.0'

group :lint do
  gem 'foodcritic', '~> 4.0'
  gem 'rubocop',    '~> 0.37.2'
end

group :integration do
  gem 'test-kitchen', '~> 1.2.1'
  gem 'kitchen-vagrant', '~> 0.15'
end
