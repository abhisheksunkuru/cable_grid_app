require 'test_helper'

class PaleteTest < ActiveSupport::TestCase
  test "the user not presence" do
    palete = Palete.new(code:"#4a61ba",row: 12,column:1)
    assert_not palete.save

  end

  test "the user presence" do
    user = User.create(username:"Anonympostest",ip_addr: "0.0.0.0")
    palete = Palete.new(code:"#4a61ba",row: 12,column:1,user: user)
    assert palete.save

  end
  test "the validation" do
    palete = Palete.new
    assert_not palete.valid?
    assert_equal [:user, :code, :row, :column, :user_id],palete.errors.keys
  end

  test "Return values" do
    user = User.create(username:"Anonympostest",ip_addr: "0.0.0.0")
    palete = Palete.create(code:"#4a61ba",row: 12,column:1,user: user)
    assert_equal [palete.code,"#{palete.user.username} #{palete.form_time_stamp}"],Palete.find_color_code_and_user_stamp(12,1)
  end
end
