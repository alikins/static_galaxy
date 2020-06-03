How to host an ansible galaxy server as static content


Ansible config
==============

See <a href="conf/ansible.cfg">conf/ansible.cfg</a> for an
example ansible.cfg.


nginx config
============

See <a href="conf/nginx/defaults.d/static_galaxy.conf">conf/nginx/defaults/static_galaxy.conf</a>
for an example of a nginx config that turns a local dir /home/adrian/src/static_galaxy/
into a "server" usable by ansible-galaxy.


File system layout
==================

```
static_galaxy/
├── api
│   ├── index.json
│   └── v3
│       ├── artifacts
│       │   └── collections
│       │       ├── automation-hub
│       │       │   ├── alikins-collection_inspect-0.0.182.tar.gz
│       │       │   ├── alikins-collection_inspect-0.0.213.tar.gz
│       │       │   ├── alikins-collection_inspect-0.0.217.tar.gz
│       │       │   └── alikins-collection_ntp-0.1.182.tar.gz
│       │       └── staging
│       ├── collections
│       │   └── alikins
│       │       ├── collection_inspect
│       │       │   └── versions
│       │       │       ├── 0.0.213
│       │       │       │   └── index.json
│       │       │       ├── 0.0.217
│       │       │       │   └── index.json
│       │       │       └── index.json
│       │       └── collection_ntp
│       │           └── versions
│       │               ├── 0.1.182
│       │               │   └── index.json
│       │               └── index.json
│       └── index.json
├── errors
│   ├── 404.json
│   └── 500.json
```
