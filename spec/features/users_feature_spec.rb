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
    @user = User.find_by(name: 'Stem Ette')
  end

  it "should see 'sign out' link" do
    expect(page).to have_link('Sign out')
    expect(page).to have_link('Stem')
  end

  it "should not see a 'sign in' link and a 'sign up' link" do
    visit('/')
    expect(page).not_to have_link('Sign in')
    expect(page).not_to have_link('Sign up')
  end

  context "user clicks on name in header" do
    it "navigates to correct user profile" do
      click_link('Stem')

      expect(current_path).to eq "/users/#{@user.id}"
    end

    it "displays the users details" do
      click_link('Stem')
      expect(page).to have_content("Stem Ette")
      expect(page).to have_content("test")
      expect(page).to have_content("1987-06-03")
      expect(page).to have_content("test@example.com")
      expect(page).to have_content("Essex")
      expect(page).to have_content("0 pts")
    end

    it "displays a link to edit user details" do
      click_link('Stem')
      expect(page).to have_link('Edit your profile')
    end

  context "clicking on 'Edit your profile'" do
    it "navigates to edit page" do
      click_link('Stem')
      click_link('Edit your profile')
      expect(current_path).to eq "/users/#{@user.id}/edit"
    end
  end

  end




end
