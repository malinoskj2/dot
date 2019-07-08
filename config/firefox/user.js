# Browser
user_pref( "browser.discovery.enabled", false );
user_pref( "browser.discovery.enabled", "https://duckduckgo.com" );
user_pref( "browser.tabs.drawInTitlebar", true )
user_pref( "browser.urlbar.placeholderName", "DuckDuckGo" )

// window opening prefs
user_pref( "browser.link.open_newwindow.override.external", 3 );
user_pref( "browser.link.open_newwindow.restriction", 1 );
user_pref( "browser.link.open_newwindow", 1 );

user_pref( "dom.battery.enabled", false );
user_pref( "device.sensors.enabled", false );


user_pref( "general.smoothScroll", false )

// Spellcheck everywhere
user_pref("layout.spellcheckDefault", 2);

// Opt-out of Shield studies and Normandy
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");

// Opt-out of Experiments
user_pref("network.allow-experiments", false);

// Disable Stuff
user_pref("extensions.screenshots.upload-disabled", true);
user_pref("plugin.state.flash", 0);

// Send a DO NOT TRACK (DNT) header
user_pref("privacy.donottrackheader.enabled", true);

// Turn on tracking protection and the corresponding UI
user_pref("privacy.trackingprotection.enabled", true);

// Turn on cryptomining protection
user_pref("privacy.trackingprotection.cryptomining.enabled", true);

// Turn on resist fingerprinting
user_pref("privacy.resistFingerprinting", true);

// Do not use the host PC's certificates, instead, use Firefox's built-in certificate list
user_pref("security.enterprise_roots.enabled", false);

// Disable autofill username and passwords in form fields
user_pref("signon.autofillForms", false);

// Disable pocket
user_pref("browser.pocket.enabled", false);
user_pref("extensions.pocket.enabled", false);

// Enable WebM
user_pref("media.mediasource.webm.enabled", true);

// Performance
// mem cache
user_pref("browser.cache.memory.enable", true);
user_pref("browser.cache.memory.capacity", 1048576);   // 1GB
user_pref("browser.cache.memory.max_entry_size", -1);
// disable disk cache
// Disable disk cache
user_pref("browser.cache.disk.enable", false);
user_pref("browser.cache.disk.capacity", 0);
user_pref("browser.cache.disk.max_entry_size", 0);
user_pref("browser.cache.disk.smart_size.enabled", false);
user_pref("browser.cache.disk.smart_size.first_run", false);
user_pref("browser.cache.disk_cache_ssl", false);
