module ApplicationHelper
  def display_data(data)
    if data.blank?
      "記入なし"
    else
      data
    end
  end
end
