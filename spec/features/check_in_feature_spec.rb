require 'rails_helper'

context "user signed in on the homepage" do

  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    fill_in('Dob', with: '1987-06-03')
    fill_in('Username', with: 'test')
    fill_in('Name', with: 'Test Test')
    fill_in('County', with: 'Essex')
    click_button('Sign up')
  end

  it "should see check in link" do
    visit('/')
    expect(page).to have_link('check in')
    expect(page).to have_link('check out')

  end
end