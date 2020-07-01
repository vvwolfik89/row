module MainHelper
  def build_employees_collection
    Refinery::Employees::Employee.take(4)
  end
end