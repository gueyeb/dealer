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
        active_vehicle = create(:vehicle, active: true)
        inactive_vehicle = create(:vehicle, active: false)
        get :index
        expect(assigns(:vehicles)).to_not include(inactive_vehicle)
        expect(assigns(:vehicles)).to include(active_vehicle)
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

  context 'authenticated actions' do
    context 'non-admin users' do
      {new: :get, create: :post}.each do |action, meth|
        it "prevents non-admin users from accessing the #{action} action" do
          send(meth, action)
          expect(response).to redirect_to(root_url)
          expect(flash[:error]).to match(/^You are not an admin/)
        end
      end

      {edit: :get, update: :patch, destroy: :delete}.each do |action, meth|
        it "prevents non-admin users from accessing the #{action} action" do
          vehicle = create(:vehicle)
          send(meth, action, id: vehicle.id)
          expect(response).to redirect_to(root_url)
          expect(flash[:error]).to match(/^You are not an admin/)
        end
      end
    end

    context 'admin users' do
      login_admin

      describe 'GET #new' do
        it 'renders the :new template' do
          get :new
          expect(response).to render_template(:new)
        end

        it 'assigns a new Vehicle to @vehicle' do
          get :new
          expect(assigns(:vehicle)).to be_a_new(Vehicle)
        end
      end

      describe 'POST #create' do
        context 'with invalid attributes' do
          let(:invalid_attrs) { attributes_for(:vehicle).merge(year: 'a') }

          it 'does not save the new vehicle in the database' do
            expect {
              post(:create, vehicle: invalid_attrs)
            }.not_to change(Vehicle, :count)
          end

          it 're-renders the :new template' do
            post(:create, vehicle: invalid_attrs)
            expect(response).to render_template(:new)
          end

        end
      end

      describe 'GET #edit' do
        it 'assigns the requested vehicle to @vehicle' do
          vehicle = create(:vehicle)
          get :edit, id: vehicle.id
          expect(assigns(:vehicle)).to eq(vehicle)
        end

        it 'renders the :edit template' do
          vehicle = create(:vehicle)
          get :edit, id: vehicle.id
          expect(response).to render_template(:edit)
        end
      end

      describe 'PATCH #update' do
        before(:each) do
          @vehicle = create(:vehicle,
            year: 2000,
            make: 'Ford')
        end

        context 'with invalid attributes' do
          it "does not change the vehicle's attributes" do
            patch :update, id: @vehicle.id,
              vehicle: attributes_for(:vehicle,
                year: 2001,
                make: nil)
            @vehicle.reload
            expect(@vehicle.year).not_to eq(2001)
            expect(@vehicle.make).to eq('Ford')
          end
        end
      end

    end
  end

end
