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

  describe "url validation" do
    context "given an invalid url" do
      let(:bad_url) { build(:link, url: 'bad') }

      it "returns false" do
        expect(bad_url.valid?).to be false
      end
    end

    context "given a valid url" do
      let(:good_url) { build(:link, url: 'http://example.com') }

      it "returns true" do
        expect(good_url.valid?).to be true
      end
    end
  end

  describe ".most_recent" do
    let!(:old_link) { create(:link, created_at: 4.weeks.ago, updated_at: 2.weeks.ago) }
    let!(:new_link) { create(:link, created_at: 5.weeks.ago, updated_at: 1.day.ago) }

    it "returns links most recent first, oldest last according to updated_at" do
      expect(Link.most_recent.first).to eq new_link
      expect(Link.most_recent.last).to eq old_link
    end
  end
end
