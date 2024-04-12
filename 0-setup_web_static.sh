#!/usr/bin/env bash
# Set up an nginx server to host a website with it's content
apt -y update
apt -y install nginx
service nginx start
mkdir -p /data/web_static/releases/
mkdir -p /data/web_static/shared/
mkdir -p /data/web_static/releases/test/
test_content=$(cat << 'EOF'
<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>
EOF
)
echo "$test_content" > /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test/ /data/web_static/current
chown -R ubuntu:ubuntu /data
sed -i "0,/server {/s/server {/server {\n\tlocation \/hbnb_static {\n\t\talias \/data\/web_static\/current;\n\t}/" /etc/nginx/sites-available/default
nginx -s reload
