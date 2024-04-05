# frozen_string_literal: true

module ::GeoCustomizationModule
  class Engine < ::Rails::Engine
    engine_name PLUGIN_NAME
    isolate_namespace GeoCustomizationModule
    config.autoload_paths << File.join(config.root, "lib")
  end
end
