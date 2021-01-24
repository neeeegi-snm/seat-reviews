module ReviewsHelper
  def button_text
    if action_name == "new" || action_name == "create"
      "投稿する"
    elsif action_name == "edit" || action_name == "update"
      "更新する"
    end
  end
end
