#!/bin/bash

set -e

#sed -i "s/localhost:9200/$ES/g" /opt/kibana-4.1.1-linux-x64/config/kibana.yml
#echo "" >> /opt/kibana-4.1.1-linux-x64/config/kibana.yml
#echo "kibana_elasticsearch_username: $ES_USER" >> /opt/kibana-4.1.1-linux-x64/config/kibana.yml
#echo "kibana_elasticsearch_password: $ES_PASS" >> /opt/kibana-4.1.1-linux-x64/config/kibana.yml

# if [ "$KIBANA_SECURE" = "true" ] ; then
# 	ln -s /etc/nginx/sites-available/kibana-secure /etc/nginx/sites-enabled/kibana
# 	htpasswd -bc /etc/kibana/htpasswd ${KIBANA_USER} ${KIBANA_PASSWORD}
# else
# 	ln -s /etc/nginx/sites-available/kibana /etc/nginx/sites-enabled/kibana
# fi
# sed -i "s/kibana:5601/$HOSTNAME:5601/g" /etc/nginx/sites-enabled/kibana
#/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
#
rm /tmp/.X1* -rf
sed -i "s/HERE\/chrome\"\  \"\$\@\".*/&\ --user-data-dir\ \$HOME/g" /opt/google/chrome/google-chrome
exec /usr/bin/supervisord -n
