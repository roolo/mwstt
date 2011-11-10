require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user locale should not be nil" do
    assert_not_nil users(:testing_user).locale
  end
end
