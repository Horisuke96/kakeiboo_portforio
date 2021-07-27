module ApplicationHelper

  def full_title(title = "")
    base_title = "家計boo"
      if admin_signed_in?
      base_title + "|" + "(管理者) #{title}"
      else
      base_title + "|" + "#{title}"
      end
  end

  def full_name(user_id)
    user = User.find_by(id: user_id)
    user.last_name + user.first_name
  end

  def kana_full_name(user)
    user.kana_last_name + user.kana_first_name
  end

end