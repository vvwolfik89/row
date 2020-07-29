module CollectionHelper
  def build_enum_collection(collection, description = nil)
    collection.map {|position, _| [t("#{description}.#{position}"), position]}
  end

  def build_preview_collection
    Refinery::Previews::Preview.active.last(3)
  end

  def build_services_collection
    collection = Refinery::Services::Service.active.with_inline
    collection.map do |service|
      name = "#{service.title} - #{service.coast} " + t('coast') + "!!!"
      link_to(name, "/services/#{service.id}", style: 'color: red; font-size: 16px; font-weight: 600')
    end.join('    ')
  end
end