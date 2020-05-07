module AthleteHelper
  def build_locale(locale, switch_locale = nil)
    switch_locale.present? ? switch_locale : locale
  end
end