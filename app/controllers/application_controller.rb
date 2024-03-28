class ApplicationController < ActionController::Base

  # 管理者、ユーザーのログインを分岐
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_root_path
    when User
      root_path
    else
      root_path
    end
  end
end
