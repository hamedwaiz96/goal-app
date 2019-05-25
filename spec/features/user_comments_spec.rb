require 'rails_helper'

feature "Making a new User Comment" do
  before(:each) do
    visit new_user_url
    fill_in 'Email', :with => "kharhime2"
    fill_in 'Password', :with => "bouyknock"
    click_on "Sign Up!"
    click_on "Sign Up"
    fill_in 'Email', :with => "myaccount@domain.com"
    fill_in 'Password', :with => 'mypassword'
    click_on "Sign Up!"
    fill_in 'Email', :with => "kharhime2"
    fill_in 'Password', :with => "bouyknock"
    click_on "Login"
  end
  scenario "Have comment form on user show page" do
    expect(page).to have_content("Comment")
  end

  scenario "User Comment shows up on user show page" do
    fill_in 'Comment', :with => 'This is a great user!'
    click_on "Add New Comment"
    expect(page).to have_content("This is a great user!")
  end

end
