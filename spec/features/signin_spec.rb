require 'rails_helper'
require 'capybara/rspec'

feature "signing in" do
  let(:user) {FactoryGirl.create(:user)}

  def fill_in_signin_fields
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: hacker.password
    click_button "Log in"
  end
  scenario "visiting the site to sign in" do
    visit 'welcome#index'
    click_link "Sign in"
    fill_in_signin_fields
    expect(page).to have_content("Signed in successfully")

  end
end
