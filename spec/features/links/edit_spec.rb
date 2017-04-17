require 'rails_helper'

describe "Editing an existing link" do
  context "a link exists in the database for the user" do
    let!(:user) { create(:user) }
    let!(:existing_link) { create(:link, user: user) }
    before do 
      log_in_as_user(user)
      visit root_path
      click_on "Edit"
      expect(page).to have_current_path edit_link_path(existing_link)
    end

    it "cannot be saved when the url is missing" do
      fill_in "URL", with: ""
      click_on "Update Link"

      expect(page).to have_content "Url can't be blank"
    end

    it "cannot be saved when the title is missing" do
      fill_in "Title", with: ""
      click_on "Update Link"

      expect(page).to have_content "Title can't be blank"
    end

    it "cannot be saved when the URL is invalid" do
      fill_in "URL", with: "no bueno"
      click_on "Update Link"

      expect(page).to have_content "Url is not a valid URL"
    end

    it "can be saved with valid attributes" do
      fill_in "Title", with: "cats"
      fill_in "URL", with: "http://www.cats.com"
      click_on "Update Link"

      expect(page).to have_current_path(root_path)
      expect(page).to have_content "Link successfully updated"
    end
  end
end
