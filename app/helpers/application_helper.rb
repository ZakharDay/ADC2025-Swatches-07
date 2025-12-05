module ApplicationHelper

  def username(user)
    user.profile.name == '' ? user.email : user.profile.name
  end
  
end
