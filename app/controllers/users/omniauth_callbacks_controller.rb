class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  def twitter
    callback_from :twitter
  end

  def facebook
    callback_from :facebook
  end

  def google
    callback_from :google
  end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  def passthru
    super
  end

  # GET|POST /users/auth/twitter/callback
  def failure
    super
  end

  protected

  # The path used when OmniAuth fails
  def after_omniauth_failure_path_for(scope)
    super(scope)
  end

  private

  def callback_from(provider)
    #logger.debug "=== [provider] ==: #{provider.inspect}"
    #logger.debug "=== [request.env] ==: #{request.env['omniauth.auth']}"

    provider = provider.to_s
    auth = request.env['omniauth.auth']
    # ユーザデータを取得、存在しなければ登録
    @user = User.find_for_oauth(auth)
    
    if @user.persisted? # 保存済みかどうかチェック
      sign_in_and_redirect @user, event: :authentication # Devise::Controllers::Helpers#sign_in_and_redirect
      # redirect_to @user => redirect_to after_sign_in_path_for(id: @user.id) => redirect_to after_sign_in_path_for(id: @user.to_param)

      #flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      set_flash_message(:notice, :success) if is_navigational_format?
      session['sns_data'] = {
        name: auth.info.name,
        nickname: auth.info.nickname,
        provider: provider
      }
      #logger.debug "===[sns_data1]==: #{session['sns_data'].inspect}"
    else
      session["devise.#{provider}_data"] = auth
      redirect_to new_user_registration_url
    end
  end
end
