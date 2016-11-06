class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #skip_before_filter :verify_authenticity_token
  #protect_from_forgery with: :null_session

  # ログイン後の遷移先
  def after_sign_in_path_for(resource)
    tops_index_path
  end

  # ログアウト後の遷移先
  def after_sign_out_path_for(resource)
    root_path
  end

end
