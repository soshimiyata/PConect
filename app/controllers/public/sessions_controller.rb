class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]

  private
  # アクティブであるかを判断するメソッド
  def user_state
     # 【処理内容1】 入力されたemailからアカウントを1件取得
    user = User.find_by(email: params[:user][:email])
     # 【処理内容2】 アカウントを取得できなかった場合、このメソッドを終了する
    return if user.nil?
     # 【処理内容3】 取得したアカウントのパスワードと入力されたパスワードが一致していない場合、このメソッドを終了する
    return unless user.valid_password?(params[:user][:password])
     # 【処理内容4】 アクティブでない会員に対する処理
    unless user.active?
     # アカウントが無効な場合にログインを拒否し、エラーメッセージを表示
      flash[:alert] = "ログインできないユーザーです"
      redirect_to new_user_session_path and return
    end
  end
end
