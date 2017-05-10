class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :add_initial_breadcrumbs

  private
  
  def add_initial_breadcrumbs
    breadcrumbs.add :home, root_path
  end
end
