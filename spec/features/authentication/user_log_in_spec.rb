require 'rails_helper'

describe "User login" do
  let!(:valid_user) { create(:user) }
  let(:bad_password) { "not_going_to_work" }

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
    it "does not log the user in when given a bad password" do
      visit login_path
      fill_in "Email", with: valid_user.email
      fill_in "Password", with: bad_password
      click_on "Log in"

      expect(page).to have_current_path(login_path)
      expect(page).to have_content "Email and password combination is not valid"
      expect(page).not_to have_content "Sign Out"
    end
  end

  context "given missing credentials" do
    it "does not log the user in when missing the email" do
      visit login_path
      fill_in "Email", with: ""
      fill_in "Password", with: bad_password
      click_on "Log in"

      expect(page).to have_current_path(login_path)
      expect(page).to have_content "Email and password combination is not valid"
      expect(page).not_to have_content "Sign Out"
    end

    it "does not log the user in when missing the password" do
      visit login_path
      fill_in "Email", with: valid_user.email
      fill_in "Password", with: ""
      click_on "Log in"

      expect(page).to have_current_path(login_path)
      expect(page).to have_content "Email and password combination is not valid"
      expect(page).not_to have_content "Sign Out"
    end
  end

  context "given valid credentials" do
    let!(:link_1) { create(:link, user: valid_user) }
    let!(:link_2) { create(:link, user: valid_user) }

    before do
      visit login_path
      fill_in "Email", with: valid_user.email
      fill_in "Password", with: valid_user.password
      click_on "Log in"
    end

    it "logs the user in" do
      expect(page).to have_current_path(user_links_path(valid_user))
      expect(page).to have_content "Successfully signed in"
      expect(page).to have_content "Sign Out"
    end

    it "displays the links for that user" do
      expect(page).to have_content link_1.title
      expect(page).to have_content link_2.title
    end
  end
end
