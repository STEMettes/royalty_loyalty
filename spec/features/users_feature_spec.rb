require 'rails_helper'

context "user not signed in and on the homepage" do
  it "should see a 'sign in' link and a 'sign up' link" do
    visit('/')
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
  end

  it "should not see 'sign out' link" do
    visit('/')
    expect(page).not_to have_link('Sign out')
  end
end

context "user signed in on the homepage" do

  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    fill_in('Dob', with: '1987-06-03')
    fill_in('Username', with: 'test')
    fill_in('Name', with: 'Stem Ette')
    fill_in('County', with: 'Essex')
    click_button('Sign up')
  end

  it "should see 'sign out' link" do
    expect(page).to have_link('Sign out')
    expect(page).to have_link('test@example.com')
  end

  it "should not see a 'sign in' link and a 'sign up' link" do
    visit('/')
    expect(page).not_to have_link('Sign in')
    expect(page).not_to have_link('Sign up')
  end

  context "user clicks on name in header" do
    it "navigates to correct user profile" do
      click_link('test@example.com')
      user = User.find_by(email: 'test@example.com')
      expect(current_path).to eq "/users/#{user.id}"
    end
  end


end
