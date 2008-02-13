class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  before_filter :login_required
    
  session :session_key => '_linthicum_session_id'

end
