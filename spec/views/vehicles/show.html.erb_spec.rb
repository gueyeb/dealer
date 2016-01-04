require 'rails_helper'

RSpec.describe 'vehicles/show', type: :view do
  before(:each) do
    @vehicle = assign(:vehicle, create(:vehicle))
  end

  it 'renders attributes' do
    render
    expect(rendered).to match(/Vin/)
    expect(rendered).to match(/Exterior Color/)
    expect(rendered).to match(/Interior Color/)
    expect(rendered).to match(/Transmission/)
    expect(rendered).to match(/Body Style/)
    expect(rendered).to match(/Drivetrain/)
    expect(rendered).to match(/Engine/)
  end
end
