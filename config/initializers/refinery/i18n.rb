# encoding: utf-8

Refinery::I18n.configure do |config|
  config.default_locale = :ru

  config.current_locale = :ru

  config.default_frontend_locale = :ru

  config.frontend_locales = [:en, :ru, :be]

  config.locales = {:en => "English", :fr => "Français", :nl => "Nederlands", :pt => "Português", :"pt-BR" => "Português brasileiro", :da => "Dansk", :nb => "Norsk Bokmål", :sl => "Slovenian", :es => "Español", :ca => "Català", :it => "Italiano", :de => "Deutsch", :lv => "Latviski", :ru => "Русский", :sv => "Svenska", :pl => "Polski", :"zh-CN" => "简体中文", :"zh-TW" => "繁體中文", :el => "Ελληνικά", :rs => "Srpski", :cs => "Česky", :sk => "Slovenský", :ja => "日本語", :bg => "Български", :hu => "Hungarian", :uk => "Українська", :be => "Беларускі"}
end