ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'faker'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  # parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include FactoryBot::Syntax::Methods
  FactoryBot.reload

  FactoryBot.define do
    factory :movie do
      title { Faker::Movie.title }
      year  { Faker::Date.backward(days:10000).year }
      plot_keywords { Faker::Lorem.words }
    end
  end
end
