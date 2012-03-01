module AdminSessionsHelper
  def sign_in(user)
    # implement
  end

  def signed_in?
    false
  end

  def signed_in_user
    unless signed_in?
      redirect_to admin_login_path, notice: "Please sign in."
    end
  end

end