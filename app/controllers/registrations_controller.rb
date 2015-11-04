class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  def new
    super
  end

  def create
    super
    temp = @user.email.scan(/\w+\.edu/).first
    @user.uni = temp[0..-5].upcase unless temp.nil?
    @user.save
  end

  def update
    super
  end

  def update_about
    @user = current_user
    @user.update_attributes!(:about => about_update_params[:about])
    @user.save
    redirect_to root_path
  end

  def about_update_params
    params.require(:user).permit(:about)
  end
  private

  def sign_up_params
    params.require(:user).permit(:first, :last, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first, :last, :password, :password_confirmation, :current_password, :about)
  end



end
