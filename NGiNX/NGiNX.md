# Nginx installation using pkg manager

        * ssh root@ip-of-remote-machine
        * apt install nginx

        * systemctl start nginx
        * systemctl status nginx
        *  ifconfig 

# Installation using source code
        * ssh root@ip-of-remote-machine
        * apt-get update
        * wget nginx-download-link # https://nginx.org/download/nginx-1.21.1.tar.gz
        * wget https://nginx.org/download/nginx-1.21.1.tar.gz
        ![image](https://user-images.githubusercontent.com/75510135/128177664-722d6837-69a1-48b5-b41e-432a2f492c55.png)
        * tar -zxvf tar-file-name 
        * cd nginx-1.21.1
        * apt-get install build-essential
        * ./configure
        * install PCR libs
        * ./configure
        * ./configure # http://nginx.org/en/docs/configure.html
          --sbin-path=/usr/local/nginx/nginx
          --conf-path=/usr/local/nginx/nginx.conf
          --pid-path=/usr/local/nginx/nginx.pid
          --with-http_ssl_module
          --with-pcre=../pcre-8.44
          --with-zlib=../zlib-1.2.11
        * make
        * make install
        * nginx -v
        * nginx
        * ps -ef | grep nginx
        # list master/worker process
        * ifconfig => curl http://ip-address
        
# Building NGINX from Source Code

1. Update Packages

  * Ubuntu - apt-get update
  * CentOS - yum update

2. Download the NGINX source code from nginx.org
  * https://nginx.org/download/nginx-1.19.1.tar.gz

3. Unzip the file.
  * tar -zxvf nginx-1.19.1.tar.gz

4. Configure source code to the build.
  * ./configure

4. Install code compiler
  * Ubuntu : apt-get install build-essential
  * CentOS : yum groupinstall "Development Tools"

5. Configure source code to the build.
  * ./configure

6. GET Support Libraries
  * Ubuntu : apt-get install libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev make
  * CentOS : yum install pcre pcre-devel zlib zlib-devel openssl openssl-devel make

7. Execute configuration again
  * ./configure --sbin-path=/usr/bin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --with-pcre --pid-path=/var/run/nginx.pid --with-http_ssl_module

8. Compile and install Nginx
  * make    

# Add NGINX As Service in OS

Add NGINX Process in Systemd Services to make the WebServer Resilient.

1. NGINX Init Services File.
  * https://www.nginx.com/resources/wiki/start/topics/examples/systemd/


2. Start Service
  * systemctl start nginx

3. Stop Service
  * systemctl stop nginx

4. Restart-Service
  * systemctl restart nginx

5. Check Service Status
  * systemctl status nginx

6. Enable service, auto-start on boot
  * systemctl enable nginx 

# Add NGiNX as Service
* https://www.nginx.com/resources/wiki/start/topics/examples/systemd/
![image](https://user-images.githubusercontent.com/75510135/128181776-ada65880-d26b-44d1-867c-cd9131d2a30f.png)
 
 * touch /lib/systemd/system/nginx.service
 * vi /lib/systemd/system/nginx.service
 * paste given script
 **minor changes in the default script**
![image](https://user-images.githubusercontent.com/75510135/128182263-28cad09c-4479-4498-b268-b4a7e74d424d.png)
 * nginx
 * systemctl start nginx
 * systemctl status nginx
![image](https://user-images.githubusercontent.com/75510135/128182963-5b48bcca-1c3f-4c9a-9193-11340495dac5.png)
 * **systemctl enable nginx**

**NGiNX help***
* nginx -h

# Text Direction : Configure NGINX as Reverse Proxy

1. Update the Package Manager

apt-get update


2. Download and Install the NGINX Server

apt-get -y install nginx


3. Install the Net-tools (Optional)

apt-get install net-tools


3. Install php-fpm on any single Box.

apt-get -y install php-fpm


4. Configure the Nginx conf for PHP Machine.

    user www-data;
     
    server{
    	listen 80;
    	server_name <IP Of Machine>;
     
    	index index.php index.html;
     
    	location ~\.php {
    		include fastcgi.conf;
    		fastcgi_pass unix:/run/php/<php fpm sock path>
    	}
    }


index.php file content

<?php phpinfo(); ?>


5. Setup Reverse Proxy. Set-up the Nginx conf file.

    server {
      listen 80;
      server_name <IP Of Machine>;
     
      location /  {
           proxy_pass http://<IP domain of First Application Server>;
    	}
    }
     
    server {
      listen 8080;
      server_name <IP Of Machine>;
     
      location ~\.php  {
           proxy_pass http://<IP domain of PHP Application Server>;
    	}
    }

       
 
# Use of X-Real-IP Directive

1. Go to NGINX directory and execute below command to find the module.

./configure --help | grep realip


2. Get the earlier configuration via command

nginx -V


3. Configure the Nginx again. If your configuration is different you need to choose yours.

    ./configure --sbin-path=/usr/bin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --with-pcre --pid-path=/var/run/nginx.pid --with-http_ssl_module --with-http_image_filter_module=dynamic --modules-path=/etc/nginx/modules --with-http_realip_module

4. Rebuild Nginx

make


5. Install NGINX

make install


6. Check NGINX process

    ps -ef | grep nginx

7. Check New Configuration is added or not.

nginx -V


8. Edit the reverse proxy NGINX conf file location block. Add below Directives

    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;


9. Reload the reverse proxy NGINX.


10. Update the Application Server NGINX conf file and add below log format in the server block.

    	log_format specialLog '$http_x_real_ip - $remote_user [$time_local]  '
                              '"$request" $status $body_bytes_sent '
                              '"$http_referer" "$http_user_agent"  $remote_addr';
     
        access_log /var/log/nginx/access-special.log specialLog;
        access_log /var/log/nginx/access.log;
        error_log /var/log/nginx/error.log;

11. Reload the reverse proxy NGINX.

# Micro Cache in NGINX

1. Install Apache Bench -

apt-get -y install apache2-utils (Unix)

yum install httpd-tools (Centos)


2. Check Installation

ab


3. Php File, we used-

    <?php sleep(1); ?>
    <h1> Today's Date : <?php echo date("l js F"); ?> </h1>


4. Hit 200 request with 20 Connection on Nginx using bench-

ab -n 200 -c 20 <DEFINE YOUR URL>


5. NGINX Configuration File - (You need to update server name and other related content)

                                user www-data;
                                worker_processes auto;
                                load_module /etc/nginx/modules/ngx_http_image_filter_module.so;
                                events {
                                worker_connections 1024;
                                }
                                http {
                                    include mime.types;
                                   fastcgi_cache_path /tmp/cache_nginx levels=1:2 keys_zone=ZONE_1:100m inactive=60m;
                                   fastcgi_cache_key "$scheme$request_method$host$request_uri";
                                   add_header X-Cache $upstream_cache_status;
                                    server {
                                   listen 80;
                                   server_name 104.131.80.130;
                                   root /bloggingtemplate/;
                                   index index.php index.html;
                                   location / {
                                                 try_files $uri $uri/ =404;
                                   }
                                   location ~\.php$ {
                                                 # Pass php requests to the php-fpm service (fastcgi)
                                                 include fastcgi.conf;
                                                 fastcgi_pass unix:/run/php/php7.2-fpm.sock;	
                                          fastcgi_cache ZONE_1;
                                          fastcgi_cache_valid 200 60m;
                                   }
                                    }
                                }
       
       




