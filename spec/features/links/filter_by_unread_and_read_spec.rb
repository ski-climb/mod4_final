require 'rails_helper'

describe "filtering by read vs unread links", :js => true do
  context "User is logged in and has both a read and unread link" do
    let!(:user) { create(:user) }
    let!(:read_link) { create(:link, user: user, read: true) }
    let!(:unread_link) { create(:link, user: user, read: false) }
    before do
      log_in_as_user(user)
      visit root_path
    end

    it "shows only unread links" do
      expect(page).to have_content read_link.title
      expect(page).to have_content unread_link.title

      click_on "Unread Links Only"

      expect(page).to have_content unread_link.title
      expect(page).not_to have_content read_link.title
    end

    it "shows only read links" do
      expect(page).to have_content read_link.title
      expect(page).to have_content unread_link.title

      click_on "Read Links Only"

      expect(page).to have_content read_link.title
      expect(page).not_to have_content unread_link.title
    end
  end
end
