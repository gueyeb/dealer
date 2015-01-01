class CreateAdminService
  def call
    user = User.find_or_create_by!(email: ENV["ADMIN_EMAIL"]) do |user|
      user.name = ENV["ADMIN_NAME"]
      user.password = ENV["ADMIN_PASSWORD"]
      user.password_confirmation = ENV["ADMIN_PASSWORD"]
      user.confirm!
    end
  end
end
