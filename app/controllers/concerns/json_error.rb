module JSONError
  extend ActiveSupport::Concern

  def render_error(message)
    render json:{message:message}
  end
end
