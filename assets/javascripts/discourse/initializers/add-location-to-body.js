import { withPluginApi } from "discourse/lib/plugin-api";

export default {
  initialize(container) {
    const siteSettings = container.lookup("service:site-settings");
    withPluginApi("0.11.4", (api) => {
      const user = api.getCurrentUser();
      const body = document.querySelector('body');
      if (user) {
        if (siteSettings.geo_include_country_code){ 
          body.classList.add(`country-${user.geo_location.country_code}`)
        }
        if (siteSettings.geo_include_city) {
          body.classList.add(`city-${user.geo_location.city}`)
        };
      }
    })
  }
}
