# frozen_string_literal: true

RSpec.describe Category, type: :model do
  subject { create(:category) }

  it { is_expected.to have_many(:doctors) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
end
