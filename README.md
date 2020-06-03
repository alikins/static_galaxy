How to host an ansible galaxy server as static content

Quickstart
==========

git clone this repo somewhere, say /www/data/static\_galaxy

```
$ cd /www/data
$ git clone git@github.com:alikins/static_galaxy.git
```

Point a web server to serve static content from
/www/data/static\_galaxy

For ex, for nginx, use conf/nginx/defaults.d/static\_galaxy.conf,
update the 'root' for location / ('/home/adrian/src/static\_galaxy'
by default, but for this example, change it to /var/www/static\_galaxy/)

Cp that static\_galaxy.conf to /etc/nginx/default.d/static\_galaxy.conf

(Or wherever your nginx config lives...)

Restart nginx

```
$ sudo systemctl restart nginx   # or whatever your favorite boutique tool is
```

Configure ansible to point to the server (assuming localhost:80 here) and
url prefix /api/automation-hub

ie, and ansible.cfg like:

```
[galaxy]
server_list = static

[galaxy_server.static]
url=http://localhost/api/automation-hub/
```

Then use ansible-galaxy to install stuff from this example static
repo.

```
$ ansible-galaxy collection install alikins.collection_inspect
```

Ansible config
==============
See <a href="blob/master/conf/ansible.cfg">conf/ansible.cfg</a> for an
example ansible.cfg.


nginx config
============

See <a href="blob/master/conf/nginx/defaults.d/static_galaxy.conf">conf/nginx/defaults/static_galaxy.conf</a>
for an example of a nginx config that turns a local dir /home/adrian/src/static\_galaxy/
into a "server" usable by ansible-galaxy.


test / example script
=====================

See tests/test-ansible-galaxy.sh


File system layout
==================

```
static_galaxy/
├── api
│   └── automation-hub
│       ├── index.json
│       └── v3
│           ├── artifacts
│           │   └── collections
│           │       ├── automation-hub
│           │       │   ├── alikins-collection_inspect-0.0.182.tar.gz
│           │       │   ├── alikins-collection_inspect-0.0.213.tar.gz
│           │       │   ├── alikins-collection_inspect-0.0.217.tar.gz
│           │       │   └── alikins-collection_ntp-0.1.182.tar.gz
│           │       └── staging
│           ├── collections
│           │   └── alikins
│           │       ├── collection_inspect
│           │       │   └── versions
│           │       │       ├── 0.0.213
│           │       │       │   └── index.json
│           │       │       ├── 0.0.217
│           │       │       │   └── index.json
│           │       │       └── index.json
│           │       └── collection_ntp
│           │           └── versions
│           │               ├── 0.1.182
│           │               │   └── index.json
│           │               └── index.json
│           └── index.json
├── content
│   ├── automation-hub
│   │   └── collections -> ../../api/automation-hub/v3/collections
│   ├── big_partner
│   └── staging
├── errors
│   ├── 404.json
│   └── 500.json
```
