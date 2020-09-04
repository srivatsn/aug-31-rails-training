require 'test_helper'

class ActorTest < ActiveSupport::TestCase
  test "actor is in many movies" do 
    actor = create(:actor)

    create_list(:movie, 3, actors: [actor])
    
    assert_equal 3, actor.movies.count
  end
end
