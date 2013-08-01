class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def redirect_after_delay(url, delay, step_count)
    @redirect_url = url
    @redirect_delay = delay
    @step_count = step_count
    render
  end
  
end
