class BaseSweeper < ActionController::Caching::Sweeper
  observe ActiveRecord::Base

  def after_save(object)
    # ..... call to version class for record saving purpose
  end

end