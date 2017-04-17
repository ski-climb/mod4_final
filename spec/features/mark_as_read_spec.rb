require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  context "User is logged in" do
    let!(:user) { create(:user) }
    let!(:link) { create(:link, user: user) }
    before { log_in_as_user(user) }

    it "Mark a link as read" do
      visit "/"
      within('.link .read-status') do
        expect(page).to have_text("false")
      end

      click_on "Mark as Read"

      within('.link .read-status') do
        expect(page).to have_text("true")
      end

    end
  end
end
