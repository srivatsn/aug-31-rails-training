require 'test_helper'

class ProducerTest < ActiveSupport::TestCase
  test "producer is valid" do
    producer = create(:producer, name: "Steven Spielberg", age: 73)
    create_list(:movie, 3, producer: producer)
    assert_equal "Steven Spielberg", producer.name
    assert_equal 73, producer.age
    assert producer.movies.present?
    assert_equal 3, producer.movies.count
  end
end
