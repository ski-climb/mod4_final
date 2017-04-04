require 'rails_helper'

describe "User can only view their own links" do
  let!(:user_1) { create(:user) }
  let!(:user_2) { create(:user) }
  let!(:link_11) { create(:link, user: user_1) }
  let!(:link_12) { create(:link, user: user_1) }
  let!(:link_21) { create(:link, user: user_2) }
  let!(:link_22) { create(:link, user: user_2) }
  let!(:link_23) { create(:link, user: user_2) }

  context "given more than one user exists who has links" do
    before do
      visit login_path
      fill_in "Email", with: user_1.email
      fill_in "Password", with: user_1.password
      click_on "Log in"
    end

    it "an authenticated user can only see their own links" do
      expect(page).to have_content link_11.title
      expect(page).to have_content link_12.title
      expect(page).not_to have_content link_21.title
    end
  end
end
