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

  # 合計金額の計算
  def total_amount(totals)
    amount = 0
    totals.each do |total|
      amount  +=  total.amount
    end
    return amount
  end


end