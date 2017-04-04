require 'rails_helper'

describe Link do
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_presence_of(:title) }

  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "read or unread attribute" do
    let!(:link) { create(:link) }

    it "defaults to false" do
      expect(link.read).to be false
    end

    it "can be set to true" do
      link.read = true

      expect(link.read).to be true
    end
  end
end
