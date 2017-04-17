require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  context "User is logged in" do
    let!(:user) { create(:user) }
    let!(:link) { create(:link, user: user) }
    before do
      log_in_as_user(user)
      visit root_path
    end

    it "Mark a link as read" do
      expect(page).to have_content("Mark as Read")
      within('.link .read-status') do
        expect(page).to have_content("false")
      end

      click_on "Mark as Read"

      expect(page).to have_content("Mark as Unread")
      within('.link .read-status') do
        expect(page).to have_content("true")
      end
    end
  end
end
