# OpenStack

### an introduction
Gerard Braad

<span class="lightblue">me</span><span class="white">@gbraad</span><span class="orange">.nl</span>


## Thank you


## 21Vianet / Blue cloud


## Apology


## English only


## Who am I

  * <span class="orange">F/OSS</span>


## Who am I

  * <span class="lightblue">Fedora</span> Project  


## Who am I

  * <span class="red">OpenStack</span>


## Who am I

  * Tinkerer


## Who am I

  * ...


## OpenStack

![Diagram](img/openstack-software-diagram.png)


## What is OpenStack


## What is OpenStack

  * <span class="lightblue">project</span>


## Since 2010

A joint project
  * Rackspace Hosting  
    (Cloud Files)
  * NASA  
    (Nebula)

to bring 
_cloud-computing services running on standard hardware_.


## "Austin"

First community release followed 4 months later.

  * Object Storage  
    (Swift)
  * Compute
    (Nova)

[Source](https://wiki.openstack.org/wiki/ReleaseNotes/Austin)


## OpenStack Mission

_To produce a ubiquitous **Open Source Cloud Computing platform** that is **easy to use**, simple to implement, **interoperable between deployments**, works well at all scales, and **meets the needs of users and operators of both public and private clouds**_.


## OpenStack Mission

  ... let's review ...


## OpenStack Mission

  * Produce a ubiquitous
    _Open Source Cloud Computing_ platform


## Open Source

  *


## Cloud Computing

... is a model for enabling convenien, **on-demand network access to a shared pool of configurable computing resources**.

(eg. networks, servers, storage, applications, and services) **that can be rapidly provisioned and released** with minimal management effort or service provider interaction.

[Source](http://www.nist.gov/itl/cloud/)


## OpenStack Mission

  * Produce the ubiquitous
    _Open Source Cloud Computing_ platform
  * easy to use, simple to implement
  * works well at all scales


## OpenStack Mission

  * Produce the ubiquitous
    _Open Source Cloud Computing_ platform
  * easy to use, simple to implement
  * works well at all scales
  * interoperable
  * meet the needs


## Why would people need OpenStack

  * Agility
  * Continuous Delivery
  * Scalability
  * DevOps


## As an application developer,
I want to deploy and run an application on the internet so that my customers all over the world can consume it.


## As an operator,
I want to deploy the application across multiple clouds so that my service survives issues in any one of them.


## As a compliance officer,
I want to deploy and run an application in a location of my choosing so that I can comply with regulatory demands.


## Why would people need OpenStack

  * Legal reasons
    * regional / jurisdiction
    * PII


## OpenStack Mission

  * Produce the ubiquitous
    _Open Source Cloud Computing_ platform
  * easy to use, simple to implement
  * works well at all scales
  * interoperable
  * meet the needs
    * users, operators
    * public, private clouds


## What is OpenStack

  * project
  * <span class="lightblue">foundation</span>
 

## OpenStack Foundation

  * An independent body providing shared resources
  * Helps to achieve the _OpenStack Mission_
    * Protecting
    * Empowering
    * Promoting

  * OpenStack software and the community around it
    * users
    * developers
    * entire ecosystem


## Understand OpenStack as a community

  * Foundation mission
    * core values
    * target 


## Understand OpenStack as a community

  * Definition of 'open' / openness
    * source
    * community
    * design
    * development


## Customer as target audience

  * enterprise need
  * consultant listens
  * task of the engineer

Bridge gap between community


## OpenStack is not just OpenStack

  * Ceph (storage)
  * Puppet / Ansible
  * ...


## What is OpenStack

  * project
  * foundation
  * <span class="lightblue">set of applications</span>
 

## OpenStack services

  * Set of applications
    * Python


## OpenStack services

  * 'Un*x' philosophy
    * do one thing
    * and do it well

Note: microservices


## OpenStack services

  * communication


## Architecture

![Architecture](img/openstack-architecture.jpg)


## OpenStack components

  * Core services
    * Identity: Keystone
    * Dashboard: Horizon
    * Compute: Nova 
    * Networking: Neutron
    * Object Storage: Swift
    * Image: Glance
    * Block Storage: Cinder

  * and many, many more ...


## Keystone

  * [Keystone](http://docs.openstack.org/developer/keystone/) provides Identity, Token, Catalog and Policy services


## Overview

  * User management  
    Tracks users and their permissions

  * Service catalog  
    Provides a catalog of available services with their API endpoints


## Overview

  * API gateway
  * Verifies access tokens
  * Entities and concepts
    * users
    * roles
    * tenants
    * ...


## Usual flow

  * authenticate with Keystone
  * obtain a _TOKEN_
  * use _TOKEN_ for transactions with OpenStack services


## Integration with LDAP

  * MySQL
    * Service catalog
  * LDAP
    * Accounts
    * Roles
    * Tenants


## Horizon

  * [Horizon](http://docs.openstack.org/developer/horizon/) is the canonical implementation of OpenStack’s Dashboard

Enables cloud administrators and users to manage various OpenStack resources and services.

It enables Web-based interactions with the OpenStack Compute cloud controller through the OpenStack APIs.


## Overview

  * Django-based
    * AngularJS
    * Bootstrap
    * jQuery
    * D3.js
    * ...
  * Extensible
    * Billing
    * Monitoring


## Customization

  * Change site title, logo and brand links
  * Modify dashboard and panel
  * Change button styles
  * Custom stylesheets
  * Custom JavaScript


## Short demonstration

  * Horizon
  * Client


## Install client

```
pip install python-openstackclient
```

```
yum install -y python-openstackclient
```

```
apt-get install -y python-openstackclient
```


## Basic commands


```
openstack [resource] [command] [options] 
```

Note:

  * either use `source ~/.stack/dream`
  * or use `--os-cloud dream` as parameter.

[Documentation](http://docs.openstack.org/developer/python-openstackclient/)
[clouds.yaml](http://docs.openstack.org/developer/python-openstackclient/configuration.html)


## Client communication

  * RESTful API
    * HTTP Verbs/methods
    * Resource oriented
    * version-ed (microversion)
    * JSON / HTTP(S)


## Concept of node types

... before I continue...


## Controller node

Takes care of the administrational tasks of the OpenStack environment


## Compute node

Provides the computing resource for the OpenStack environment


## Network node

Handles networking within the OpenStack environment


## Nova

  * [Nova](http://docs.openstack.org/developer/nova/) provides power massively scalable, on demand, self service access to compute resources


## Nova overview

  * build on top of a messaging-based architecture
    * component interaction with AMQP
    * external services with REST
  * pluggable


## Nova components

  * Nova API
  * Nova scheduler
  * Nova conductor
  * Nova compute
  * Nova ConsoleAuth
  * Nova novncproxy


## Nova API

Responsible for the API for users and services
  
Example: spawning an instance from Horizon or CLI


## Nova scheduler

Using `Filters` it will dispatch requests for new virtual machines to the correct node


Nodes -> Filters -> filtered list -> Weighting -> final sorted list


## Nova compute

  * Runs on each to allow creation and termination of virtual machines.
  * Interacts with the hypervisor to launch instances
  * Instance state is maintained in the database.


## Nova services

  * Nova conductor  
    provides database access for compute nodes (reducing security risks)
  * Nova ConsoleAuth  
    handles console authentication
  * Nova novncproxy  
    provides a VNC proxy for browsers


## Nova and AMQP interaction

  * API service processes the REST requests
    * database interaction
    * RPC messaging `oslo.messaging` library


## Integration

  * Hyper-V (Windows Server, Windows 8)  
    Python application/service running on Hyper-V node
    * doesn't require clustering services
    * doesn't require shared storage
  * VMWare ESX
  * Xen
  * LXC, Docker


## Boot instance

  * Instance name
  * Flavor ID
  * Image name

  * Network ID
  * Security group
  * Keypair


## Boot instance

```
$ openstack server create test --flavor 1 --image "CentOS7" --key-name "my-key"
```

```
$ openstack server list
```


## Glance

  * [Glance](http://docs.openstack.org/developer/glance/) provides a service where users can upload and discover data assets that are meant to be used with other services


## Glance overview

  * RESTful API
    * querying image metadata
    * retrieval of image
  * storage backends
    * filesystem
    * object storage (Swift, S3)
    * Ceph RBD (distributed storage)
    * Cinder


## Glance components

  * Glance API  
    accepts calls for image discovery, retrieval, and storage
  * Glance registry
    stores, processes, and retrieves metadatda about images (size, type, etc.)
  * Glance database
    stores image metadata. MySQL or SQlite
  * Storage repository


## Supported formats

  * Disk formats
    * raw (unstructured)
    * qcow2 (qemu)
    * iso
    * vhd (Hyper-V), vmdk (VMWare), vdi (VirtualBox)
    * aki, ari, ami (AWS images)

  * Container formats
    * bare
    * ovf (Open Virtualization Format)
    * aki, ari, ami


## Glance architecture

... image ...


## Glance image upload

```
$ wget -q http://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2 -O /tmp/centos7.qcow2
$ openstack image create --disk-format qcow2 --file /tmp/centos7.qcow2 centos7
```

```
$ qemu-img convert /tmp/centos7.qcow2 /tmp/centos7.raw
$ openstack image create --disk-format raw --container-format bare --file /tmp/centos7.raw centos7
```


## Glance assets

  * Images for Nova
  * Templates for Heat
  * assets for use with other services


## Cinder

  * [Cinder](http://docs.openstack.org/developer/cinder/) provides “block storage as a service”


## Cinder overview

Originally called `Nova volume`, but is an independent project since the Folsom release. It provides infrastructure for managing volumes.


## What is Cinder?

It virtualizes pools of block storage devices and provides users a self-service API to request and consume resources. No knowledge is required of where storage is actually deployed or on what type of device.


## Supported backends

  * Reference implementation
    * LVM, in a group named `cinder-volumes`
  * Storage appliances  
    EMC, Hitachi, IBM Storage, etc
  * Ceph, GlusterFS, Nexenta


## Volumes, snapshots and backups

  * Volumes  
    allocated block storage attached as secondary storage, or as root store to boot instances
  * Snapshots  
    read-only point in time of a volume
  * Backups  
    archived copy of a volume, stored in Object Storage


## Cinder volume creation

```
$ openstack volume create [volume-name] --size [size]
```

```
$ openstack volume create [volume-name] --image [image] --size [size]
```

```
$ openstack server add volume [server-name] [volume-name]
```


## Neutron

  * [Neutron](http://docs.openstack.org/developer/neutron/) provides “network connectivity as a service” between interface devices (e.g., vNICs)


## Neutron overview

  * Technology agnostic
  * Extensible
  * Advanced services
    * LBaaS (Load-balancer)
    * VPNaaS (VPN)
    * FWaaS (Firewall)
  * Standalone service


## Neutron components

  * Neutron Server
  * Neutron Plugin
  * DHCP Agent
  * L3 agent
  * Advanced services
  * Neutron Database
  * ML2 (Modular layer2) plugin


## Neutron network setup

  * provider network setup
    * map into existing network (VLAN)
    * small number of tenants
    * routing with exisitng infrastructure


## Neutron network setup

  * Overlays (and L2 gateways)
    * large number of tenants
    * Floating IPs


## Neutron backends

  * Dragonflow
  * OpenContrail
  * OpenDayLight
  * OVN
  * Astara


## Demonstration

  * Security groups  
    Access rules
  * Floating IP
  * Network topology


## Swift

  * [Swift](http://docs.openstack.org/developer/swift/) is a highly available, distributed, eventually consistent object/blob store


## What is object storage

  * 'flat' structure
  * stored in containers (massive scalability)
  * metadata
  * durability
  * access via API


## What is object storage

 * Good for:
   * Media (images, music, video)
   * Documents
   * Backups
 * Not suited for:
   * Relational data
   * Data requiring updates within objects


## Swift features

  * Multi-tenancy
  * Eventual consistency (CAP)
  * Object versioning
  * Standalone


## Swift architecture

  * Account service
  * Container service
  * Object service
  * Consistency service


## Ceilometer

  * Telemetry service
  * Billing, chargeback use-case
  * Cloud operator
    * Utilization


## Heat

  * Orchestration service
  * Comaptible with AWS CloudFormation
  * Uses a templating mechanism
  * Controls complex groups of cloud resources


## Ceilometer + Heat

Autoscaling

  * Orchestration triggered by events from telemetry data
  * Neutron with LBaaS


## Ironic

Provisions bare-metal (physical hardware) as opposed to virtual machines

  * Leverages
    * PXE
    * IPMI
    * plugin ...
  * Images can be provided by
    * HTTP
    * Cinder
    * Glance


## What is OpenStack

  * project
  * foundation
  * set of applications
  * <span class="lightblue">deployed environment</span>


## Deployed environment

  * There is no single OpenStack deployment
    * [Navigator](http://www.openstack.org/software/project-navigator)

  * Examples
    * UnitedStack [UOS Cloud](https://console.ustack.com)
    * City Network [CityCloud](https://www.citycloud.com/)
    * Dreamhost [DreamCompute](https://iad2.dreamcompute.com)
    * OVH [Public Cloud](https://www.ovh.com/us/cloud/)
    * [EnterCloudSuite](http://www.entercloudsuite.com/en/)
    * Rackspace [Public Cloud](https://www.rackspace.com/cloud)


## OpenStack deployments

The minimum that fits your use-case

[Sample configurations](https://www.openstack.org/software/sample-configs/) (case studies)


## Puppet modules

Utilizes Puppet to configure and deploy OpenStack components

[Reference](http://docs.openstack.org/developer/puppet-openstack-guide/)


## Deployment tools

Almost every vendor provides their own deployment tool


## Deployment approach

  * Source
    * Bleeding edge
    * Latest features and fixes are available
  * Packages  
    * At the mercy of the packagers
    * Distribution specific testing
  * Image-based  
    * Guaranteed that all nodes run the same deployment


## Devstack

A documented shell script to build a complete OpenStack development environment,
using the latest version.

[Website](http://devstack.org)

  * Ubuntu
  * Fedora
  * Debian
  * OpenSUSE

Note: for use on servers or virtual machines... and only for development purpose


## PackStack

Can do multi-node deployments, but is considered for small-scale, PoC deployments.

```
$ yum install -y centos-release-openstack-[releasename]
$ yum install -y openstack-packstack
$ packstack --allinone
```


## OpenStack Ansible

Maintained by Rackspace

[Source](https://github.com/openstack/openstack-ansible)


## Fuel

Maintained by Mirantis

  Targets
  * Ubuntu
  * CentOS / RHEL

Recently Mirantis announced a partnership with SUSE

[Reference](https://wiki.openstack.org/wiki/Fuel)
[Demo](https://demo.fuel-infra.org:8000/)


## TripleO

'Openstack-on-Openstack'

Utilizes many of the OpenStack components (Undercloud) to standup a workload OpenStack cloud (Overcloud). Part of RDO, the packaging of OpenStack for CentOS/RHEL.

The undercloud deploys workload nodes using an image-based deployment.

[Reference](http://tripleo.org/)


## Install customization

```
undercloud$ cat << EOF > ~/templates/firstboot-environment.yaml
resource_registry:
  OS::TripleO::NodeUserData: /home/stack/my_templates/firstboot-config.yaml
EOF
```

## Install customization

```
undercloud$ cat << EOF > ~/templates/firstboot-config.yaml
heat_template_version: 2014-10-16

resources:
  userdata:
    type: OS::Heat::MultipartMime
    properties:
      parts:
      - config: {get_resource: repo_config}

  repo_config:
    type: OS::Heat::SoftwareConfig
    properties:
      config: |
        #!/bin/bash
        yum install -y [packages to want to be installed]
        # and any other commands you want to be performed

outputs:
  OS::stack_id:
    value: {get_resource: userdata}
EOF
```


## Install customization

```
undercloud$ openstack overcloud deploy --templates \
   --control-flavor control --compute-flavor compute \
   --control-scale 1 --compute-scale 1 \
   --neutron-tunnel-types vxlan --neutron-network-type vxlan \
   -e ~/templates/firstboot-environment.yaml
```


## Kolla

Containerized OpenStack project, targets Ubuntu and CentOS to run in Docker containers.

  * packages
  * source deployment

Installer generates containers (comparable to images).


## Heat

```
heat_template_version: 2016-04-08

description: Heat template to deploy an instance
parameters:
  ssh_key_name:
    type: string
    label: Key Pair name
    description : Name of the key pair to enable SSH access to the instance.
  flavor_name:
    type: string
    label: Flavor Name
    description: Instance type for the development environment
    default: m1.small
    constraints:
      - allowed_values: [m1.small, m1.medium]
        description: flavor_name must be one of m1.small or m1.medium
  root_password:
    label: root password
    default: secrete
    hidden: true
    description: root password for the development environment
    type: string
    constraints:
    - length: { min: 4, max: 25 }
      description: Password MUST be between 1 - 25 characters
  private_network:
    type: string
    label: Private network name or ID
    description: Network to attach instance to
    default: private
```


## Heat

```
resources:
  server:
    type: OS::Nova::Server
    properties:
      name: devenv
      flavor: { get_param: flavor_name }
      image: Fedora23
      key_name: { get_param: ssh_key_name }
      networks:
        - network: { get_param: private_network }
      user_data:
        str_replace:
          template: |
            #!/usr/bin/env bash
            # Root password
            sudo echo root:%root_password% | chpasswd
            # Installation script
            [...]
          params:
            "%root_password%": { get_param: root_password }
```


## Heat

```
  security_group:
    type: OS::Neutron::SecurityGroup
    properties:
      description: Add security group rules for the development environment
      name: devenv
      rules:
        - remote_ip_prefix: 0.0.0.0/0
          protocol: tcp
          port_range_min: 22
          port_range_max: 22

outputs:
  server_private_ip:
    description: IP address of development environment in the private network
    value: { get_attr: [ server, first_address ] }
```


## Ansible as a client

Utilizes the [Shade](http://docs.openstack.org/infra/shade/) client library for interacting with OpenStack clouds


## Ansible playbook: upload key

```
---
- hosts: localhost

  tasks:
  - name: Upload public key to OpenStack cloud providers 
    os_keypair:
      cloud: "{{ item }}"
      name: gbraad
      public_key_file: ~/.ssh/id_rsa.pub
    with_items:
    - trystack
    - dreamhost
    - ustack
```

```
$ ansible-playbook upload-publickey.yml
```


## Ansible playbook: create instance

```
- hosts: localhost

  tasks:
  - name: Create instance
    os_server:
      state: present
      cloud: "{{ cloud }}"
      name: "test"
      image: Fedora24
      key_name: "{{ key }}"
      network: public
      flavor: 1
      userdata: >-
        #!/usr/bin/env bash
        # Root password
        sudo echo root:%root_password% | chpasswd
        # Installation script
        [...]
```

```
$ ansible-playbook create-instance.yml --extra-vars "cloud=trystack key_name=mykey"
```


## High Availability

  * MySQL (Galera)
  * Message Queue
  * Pacemaker
  * Keepalived
  * haproxy
  * ...

[Reference](https://github.com/beekhof/osp-ha-deploy)


## Messaging

Generally in OpenStack two modes are used for messaging
  
  * rpc.cast - do not wait for result
  * rpc.call - wait for result (when there is a return value)


## Messaging notes

  * Uses multiple queues within a single rabbitMQ instance
  * Traffic is usually not intensive
  * No broadcast messages


## Vagrant

Also comes with an OpenStack provider. Which allows you to easily deploy
developer environments onto an OpenStack environments.

```
$ vagrant up
```


## Resources

  * https://gitlab.com/gbraad/openstack-handsonlabs
    * Multi-tier setup
    * Heat introduction
  * https://github.com/gbraad/scratchpad/tree/master/technology/openstack
  * https://wiki.openstack.org/wiki/Open
  * http://docs.openstack.org/mitaka/install-guide-rdo/index.html
  * http://docs.openstack.org/mitaka/config-reference/index.html
  * https://access.redhat.com/documentation/en/red-hat-openstack-platform/


## Stay in touch

![](img/email.png)


## Stay in touch

![](img/wechat.jpg)


## Q & A

