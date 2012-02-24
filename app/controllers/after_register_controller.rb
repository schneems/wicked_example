class AfterRegisterController < Wicked::WizardController
  before_filter :authenticate_user!

  steps :add_zip, :add_twitter

  def show
    @user = current_user
    case step
    when :add_twitter
      skip_step if @user.zip.blank?
    end
    render_wizard
  end

  def update
    @user = current_user
    @user.update_attributes(params[:user])
    render_wizard @user
  end

end
