require 'refinerycms-core'

module Refinery
  autoload :SportRowingsGenerator, 'generators/refinery/sport_rowings_generator'

  module SportRowings
    require 'refinery/sport_rowings/engine'

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
