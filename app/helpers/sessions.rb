helpers do
  def currentUser
    User.find(session[:id]) if session[:id]
  end
end