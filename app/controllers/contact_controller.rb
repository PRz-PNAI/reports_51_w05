class ContactController < ApplicationController
  def new
    @contact = ContactForm.new
  end

  def create
    @contact = ContactForm.new(contact_params[:contact])
    if @contact.valid?
      # send contact email
      logger.warn "Sending email from: #{@contact.email}"
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :message)
  end
end
