# frozen_string_literal: true

RSpec.describe 'DoctorVisit', :js, type: :feature do
  let!(:doctor_visit) { create :doctor_visit }
  let!(:doctor) { doctor_visit.doctor }

  describe '#update' do
    before do
      sign_in(doctor)
      visit doctor_path(doctor)
      click_on 'Give a prescription'
    end

    context 'with valid input' do
      let(:valid_prescription) { Faker::Lorem.characters(number: 30) }

      before do
        fill_in class: 'js-textarea', with: valid_prescription
        click_on 'Save prescription'
      end

      it { expect(page).to have_content valid_prescription }
    end

    context 'with invalid input' do
      let(:invalid_prescription) { Faker::Lorem.characters(number: 10) }

      before do
        fill_in class: 'js-textarea', with: invalid_prescription
        click_on 'Save prescription'
      end

      it { expect(page).to have_content 'Appointment must be at least 20 characters long' }
    end
  end
end
