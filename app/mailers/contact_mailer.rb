class ContactMailer < ApplicationMailer
  default to: 'moffittmotorsinc@gmail.com'

  def contact_us(contact)
    @contact = contact
    mail(
      from: @contact.email,
      subject: @contact.subject
    )
  end
end
