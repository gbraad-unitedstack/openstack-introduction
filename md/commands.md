# OpenStack commands overview

## Cloud providers
These are examples used during the demonstration
```
$ source ~/.stack/trystack    # https://trystack.org
$ source ~/.stack/city-la1    # https://citycloud.com
$ source ~/.stack/dream       # https://dreamcompute.com
$ source ~/.stack/ustack      # https://unitedstack.com
```

They can also be used from `clouds.yaml` using `--os-cloud <identifier>`.


## Managing users and projects
```
$ openstack project list

$ openstack user list

$ openstack role list
```


### Add new user
```
$ openstack user create <username> --project <project> --password <password>
```

### Grant role to user
```
$ openstack role add --user <username> --project <project> <role>
```

## Managing SSH keys

### Create a new key-pair
```
$ openstack keypair create mykey > mykey.pem
```

### Upload existing key
```
$ openstack keypair create --public-key ~/.ssh/id_rsa.pub mykey
```


## Managing images
```
$ openstack image list
```

### Upload image
```
# openstack image create <name> --disk-format <dformat> --container-format <cformat> --file <file> --property os_distro=<||>
```


## Managing instances
```
$ openstack flavor list

$ openstack server list
```

### Create instance
```
$ openstack server create <name> --flavor <flavor> --image <image> --key-name <key-name>
```

### Lifecycle
```
$ openstack server reboot <name>

$ openstack server delete <name>
```


## Managing volumes
```
$ openstack volume create <volume-name> --size <size>

$ openstack volume create <volume-name> --image <image> --size <size>

$ openstack server add volume <server-name> <volume-name>
```


## Managing networks
```
$ openstack network list

$ openstack network show <network>
```


### Create network
```
$ openstack network create [--prefix prefix] [--enable | --disable] [--share | --no-share] <name>
```


### Usage example
```
$ wget -q http://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2 -O /tmp/centos7.qcow2
$ qemu-img convert /tmp/centos7.qcow2 /tmp/centos7.raw
$ #openstack image create --disk-format qcow2 --file /tmp/centos7.qcow2 centos7
$ openstack image create --disk-format raw --container-format bare --file /tmp/centos7.raw centos7
$ net_id=$(openstack network list -f value |awk '{print $1}')
$ openstack server create --flavor m1.small --image centos7 --nic net-id=${net_id} --key-name mykey test-instance
```
