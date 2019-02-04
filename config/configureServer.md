# Setup linode server
 apt-get update && apt-get upgrade
 scp iptables.* root@74.208.186.162:~/.
 mv iptables.conf /etc/.
 mv iptables.service /etc/systemd/system/.
systemctl enable iptables
systemctl start iptables


apt-get install mysql-server
systemctl enable mysql.service

# mysql
## Set root password
mysqladmin -p -u root version
mysql -u root -p
CREATE USER 'gopherface'@'%' IDENTIFIED BY 'gopherface';
mysql> CREATE DATABASE IF NOT EXISTS `gopherfacedb` DEFAULT CHARACTER SET `utf8` COLLATE `utf8_unicode_ci`;

 GRANT ALL ON gopherfacedb.* TO 'gopherface' IDENTIFIED BY 'gopherface';
 flush privileges;
 scp gfdbdump.sql root@74.208.186.162:~/.
 mysql -u gopherface -p gopherfacedb < gfdbdump.sql
 mysql -u gopherface  -p gopherfacedb
 show tables;
 select * from user;

 UPDATE mysql.user SET Password=PASSWORD(‘Bizerk’) WHERE user=”gopherface” AND Host=”gopherface”;
 
 
 # nginx

  apt-get install nginx
  systemctl status nginx

  scp nginx.conf root@74.208.186.162:~/.

# Lets encrypt certificates
ACME Certificate Management

apt-get install git
 git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt



 cd /opt/letsencrypt
./letsencrypt-auto certonly --standalone -d gopherface.jaynejacobs.com
cd /etc/letsencrypt/live/
ls gopherface.jaynejacobs.com/

change nginx cert directory to /etc/letsencrypt/live/gopherface.jaynejacobs.com/

systemctl restart nginx
systemctl status nginx

```cd "/Users/jjacob151/go/src/gopherface"
  500  export GOOS=linux
  501  export GOARCH=amd64
  502  export GOPHERFACE_APP_ROOT=$PWD
  503  echo $GOPHERFACE_APP_ROOT

PASML-335382:gopherface jjacob151$ go build -o $GOPHERFACE_APP_ROOT/builds/gopherface-linux64
PASML-335382:gopherface jjacob151$ file  builds/gopherface-linux64
builds/gopherface-linux64: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, not stripped
```

## References:
https://golang.org/doc/install/source#exportironmemt


# Deploying gopherface
cd $GOPHERFACE_APP_ROOT/client

$ cd $GOPHERFACE_APP_ROOT/client
$ gopherjs build --verbose -m -o $GOPHERFACE_APP_ROOT/static/js/client.min.js

We are now ready to create a deployment bundle, a tarball, which includes the igweb Linux binary along with the static folder. We create the tarball by issuing the following commands:
$ cd $GOPHERFACE_APP_ROOT
$ tar zcvf /tmp/bundle.tgz builds/gopherface-linux64 static templates

At this point, we now have a production deployment bundle that is ready to be deployed to the Linode instance.

scp /tmp/bundle.tgz root@74.208.186.162:/tmp

chown gopherface /tmp/bundle.tgz
su gopherface

cd ~
mkdir gopherface
cd gopherface
mv /tmp/bundle.tgz .
mv builds/gopherface-linux64 ./gopherface
gopherface@gopherface:~/gopherface$ ls
builds  bundle.tgz  gopherface  static  templates

vi ~/.bashrc

export GOPHERFACE_APP_ROOT="home/gopherface/gopherface"
export GOPHERFACE_HASH_KEY="CRKVBJs0kfyeQ9Y1"
export GOPHERFACE_BLOCK_KEY="9LtmRLzVH27CwxrO"


## Docker setup
apt-get install  && dmsetup mknodes
### add gpg key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

apt-key fingerprint 0EBFCD88
pub   4096R/0EBFCD88 2017-02-22
      Key fingerprint = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid                  Docker Release (CE deb) <docker@docker.com>

Follow ubuntu directions

Install docker compose
curl -L https://github.com/docker/compose/releases/download/1.24.0-rc1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose


chmod +x /usr/local/bin/docker-compose