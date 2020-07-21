module CollectionHelper
  def build_enum_collection(collection, description = nil)
    collection.map {|position, index| [t("#{description}.#{position}"), index]}
  end

  def build_preview_collection
    Refinery::Previews::Preview.active.last(3)
  end
end