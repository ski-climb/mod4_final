require 'rails_helper'

describe "mark a link as unread", :js => true do
  context "User is logged in" do
    let!(:user) { create(:user) }
    let!(:link) { create(:link, user: user) }
    before do
      log_in_as_user(user)
      visit root_path
      click_on "Mark as Read"
    end

    context "a link has been marked as read" do
      it "Mark a link as unread" do
        expect(Link.first.read).to be true
        expect(page).to have_content("Mark as Unread")
        click_on "Mark as Unread"

        expect(page).to have_content("Mark as Read")
        expect(Link.first.read).to be false
      end
    end
  end
end
