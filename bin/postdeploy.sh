#!/bin/bash
# usage: /app/mattermost/bin/postdeploy

export MM_SERVICESETTINGS_LISTENADDRESS=":${PORT}"
info "postdeploy"
plugins_list=$(find /app/mattermost/postdeploy_plugins/. -maxdepth 1 -name '*.tar.gz' | tr '\n' ',')
info $plugins_list
for plugin in $(echo "$plugins_list" | tr ',' '\n')
do
  info $plugin
  /app/mattermost/bin/mattermost plugin add "$plugin"
done
