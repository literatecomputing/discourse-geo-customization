import { apiInitializer } from "discourse/lib/api";

export default apiInitializer((api) => {
  const siteSettings = api.container.lookup("service:site-settings");
  const geo = api.getCurrentUser()?.geo_location;

  if (!geo) {
    return;
  }

  if (siteSettings.geo_include_country_code && geo.country_code) {
    document.body.classList.add(`country-${geo.country_code}`);
  }

  if (siteSettings.geo_include_city && geo.city) {
    document.body.classList.add(`city-${geo.city.replace(/\s+/g, "-")}`);
  }
});
