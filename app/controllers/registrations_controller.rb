class RegistrationsController < ApplicationController
  def new
    @registration = RegistrationForm.new
  end

  def create
    @registration = RegistrationForm.new(reg_params)
    if @registration.valid?
      logger.warn "Registration is valid!"
      # TODO: put creating user and topic here!
    else
      render :new
    end
  end

  private

  def reg_params
    params.require(:registration).permit(:first_name, :last_name, :title, :topic_name, :email, :password, :password_confirmation, :title, :topic)
  end
end
