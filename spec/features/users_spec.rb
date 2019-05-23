require 'rails_helper'

feature 'the signup process' do
  before(:each) {
    visit new_user_url
    fill_in 'Email', :with => 'kharhime2@yahoo.com'
    fill_in 'Password', :with => 'goodmorning'
    click_on 'Sign Up!'
  }
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content("New user")
  end
end

feature 'Logging in' do
  before(:each) {
    visit new_user_url
    fill_in 'Email', :with => 'kharhime2@yahoo.com'
    fill_in 'Password', :with => 'goodmorning'
    click_on 'Sign Up!'
  }
  scenario 'shows username on the homepage after login' do
    visit new_session_url
    fill_in 'Email', :with => 'kharhime2@yahoo.com'
    fill_in 'Password', :with => 'goodmorning'
    click_on 'Login'
    expect(page).to have_content ("kharhime2@yahoo.com")
  end
end

feature 'Logging out' do
  before(:each) {
    visit new_user_url
    fill_in 'Email', :with => 'kharhime2@yahoo.com'
    fill_in 'Password', :with => 'goodmorning'
    click_on "Sign Up!"
  }
  scenario "begins with a logged out state" do
    visit new_session_url
    expect(page).to have_content("Login")
  end

  scenario "doesn't show username on the homepage after logout" do
    visit new_session_url
    fill_in 'Email', :with => 'kharhime2@yahoo.com'
    fill_in 'Password', :with => 'goodmorning'
    click_on 'Login'
    expect(page).to have_content('kharhime2@yahoo.com')
    click_on 'Logout'
    expect(page).not_to have_content('kharhime2@yahoo.com')

  end

end
