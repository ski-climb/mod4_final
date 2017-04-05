class Link < ActiveRecord::Base
  validates :url, presence: true
  validates :title, presence: true

  belongs_to :user

  scope :most_recent, -> { order('updated_at desc') }
end
