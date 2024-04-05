# frozen_string_literal: true

# name: discourse-geo-customization
# about: add geo location to current_user
# meta_topic_id: TODO
# version: 0.0.1
# authors: Jay Pfaffman
# url: GPL
# required_version: 3.1.0

enabled_site_setting :geo_customization_enabled

module ::GeoCustomizationModule
  PLUGIN_NAME = "discourse-geo-customization"
end

require_relative "lib/geo_customization_module/engine"

after_initialize do
  add_to_serializer(:current_user, :geo_location) do
    begin
      if SiteSetting.geo_enable_admin_override && object.admin ||
           object.ip_address == "127.0.0.1" || object.ip_address == "::1"
        object.ip_address = SiteSetting.geo_admin_ip_address.split("|").first.split("-").first.strip
      end
    rescue => e
      Rails.logger.error("Error in geo_customization IP override: #{e}")
    end
    begin
      DiscourseIpInfo.get(object.ip_address)
    rescue => e
      Rails.logger.error("Error in geo_customization getting IP address: #{e}")
      nil
    end
  end
end
