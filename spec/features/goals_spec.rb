require 'rails_helper'

feature "New Goals" do
  before(:each) do
    visit new_user_url
    fill_in "Email", :with => "kharhime"
    fill_in "Password", :with => "ghulghul"
    click_on "Sign Up!"
    fill_in "Email", :with => "kharhime"
    fill_in "Password", :with => "ghulghul"
    click_on "Login"
    click_on "Look at all Public Goals"
    click_on "Add New Goal"
  end

  scenario "Should have new page template" do
    expect(page).to have_content("New Goal")
  end

  scenario "redirects to show page after new goal" do
    fill_in 'Title', :with => 'khar'
    fill_in 'Details', :with => "I am a khar"
    find(:css, "#private[value='true']").set(true)
    find(:css, "#uncomplete[value='false']").set(true)
    click_on "Submit New Goal"
    expect(page).to have_content("Show Page")
  end

end

feature "Editing Goals" do
  before(:each) do
    visit new_user_url
    fill_in "Email", :with => "kharhime"
    fill_in "Password", :with => "ghulghul"
    click_on "Sign Up!"
    fill_in "Email", :with => "kharhime"
    fill_in "Password", :with => "ghulghul"
    click_on "Login"
    click_on "Look at all Public Goals"
    click_on "Add New Goal"
    fill_in 'Title', :with => 'hello'
    fill_in 'Details', :with => "I am a person"
    find(:css, "#private[value='true']").set(true)
    find(:css, "#uncomplete[value='false']").set(true)
    click_on "Submit New Goal"
  end

  scenario "Have an editing page" do
    goal = Goal.find_by(:content => 'hello')
    click_on "Edit Goal"
    expect(page).to have_content("Edit")
  end

  scenario "Redirect to show page after editing" do
    goal = Goal.find_by(:content => 'hello')
    click_on "Edit Goal"
    expect(page).to have_content("I am a person")
    fill_in "Title", :with => "Bouy"
    fill_in "Details", :with => "I like people"
    click_on "Edit Goal"
    expect(page).to have_content("Bouy")
    expect(page).not_to have_content("hello")
  end

end

feature "Deleting a Goal" do
  before(:each) do
    visit new_user_url
    fill_in "Email", :with => "kharhime"
    fill_in "Password", :with => "ghulghul"
    click_on "Sign Up!"
    fill_in "Email", :with => "kharhime"
    fill_in "Password", :with => "ghulghul"
    click_on "Login"
    click_on "Look at all Public Goals"
    click_on "Add New Goal"
    fill_in 'Title', :with => 'hello'
    fill_in 'Details', :with => "I am a person"
    find(:css, "#private[value='true']").set(true)
    find(:css, "#uncomplete[value='false']").set(true)
    click_on "Submit New Goal"
  end

  scenario "Deletes the goal" do
    goal = Goal.find_by(:content => 'hello')
    click_on "Delete"
    expect(page).not_to have_content("hello")
  end

end
