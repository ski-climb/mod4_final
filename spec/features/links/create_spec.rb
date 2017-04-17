require 'rails_helper'

describe "Creating links", :js => true do
  context "as an authenticated user" do
    let!(:user) { create(:user) }
    before do
      log_in_as_user(user)
    end

    it "does not create a new link when the url or title is missing" do
      fill_in "URL", with: ""
      fill_in "Title", with: ""
      click_on "Add Link"

      expect(page).to have_content "Url can't be blank"
      expect(page).to have_content "Title can't be blank"
      expect(Link.count).to eq 0
    end

    it "does not create a new link when the url is invalid" do
      fill_in "URL", with: "pretty sure this isn't legit"
      fill_in "Title", with: "It looked OK to me"
      click_on "Add Link"

      expect(page).to have_content "Url is not a valid URL"
      expect(Link.count).to eq 0
    end
  end
end
