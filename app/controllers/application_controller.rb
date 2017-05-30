class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user! # skip high voltage pages

  def render_errors_for(object)
    render 'layouts/errors', locals: { object: object }
  end
end
