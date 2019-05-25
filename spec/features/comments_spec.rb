require 'rails_helper'

feature "Making a new Goal Comment" do
  before(:each) do
    visit new_user_url
    fill_in 'Email', :with => "kharhime2"
    fill_in 'Password', :with => "bouyknock"
    click_on "Sign Up!"
    fill_in 'Email', :with => "kharhime2"
    fill_in 'Password', :with => "bouyknock"
    click_on "Login"
    click_on "Look at all Public Goals"
    click_on "Add New Goal"
    fill_in 'Title', :with => 'hello'
    fill_in 'Details', :with => "I am a person"
    find(:css, "#private[value='true']").set(true)
    find(:css, "#uncomplete[value='false']").set(true)
    click_on "Submit New Goal"

  end
  scenario "Have comment form on goal show page" do
    expect(page).to have_content("Comment")
  end

  scenario "Goal Comment shows up on goal show page" do
    fill_in 'Comment', :with => 'This is a great goal!'
    click_on "Add New Comment"
    expect(page).to have_content("This is a great goal!")
  end
end

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
