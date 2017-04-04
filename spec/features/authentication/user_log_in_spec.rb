require 'rails_helper'

describe "User login" do
  context "user is not registered" do
    it "does not log the visitor in" do
      visit login_path
      fill_in "Email", with: "not_registered@test.com"
      fill_in "Password", with: "password"
      click_on "Log in"

      expect(page).to have_current_path(login_path)
      expect(page).to have_content "Email and password combination is not valid"
      expect(page).not_to have_content "Sign Out"
    end
  end

  context "given invalid credentials" do
    it "does not log the user in" do

    end
  end

  context "given valid credentials" do
    it "logs the user in when valid credentials are provided" do

    end
  end
end
