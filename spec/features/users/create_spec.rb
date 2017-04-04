require 'rails_helper'

describe "Creating a new user" do
  let(:valid_user) { build(:user) }
  let!(:already_registered_user) { create(:user, email: "taken@example.com") }

  context "is unsuccessful" do
    it "when no email is provided" do
      visit new_user_path
      fill_in "Email", with: ""
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Create User"

      expect(page).to have_content "Email can't be blank"
    end

    it "when no password is provided" do
      visit new_user_path
      fill_in "Email", with: valid_user.email
      fill_in "Password", with: ""
      fill_in "Password confirmation", with: ""
      click_on "Create User"

      expect(page).to have_content "Password can't be blank"
    end

    it "when password and password confirmation do not match" do
      visit new_user_path
      fill_in "Email", with: valid_user.email
      fill_in "Password", with: "pass"
      fill_in "Password confirmation", with: ""
      click_on "Create User"

      expect(page).to have_content "Password confirmation doesn't match Password"
    end

    it "when email is already taken" do
      visit new_user_path
      fill_in "Email", with: already_registered_user.email
      fill_in "Password", with: "pass"
      fill_in "Password confirmation", with: "pass"
      click_on "Create User"

      expect(page).to have_content "Email has already been taken"
    end
  end

  context "is successful when valid credentials are provided" do
    it "successfully creates a user and signs them in" do
      visit new_user_path
      fill_in "Email", with: "valid@example.com"
      fill_in "Password", with: "pass"
      fill_in "Password confirmation", with: "pass"
      click_on "Create User"

      user = User.find_by(email: "valid@example.com")
      expect(page).to have_content "Sign Out"
      expect(page).to have_current_path(root_path)
    end
  end
end
