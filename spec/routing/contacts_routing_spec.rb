require "rails_helper"

RSpec.describe ContactsController, type: :routing do

  # https://github.com/plataformatec/devise/wiki/How-To:-Test-controllers-with-Rails-3-and-4-%28and-RSpec%29#authenticated-routes-in-rails-3
  describe "unauthenticated routes" do

    it "routes to #new" do
      expect(:get => "/contacts/new").to route_to("contacts#new")
    end

    it "routes to #create" do
      expect(:post => "/contacts").to route_to("contacts#create")
    end

  end

end
