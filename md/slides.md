# An introduction to OpenStack

### An introduction to OpenStack
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

  * 


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


## Client communication

  * Rest API
    * HTTP Verbs/methods
  * Resource oriented


## Horizon

  * [Horizon](http://docs.openstack.org/developer/horizon/) is the canonical implementation of OpenStack’s Dashboard

Enables cloud administrators and users to manage various OpenStack resources and services.

It enables Web-based interactions with the OpenStack Compute cloud controller through the OpenStack APIs.


## Short demonstration

  * Horizon
  * Client


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



## Inter-process communication

  * Message Queue


## Cinder

  * [Cinder](http://docs.openstack.org/developer/cinder/) provides “block storage as a service”


## Glance

  * [Glance](http://docs.openstack.org/developer/glance/) provides a service where users can upload and discover data assets that are meant to be used with other services


## Neutron

  * [Neutron](http://docs.openstack.org/developer/neutron/) provides “network connectivity as a service” between interface devices (e.g., vNICs)


## Swift

  * [Swift](http://docs.openstack.org/developer/swift/) is a highly available, distributed, eventually consistent object/blob store


## What is OpenStack

  * project
  * foundation
  * set of applications
  * <span class="lightblue">deployed environment</span>


## Deployed environment

  * There is no single OpenStack deployment
    * [Navigator](http://www.openstack.org/software/project-navigator)

  * Examples
    * Dreamhost  
      [DreamCompute](https://iad2.dreamcompute.com)
    * UnitedStack  
      [public cloud](https://console.ustack.com)
    * OVH


## OpenStack deployments

  * Baskins and Robbibs
  

## Ceilometer




## Heat

  * Orchestration



## Deployment tools



## Puppet modules



## Ansible



## Fuel



## TripleO



## OSAD



## Kolla



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

```
- hosts: localhost

  tasks:
  - name: Create instance
    os_server:
      state: present
      cloud: "{{ cloud }}"
      name: "devenv"
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


## Resources

  * https://wiki.openstack.org/wiki/Open
  * http://docs.openstack.org/liberty/install-guide-rdo/index.html
  * https://gitlab.com/gbraad/openstack-handsonlabs



## Stay in touch

![](img/email.png)


## Stay in touch

![](img/wechat.jpg)


## Q & A

