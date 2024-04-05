# **Geo Customization** Plugin

**Adds geo location to current_user serializer**

If `SiteSetting.geo_include_country_code` is enabled, the ISO country code (as returned by Maxmind) 
will be added to the `<body>` class like "country-US". You can then use this class to hide/display
text on the site.

`SiteSetting.geo_include_city` similarly adds something like 

Here is a trival example of using this plugin

Create a theme compnent and add this to the CSS:
```
/* Hide both divs by default */
.location-us-content, 
.location-default-content {
  display: none; 
}

/* Show the US div when the "location-US" class is on the body */
body.country-US .location-us-content {
  display: block; 
}

/* Show the default div when the "location-US" class is NOT on the body */
body:not(.country-US) .location-default-content {
  display: block;
}

```

Add this to the `After Header`:
```
<body class="location-US"> 
  <div class="location-us-content">
  This is text for the US
    </div>

  <div class="location-default-content">
  This is everyone else's text
    </div>
</body>
```
## Testing

To facilitate testing, `SiteSetting.geo_enable_admin_override` and `SiteSetting.geo_admin_ip_address` can 
be used to override the actual user IP address. Three examples are included. Anything after a `-` in the ip address setting will be ignored (making it easier to tell what to expect from the sample IP addresses).
