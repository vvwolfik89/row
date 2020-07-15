module CollectionHelper
  def build_enum_collection(collection, description = nil)
    collection.map {|position, index| [t("#{description}.#{position}"), index]}
  end
end