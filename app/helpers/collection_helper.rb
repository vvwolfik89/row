module CollectionHelper
  def build_enum_collection(collection, description = nil)
    collection.map {|position, _| [t("#{description}.#{position}"), position]}
  end

  def build_preview_collection
    Refinery::Previews::Preview.active.last(3)
  end
end