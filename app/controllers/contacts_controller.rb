class ContactsController < ApplicationController
  def new
    @contact = ContactForm.new
  end

  def create
    @contact = ContactForm.new(contact_params)
    if @contact.valid?
      # send contact email
      logger.warn "Sending email from: #{@contact.email}"
      redirect_to new_contact_path, notice: 'Message was sent'
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :message)
  end
end
