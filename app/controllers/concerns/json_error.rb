module JSONError
  extend ActiveSupport::Concern

  def render_error(message, status = 400)
    render json:{message:message}, status:status
  end
end
