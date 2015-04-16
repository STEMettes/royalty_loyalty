require 'rails_helper'

context "user signed in on the homepage" do

  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    fill_in('Date of Birth', with: '1987-06-03')
    fill_in('Username', with: 'test')
    fill_in('Name', with: 'Test Test')
    fill_in('County', with: 'Essex')
    click_button('Sign up')
    Event.create(name: 'Hackathon', code: 'Makers',date: Date.today)

  end

  it "should see check in link" do
    visit('/')
    expect(page).to have_link('Check in')
    expect(page).to have_link('Check out')
  end

  it 'should take the user to the check in page' do
    visit('/')
    click_link 'Check in'
    expect(current_path).to eq '/checkin'
    expect(page).to have_content 'EventCheck In'
  end

  it 'should know when an event code is incorrect' do
    visit('/')
    click_link 'Check in'
    fill_in 'SecretCode', with: 'Orange'
    click_button 'Submit'
    expect(page).to have_content 'Incorrect event code, please try again'
  end

  it 'should know when an event code is correct' do
    visit('/')
    click_link 'Check in'
    fill_in 'SecretCode', with: 'Makers'
    click_button 'Submit'
    expect(current_path).to eq '/survey'
  end

  it 'should know if the user has previously checked in to the same event' do
    visit('/')
    click_link 'Check in'
    fill_in 'SecretCode', with: 'Makers'
    click_button 'Submit'
    visit('/')
    click_link 'Check in'
    fill_in 'SecretCode', with: 'Makers'
    click_button 'Submit'
    expect(page).to have_content 'You have already checked in to this event'
  end


end


