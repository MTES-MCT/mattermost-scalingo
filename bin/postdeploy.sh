#!/bin/bash
# usage: /app/mattermost/bin/postdeploy

export MM_SERVICESETTINGS_LISTENADDRESS=":${PORT}"

echo '1'

plugins_list=$(find /app/mattermost/postdeploy_plugins/. -maxdepth 1 -name '*.tar.gz' | tr '\n' ',')

echo '2'

for plugin in $(echo "$plugins_list" | tr ',' '\n')
do
  /app/mattermost/bin/mattermost plugin add "$plugin"
done

echo '3'

plugins_list_2=$(find /app/postdeploy_plugins/. -maxdepth 1 -name '*.tar.gz' | tr '\n' ',')

for plugin in $(echo "$plugins_list_2" | tr ',' '\n')
do
  /app/mattermost/bin/mattermost plugin add "$plugin"
done

echo '4'