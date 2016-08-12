# An introduction to OpenStack

### An introduction to OpenStack
Gerard Braad

<span class="lightblue">me</span><span class="white">@gbraad</span><span class="orange">.nl</span>


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

  * Many definitions
    * project
    * foundation
    * set of applications
    * deployed environment


## OpenStack Mission

  * Produce the ubiquitous
    _Open Source Cloud Computing_ platform
  * easy to use, simple to implement
  * works well at all scales
  * interoperable
  * meet the needs
    * users, operators
    * public, private clouds


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


## Microservices

...


## OpenStack services

  * a set of applications
  * unix philosophy
    * do one thing
    * and do it well
  * communication


## Architecture

![Architecture](img/openstack-architecture.jpg)


## OpenStack components

  * Core services
    * Identity: Keystone
    * Dashboard: Horizon
    * Compute: Nova 
    * Networking: Neutron
    * Object Storage: Glance
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


## Inter-process communication

  * Rest API
  * Resource oriented


## Horizon

  * [Horizon](http://docs.openstack.org/developer/horizon/) is the canonical implementation of OpenStack’s Dashboard

Enables cloud administrators and users to manage various OpenStack resources and services.

It enables Web-based interactions with the OpenStack Compute cloud controller through the OpenStack APIs.


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



## HTTP Verbs/methods



## OpenStack deployments



## Deployment tools



## Puppet modules



## Ansible



## Fuel



## TripleO



## OSAD



## Kolla



## Resources

  * https://wiki.openstack.org/wiki/Open
  * http://www.openstack.org/software/project-navigator
  * http://docs.openstack.org/liberty/install-guide-rdo/index.html
  * https://gitlab.com/gbraad/openstack-handsonlabs



## Stay in touch

![](img/email.png)


## Stay in touch

![](img/wechat.jpg)


## Q & A


