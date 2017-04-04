require 'rails_helper'

describe User do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to have_secure_password }

  it { is_expected.to have_many(:links) }
end
