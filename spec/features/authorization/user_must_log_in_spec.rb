require 'rails_helper'

describe "user who is not logged in" do
  it "gets redirected to the login page when trying to access unauthorized page" do
    visit root_path

    expect(page).to have_current_path(login_path)
    expect(page).not_to have_content "Sign Out"
  end
end
