class ContactsController < ApplicationController

  def create
    @contact = Contact.new(params[:name], params[:email], params[:subject], params[:message])
    ContactMailer.contact_us(@contact).deliver_now
    flash[:success] = 'Your message has been sent.'
    redirect_to root_path
  end

end
