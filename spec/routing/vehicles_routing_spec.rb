require 'rails_helper'

RSpec.describe VehiclesController, type: :routing do
  # https://github.com/plataformatec/devise/wiki/How-To:-Test-controllers-with-Rails-3-and-4-%28and-RSpec%29#authenticated-routes-in-rails-3
  describe 'unauthenticated routes' do
    it 'routes to #index' do
      expect(get: '/vehicles').to route_to('vehicles#index')
    end

    it 'routes to #show' do
      expect(get: '/vehicles/1').to route_to('vehicles#show', id: '1')
    end
  end
end
