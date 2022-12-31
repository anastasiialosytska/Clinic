RSpec.describe DoctorVisitsController, type: :controller do
  let(:user) { create(:user) }
  let!(:doctor) { create(:doctor) }

  before { login(user) }

  describe 'POST #create' do
    it 'saves a new doctor visit in the database' do
      expect { post :create, params: { doctor_visit: { doctor_id: doctor.id } } }.to change(DoctorVisit, :count).by(1)
    end

    it 'redirect to user show view' do
      post :create, params: { doctor_visit: { doctor_id: doctor.id } }
      expect(response).to redirect_to user
    end

    it 'has http status OK' do
      expect(response).to have_http_status(:ok)
    end
  end
end
