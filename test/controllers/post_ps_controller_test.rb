require 'test_helper'

class PostPsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get post_ps_index_url
    assert_response :success
  end

end
