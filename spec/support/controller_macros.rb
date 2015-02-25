module ControllerMacros

  # https://github.com/plataformatec/devise/wiki/How-To:-Test-controllers-with-Rails-3-and-4-%28and-RSpec%29
  def login_admin
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:admin]
      admin = create :admin
      sign_in :user, admin # sign_in(scope, resource)
    end
  end

end