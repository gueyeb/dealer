require 'rails_helper'

RSpec.describe VehiclesController, type: :controller do
  context 'unauthenticated actions' do
    describe 'GET #index' do
      it 'renders the :index template' do
        get :index
        expect(response).to render_template(:index)
      end

      it 'lists all the vehicles' do
        vehicle1 = create :vehicle
        vehicle2 = create :vehicle
        get :index
        expect(assigns(:vehicles)).to match_array([vehicle1, vehicle2])
      end

      it 'does NOT list inactive vehicles' do
        vehicle1 = create :vehicle
        inactive_vehicle = create(:vehicle, active: false)
        get :index
        expect(assigns(:vehicles)).to_not include(inactive_vehicle)
      end
    end

    describe 'GET #show' do
      it 'renders the :show template' do
        vehicle = create :vehicle
        get(:show, id: vehicle.id)
        expect(response).to render_template(:show)
      end

      it 'renders the vehicle' do
        vehicle = create :vehicle
        get(:show, id: vehicle.id)
        expect(assigns(:vehicle)).to eq(vehicle)
      end
    end
  end
end
