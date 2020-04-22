module CollectionHelper
  def build_enum_collection(collection, description = nil)
    collection.map {|position, _| [t("#{description}.#{position}"), position]}
  end
end