module MainHelper
  def build_employees_collection
    Refinery::Employees::Employee.take(4)
  end

  def build_news_collection
    Refinery::Items::Item.take(4)
  end
end