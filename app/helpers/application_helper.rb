module ApplicationHelper

  def full_name(user_id)
    user = User.find_by(id: user_id)
    user.last_name + user.first_name
  end

end
