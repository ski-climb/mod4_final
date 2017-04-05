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

      expect(page).to have_content "cats" 
      expect(page).to have_content "dogs" 
    end

    it "does not create a new link when the url is invalid" do
      fail
    end


  end
end
