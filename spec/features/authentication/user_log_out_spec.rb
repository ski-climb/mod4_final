require 'rails_helper'

describe "User logs out" do
  let!(:user) { create(:user) }

  context "when a user is signed in" do
    it "they can log out" do
      visit login_path
      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      click_on "Log in"

      expect(page).to have_selector(:link_or_button, "Sign Out")

      click_on "Sign Out"

      expect(page).to have_current_path(login_path)
      expect(page).not_to have_content "Sign Out"
      expect(page).to have_selector(:link_or_button, "Log in")
    end
  end
end
