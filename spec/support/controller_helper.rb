module ControllerHelper
  def sign_in_as(user)
    user = User.where(login: user.to_s).first if user.is_a?(Symbol)
    request.session[:user] = user.id
  end
end
