require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get event_create_path
    assert_response :success
  end
  
end
