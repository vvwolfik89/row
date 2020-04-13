require 'refinerycms-core'

module Refinery
  autoload :ItemsGenerator, 'generators/refinery/items_generator'

  module Items
    require 'refinery/items/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [root.join('spec', 'factories').to_s]
      end
    end
  end
end
