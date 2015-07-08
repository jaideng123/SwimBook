class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate
  def authenticate
      authenticate_or_request_with_http_basic("YMCA") do |name, password|
        name == ENV["GEN_USERNAME"] && password == ENV["GEN_PASSWORD"]
      end
    end
end
