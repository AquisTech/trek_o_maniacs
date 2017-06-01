class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_errors_for(object)
    render 'layouts/errors', locals: { object: object }
  end
end
