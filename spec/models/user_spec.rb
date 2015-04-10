require 'rails_helper'

RSpec.describe User, type: :model do

  let (:user) {User.new}

  it "should start with zero points" do
    expect(user.points).to eq 0
  end

  it "should be able to add points" do
    user.add(10)
    expect(user.points).to eq 10
  end

end
