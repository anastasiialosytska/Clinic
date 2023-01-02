# frozen_string_literal: true

RSpec.describe Doctor, type: :model do
  subject { create(:doctor) }

  it { is_expected.to have_many(:doctor_visits) }
  it { is_expected.to have_many(:users) }
  it { is_expected.to belong_to(:category) }

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:phone_number) }
  it { is_expected.to validate_uniqueness_of(:phone_number).case_insensitive }

  it { is_expected.to allow_value('111-111-1111').for(:phone_number) }
  it { is_expected.not_to allow_value('11111').for(:phone_number) }
end
