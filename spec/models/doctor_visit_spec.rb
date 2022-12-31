# frozen_string_literal: true

RSpec.describe DoctorVisit, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:doctor) }

  it { is_expected.to validate_length_of(:appointment).is_at_least(20).on(:update) }
end
