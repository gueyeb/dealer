class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create!(contact_params)
    ContactMailer.contact_us(@contact).deliver_later
    flash[:success] = 'Your message has been sent.'
    redirect_to root_path
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
