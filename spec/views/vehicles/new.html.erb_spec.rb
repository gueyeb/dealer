require 'rails_helper'

RSpec.describe 'vehicles/new', type: :view do
  before(:each) do
    assign(:vehicle, create(:vehicle))
  end

  it 'renders new vehicle form' do
    render

    assert_select 'form[method=?]', 'post' do
      assert_select 'input#vehicle_vin[name=?]', 'vehicle[vin]'
      assert_select 'input#vehicle_year[name=?]', 'vehicle[year]'
      assert_select 'input#vehicle_make[name=?]', 'vehicle[make]'
      assert_select 'input#vehicle_model[name=?]', 'vehicle[model]'
      assert_select 'input#vehicle_trim[name=?]', 'vehicle[trim]'
      assert_select 'input#vehicle_mileage[name=?]', 'vehicle[mileage]'
      assert_select 'input#vehicle_exterior_color[name=?]', 'vehicle[exterior_color]'
      assert_select 'input#vehicle_interior_color[name=?]', 'vehicle[interior_color]'
      assert_select 'input#vehicle_transmission[name=?]', 'vehicle[transmission]'
      assert_select 'input#vehicle_body_style[name=?]', 'vehicle[body_style]'
      assert_select 'input#vehicle_drivetrain[name=?]', 'vehicle[drivetrain]'
      assert_select 'input#vehicle_engine[name=?]', 'vehicle[engine]'
      assert_select 'textarea#vehicle_options[name=?]', 'vehicle[options]'
      assert_select 'textarea#vehicle_comments[name=?]', 'vehicle[comments]'
      assert_select 'input#vehicle_asking_price[name=?]', 'vehicle[asking_price]'
    end
  end
end
