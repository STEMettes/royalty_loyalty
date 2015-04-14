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
    Event.create(name: 'Hackathon', code: 'Makers')
  end

  it "should see check out link" do
    visit('/')
    # click_button('check out')
    click_link('check out')
    expect(page).to have_content('Event Check out')
  end

  it 'should know when event checkout code is incorrect' do
    visit('/checkout')
    fill_in 'SecretCode', with: 'Orange'
    click_button ('Submit')
    expect(page).to have_content("Incorrect event code please try again")
  end

    it 'should know when an event code is correct' do
    visit('/checkout')
    fill_in 'SecretCode', with: 'Makers'
    click_button 'Submit'
    expect(current_path).to eq('/post_survey')
  end


end