module ControllerHelpers
  def sign_in(user)
    if user.nil?
      render json: user, status: :unauthorized
    else
      token = JsonWebToken.encode(user_id: user.id)
      time = Time.now + 24.hours.to_i
      request.headers["Authorization"] =  token
    end
  end
end
