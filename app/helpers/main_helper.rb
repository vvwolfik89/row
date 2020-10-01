module MainHelper
  def build_employees_collection
    Refinery::Employees::Employee.order("RAND()").limit(4)
  end

  def build_news_collection
    Refinery::Items::Item.order('created_at DESC').take(4)
  end

  def count_employees
    Refinery::Employees::Employee.count
  end

  def grouped_athletes(type)
    data = Refinery::Athletes::Athlete.group(:rowing_type).count
    data[type]
  end

  def grouped_national_coaches
    Refinery::Coaches::Coach.where(national_coach: true).count
  end

  def parthers_collection
    Refinery::Partners::Partner.active
  end
end