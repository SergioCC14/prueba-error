module ApplicationHelper

  # Date: [yyyy, mm]
  def show_date date
    Date.new(date[0], date[1]).to_datetime.strftime("%B %Y")
  end
end
