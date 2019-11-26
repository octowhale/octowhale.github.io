---
layout: wiki
title: "ansible gather fact"
categories: automatic
description: "ansible 获取主机变量列表"
keywords: ansible
---

# ansible gather fact

使用 setup 和 gather_facts 获取主机变量


## ansible setup

```bash
ansible testserver -m setup
```


## ansible-playbook gather_facts

```bash

# read yaml file
cat main.yml
- name: an example to gather facts
  hosts: testserver
  gather_facts: True


# run command
ansible-playbook main.yml
 
```


## ansible-playbook reload facts

```bash
# example at github
# https://github.com/ansible/ansible-examples/blob/master/wordpress-nginx/roles/common/tasks/main.yml

cat main.yml
- name: setup module in ansible-playbooks to reload 
  hosts: testserver
  tasks:
  - name: reload ansible_facts 
    setup:
    
```


## fact 结果

```json
testserver | SUCCESS => {
    "ansible_facts": {
        "ansible_all_ipv4_addresses": [
            "192.168.56.10", 
            "10.0.3.15"
        ], 
        "ansible_all_ipv6_addresses": [
            "fe80::a00:27ff:fe03:c99e", 
            "fe80::a00:27ff:fe50:956"
        ], 
        "ansible_architecture": "x86_64", 
        "ansible_bios_date": "12/01/2006", 
        "ansible_bios_version": "VirtualBox", 
        "ansible_cmdline": {
            "KEYBOARDTYPE": "pc", 
            "KEYTABLE": "us", 
            "LANG": "en_US.UTF-8", 
            "SYSFONT": "latarcyrheb-sun16", 
            "quiet": true, 
            "rd_LVM_LV": "vg_s001bastion/lv_swap", 
            "rd_NO_DM": true, 
            "rd_NO_LUKS": true, 
            "rd_NO_MD": true, 
            "rhgb": true, 
            "ro": true, 
            "root": "/dev/mapper/vg_s001bastion-lv_root"
        }, 
        "ansible_date_time": {
            "date": "2016-12-20", 
            "day": "20", 
            "epoch": "1482201238", 
            "hour": "10", 
            "iso8601": "2016-12-20T02:33:58Z", 
            "iso8601_basic": "20161220T103358872049", 
            "iso8601_basic_short": "20161220T103358", 
            "iso8601_micro": "2016-12-20T02:33:58.872128Z", 
            "minute": "33", 
            "month": "12", 
            "second": "58", 
            "time": "10:33:58", 
            "tz": "CST", 
            "tz_offset": "+0800", 
            "weekday": "Tuesday", 
            "weekday_number": "2", 
            "weeknumber": "51", 
            "year": "2016"
        }, 
        "ansible_default_ipv4": {
            "address": "10.0.3.15", 
            "alias": "eth1", 
            "broadcast": "10.0.3.255", 
            "gateway": "10.0.3.2", 
            "interface": "eth1", 
            "macaddress": "08:00:27:50:09:56", 
            "mtu": 1500, 
            "netmask": "255.255.255.0", 
            "network": "10.0.3.0", 
            "type": "ether"
        }, 
        "ansible_default_ipv6": {}, 
        "ansible_devices": {
            "sda": {
                "holders": [], 
                "host": "", 
                "model": "VBOX HARDDISK", 
                "partitions": {
                    "sda1": {
                        "holders": [], 
                        "sectors": "1024000", 
                        "sectorsize": 512, 
                        "size": "500.00 MB", 
                        "start": "2048", 
                        "uuid": "c53ec592-c138-4157-80f5-c3f9ffd65fc2"
                    }, 
                    "sda2": {
                        "holders": [
                            "vg_s001bastion-lv_root", 
                            "vg_s001bastion-lv_swap"
                        ], 
                        "sectors": "15751168", 
                        "sectorsize": 512, 
                        "size": "7.51 GB", 
                        "start": "1026048", 
                        "uuid": null
                    }
                }, 
                "removable": "0", 
                "rotational": "1", 
                "sas_address": null, 
                "sas_device_handle": null, 
                "scheduler_mode": "cfq", 
                "sectors": "16777216", 
                "sectorsize": "512", 
                "size": "8.00 GB", 
                "support_discard": "0", 
                "vendor": "ATA"
            }, 
            "sr0": {
                "holders": [], 
                "host": "", 
                "model": "CD-ROM", 
                "partitions": {}, 
                "removable": "1", 
                "rotational": "1", 
                "sas_address": null, 
                "sas_device_handle": null, 
                "scheduler_mode": "cfq", 
                "sectors": "2097151", 
                "sectorsize": "512", 
                "size": "1024.00 MB", 
                "support_discard": "0", 
                "vendor": "VBOX"
            }
        }, 
        "ansible_distribution": "CentOS", 
        "ansible_distribution_major_version": "6", 
        "ansible_distribution_release": "Final", 
        "ansible_distribution_version": "6.8", 
        "ansible_dns": {
            "nameservers": [
                "61.139.2.69"
            ]
        }, 
        "ansible_domain": "", 
        "ansible_env": {
            "GEM_HOME": "/usr/local/rvm/gems/ruby-2.2.1", 
            "GEM_PATH": "/usr/local/rvm/gems/ruby-2.2.1:/usr/local/rvm/gems/ruby-2.2.1@global", 
            "G_BROKEN_FILENAMES": "1", 
            "HOME": "/home/testuser", 
            "IRBRC": "/usr/local/rvm/rubies/ruby-2.2.1/.irbrc", 
            "LANG": "en_US.UTF-8", 
            "LESSOPEN": "||/usr/bin/lesspipe.sh %s", 
            "LOGNAME": "testuser", 
            "MAIL": "/var/mail/testuser", 
            "MY_RUBY_HOME": "/usr/local/rvm/rubies/ruby-2.2.1", 
            "PATH": "/usr/local/rvm/gems/ruby-2.2.1/bin:/usr/local/rvm/gems/ruby-2.2.1@global/bin:/usr/local/rvm/rubies/ruby-2.2.1/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/rvm/bin", 
            "PWD": "/home/testuser", 
            "RUBY_VERSION": "ruby-2.2.1", 
            "SHELL": "/bin/bash", 
            "SHLVL": "2", 
            "SSH_CLIENT": "192.168.56.22 44423 22", 
            "SSH_CONNECTION": "192.168.56.22 44423 192.168.56.10 22", 
            "SSH_TTY": "/dev/pts/0", 
            "TERM": "ansi", 
            "USER": "testuser", 
            "_": "/usr/bin/python", 
            "_system_arch": "x86_64", 
            "_system_name": "CentOS", 
            "_system_type": "Linux", 
            "_system_version": "6", 
            "rvm_bin_path": "/usr/local/rvm/bin", 
            "rvm_path": "/usr/local/rvm", 
            "rvm_prefix": "/usr/local", 
            "rvm_version": "1.27.0 (latest)"
        }, 
        "ansible_eth0": {
            "active": true, 
            "device": "eth0", 
            "features": {
                "fcoe_mtu": "off [fixed]", 
                "generic_receive_offload": "on", 
                "generic_segmentation_offload": "on", 
                "highdma": "off [fixed]", 
                "large_receive_offload": "off [fixed]", 
                "loopback": "off [fixed]", 
                "netns_local": "off [fixed]", 
                "ntuple_filters": "off [fixed]", 
                "receive_hashing": "off [fixed]", 
                "rx_checksumming": "on", 
                "rx_vlan_filter": "on [fixed]", 
                "rx_vlan_offload": "on [fixed]", 
                "scatter_gather": "on", 
                "tcp_segmentation_offload": "on", 
                "tx_checksum_fcoe_crc": "off [fixed]", 
                "tx_checksum_ip_generic": "on", 
                "tx_checksum_ipv4": "off", 
                "tx_checksum_ipv6": "off", 
                "tx_checksum_sctp": "off [fixed]", 
                "tx_checksum_unneeded": "off", 
                "tx_checksumming": "on", 
                "tx_fcoe_segmentation": "off [fixed]", 
                "tx_gre_segmentation": "off [fixed]", 
                "tx_gso_robust": "off [fixed]", 
                "tx_lockless": "off [fixed]", 
                "tx_scatter_gather": "on", 
                "tx_scatter_gather_fraglist": "off [fixed]", 
                "tx_tcp6_segmentation": "off", 
                "tx_tcp_ecn_segmentation": "off", 
                "tx_tcp_segmentation": "on", 
                "tx_udp_tnl_segmentation": "off [fixed]", 
                "tx_vlan_offload": "on [fixed]", 
                "udp_fragmentation_offload": "off [fixed]", 
                "vlan_challenged": "off [fixed]"
            }, 
            "ipv4": {
                "address": "192.168.56.10", 
                "broadcast": "192.168.56.255", 
                "netmask": "255.255.255.0", 
                "network": "192.168.56.0"
            }, 
            "ipv6": [
                {
                    "address": "fe80::a00:27ff:fe03:c99e", 
                    "prefix": "64", 
                    "scope": "link"
                }
            ], 
            "macaddress": "08:00:27:03:c9:9e", 
            "module": "e1000", 
            "mtu": 1500, 
            "pciid": "0000:00:03.0", 
            "promisc": false, 
            "speed": 1000, 
            "type": "ether"
        }, 
        "ansible_eth1": {
            "active": true, 
            "device": "eth1", 
            "features": {
                "fcoe_mtu": "off [fixed]", 
                "generic_receive_offload": "on", 
                "generic_segmentation_offload": "on", 
                "highdma": "off [fixed]", 
                "large_receive_offload": "off [fixed]", 
                "loopback": "off [fixed]", 
                "netns_local": "off [fixed]", 
                "ntuple_filters": "off [fixed]", 
                "receive_hashing": "off [fixed]", 
                "rx_checksumming": "on", 
                "rx_vlan_filter": "on [fixed]", 
                "rx_vlan_offload": "on [fixed]", 
                "scatter_gather": "on", 
                "tcp_segmentation_offload": "on", 
                "tx_checksum_fcoe_crc": "off [fixed]", 
                "tx_checksum_ip_generic": "on", 
                "tx_checksum_ipv4": "off", 
                "tx_checksum_ipv6": "off", 
                "tx_checksum_sctp": "off [fixed]", 
                "tx_checksum_unneeded": "off", 
                "tx_checksumming": "on", 
                "tx_fcoe_segmentation": "off [fixed]", 
                "tx_gre_segmentation": "off [fixed]", 
                "tx_gso_robust": "off [fixed]", 
                "tx_lockless": "off [fixed]", 
                "tx_scatter_gather": "on", 
                "tx_scatter_gather_fraglist": "off [fixed]", 
                "tx_tcp6_segmentation": "off", 
                "tx_tcp_ecn_segmentation": "off", 
                "tx_tcp_segmentation": "on", 
                "tx_udp_tnl_segmentation": "off [fixed]", 
                "tx_vlan_offload": "on [fixed]", 
                "udp_fragmentation_offload": "off [fixed]", 
                "vlan_challenged": "off [fixed]"
            }, 
            "ipv4": {
                "address": "10.0.3.15", 
                "broadcast": "10.0.3.255", 
                "netmask": "255.255.255.0", 
                "network": "10.0.3.0"
            }, 
            "ipv6": [
                {
                    "address": "fe80::a00:27ff:fe50:956", 
                    "prefix": "64", 
                    "scope": "link"
                }
            ], 
            "macaddress": "08:00:27:50:09:56", 
            "module": "e1000", 
            "mtu": 1500, 
            "pciid": "0000:00:08.0", 
            "promisc": false, 
            "speed": 1000, 
            "type": "ether"
        }, 
        "ansible_fips": false, 
        "ansible_form_factor": "Other", 
        "ansible_fqdn": "S001-BASTION", 
        "ansible_gather_subset": [
            "hardware", 
            "network", 
            "virtual"
        ], 
        "ansible_hostname": "S001-BASTION", 
        "ansible_interfaces": [
            "lo", 
            "eth1", 
            "eth0"
        ], 
        "ansible_kernel": "2.6.32-642.el6.x86_64", 
        "ansible_lo": {
            "active": true, 
            "device": "lo", 
            "features": {
                "fcoe_mtu": "off [fixed]", 
                "generic_receive_offload": "on", 
                "generic_segmentation_offload": "on", 
                "highdma": "on [fixed]", 
                "large_receive_offload": "off [fixed]", 
                "loopback": "on [fixed]", 
                "netns_local": "on [fixed]", 
                "ntuple_filters": "off [fixed]", 
                "receive_hashing": "off [fixed]", 
                "rx_checksumming": "on [fixed]", 
                "rx_vlan_filter": "off [fixed]", 
                "rx_vlan_offload": "off [fixed]", 
                "scatter_gather": "on", 
                "tcp_segmentation_offload": "on", 
                "tx_checksum_fcoe_crc": "off [fixed]", 
                "tx_checksum_ip_generic": "on [fixed]", 
                "tx_checksum_ipv4": "off [fixed]", 
                "tx_checksum_ipv6": "off [fixed]", 
                "tx_checksum_sctp": "off [fixed]", 
                "tx_checksum_unneeded": "off [fixed]", 
                "tx_checksumming": "on", 
                "tx_fcoe_segmentation": "off [fixed]", 
                "tx_gre_segmentation": "off [fixed]", 
                "tx_gso_robust": "off [fixed]", 
                "tx_lockless": "on [fixed]", 
                "tx_scatter_gather": "on [fixed]", 
                "tx_scatter_gather_fraglist": "on [fixed]", 
                "tx_tcp6_segmentation": "on", 
                "tx_tcp_ecn_segmentation": "on", 
                "tx_tcp_segmentation": "on", 
                "tx_udp_tnl_segmentation": "off [fixed]", 
                "tx_vlan_offload": "off [fixed]", 
                "udp_fragmentation_offload": "on", 
                "vlan_challenged": "on [fixed]"
            }, 
            "ipv4": {
                "address": "127.0.0.1", 
                "broadcast": "host", 
                "netmask": "255.0.0.0", 
                "network": "127.0.0.0"
            }, 
            "ipv6": [
                {
                    "address": "::1", 
                    "prefix": "128", 
                    "scope": "host"
                }
            ], 
            "mtu": 65536, 
            "promisc": false, 
            "type": "loopback"
        }, 
        "ansible_machine": "x86_64", 
        "ansible_memfree_mb": 582, 
        "ansible_memory_mb": {
            "nocache": {
                "free": 648, 
                "used": 94
            }, 
            "real": {
                "free": 582, 
                "total": 742, 
                "used": 160
            }, 
            "swap": {
                "cached": 0, 
                "free": 815, 
                "total": 815, 
                "used": 0
            }
        }, 
        "ansible_memtotal_mb": 742, 
        "ansible_mounts": [
            {
                "device": "/dev/mapper/vg_s001bastion-lv_root", 
                "fstype": "ext4", 
                "mount": "/", 
                "options": "rw", 
                "size_available": 3898847232, 
                "size_total": 6958276608, 
                "uuid": "N/A"
            }, 
            {
                "device": "/dev/sda1", 
                "fstype": "ext4", 
                "mount": "/boot", 
                "options": "rw", 
                "size_available": 444676096, 
                "size_total": 499355648, 
                "uuid": "N/A"
            }
        ], 
        "ansible_nodename": "S001-BASTION", 
        "ansible_os_family": "RedHat", 
        "ansible_pkg_mgr": "yum", 
        "ansible_processor": [
            "GenuineIntel", 
            "Intel(R) Core(TM) i5-4460  CPU @ 3.20GHz"
        ], 
        "ansible_processor_cores": 1, 
        "ansible_processor_count": 1, 
        "ansible_processor_threads_per_core": 1, 
        "ansible_processor_vcpus": 1, 
        "ansible_product_name": "VirtualBox", 
        "ansible_product_serial": "NA", 
        "ansible_product_uuid": "NA", 
        "ansible_product_version": "1.2", 
        "ansible_python": {
            "executable": "/usr/bin/python", 
            "has_sslcontext": false, 
            "type": "CPython", 
            "version": {
                "major": 2, 
                "micro": 6, 
                "minor": 6, 
                "releaselevel": "final", 
                "serial": 0
            }, 
            "version_info": [
                2, 
                6, 
                6, 
                "final", 
                0
            ]
        }, 
        "ansible_python_version": "2.6.6", 
        "ansible_selinux": false, 
        "ansible_service_mgr": "upstart", 
        "ansible_ssh_host_key_dsa_public": "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", 
        "ansible_ssh_host_key_rsa_public": "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY", 
        "ansible_swapfree_mb": 815, 
        "ansible_swaptotal_mb": 815, 
        "ansible_system": "Linux", 
        "ansible_system_capabilities": [
            ""
        ], 
        "ansible_system_capabilities_enforced": "True", 
        "ansible_system_vendor": "innotek GmbH", 
        "ansible_uptime_seconds": 248, 
        "ansible_user_dir": "/home/testuser", 
        "ansible_user_gecos": "", 
        "ansible_user_gid": 500, 
        "ansible_user_id": "testuser", 
        "ansible_user_shell": "/bin/bash", 
        "ansible_user_uid": 500, 
        "ansible_userspace_architecture": "x86_64", 
        "ansible_userspace_bits": "64", 
        "ansible_virtualization_role": "guest", 
        "ansible_virtualization_type": "virtualbox", 
        "module_setup": true
    }, 
    "changed": false
}
```


## Aarch64 Arm架构服务器

```json
172.16.0.143 | SUCCESS => {
    "ansible_facts": {
        "ansible_all_ipv4_addresses": [
            "169.254.31.1", 
            "172.16.0.143", 
            "10.58.1.0", 
            "10.58.1.1"
        ], 
        "ansible_all_ipv6_addresses": [], 
        "ansible_apparmor": {
            "status": "enabled"
        }, 
        "ansible_architecture": "aarch64", 
        "ansible_bios_date": "02/06/2015", 
        "ansible_bios_version": "0.0.0", 
        "ansible_cmdline": {
            "BOOT_IMAGE": "/boot/vmlinuz-4.15.0-29-generic", 
            "net.ifnames": "0", 
            "ro": true, 
            "root": "UUID=fd694735-9f36-470c-9c7c-aae381aa886a"
        }, 
        "ansible_cni0": {
            "active": true, 
            "device": "cni0", 
            "features": {
                "esp_hw_offload": "off [fixed]", 
                "esp_tx_csum_hw_offload": "off [fixed]", 
                "fcoe_mtu": "off [fixed]", 
                "generic_receive_offload": "on", 
                "generic_segmentation_offload": "on", 
                "highdma": "on", 
                "hw_tc_offload": "off [fixed]", 
                "l2_fwd_offload": "off [fixed]", 
                "large_receive_offload": "off [fixed]", 
                "loopback": "off [fixed]", 
                "netns_local": "on [fixed]", 
                "ntuple_filters": "off [fixed]", 
                "receive_hashing": "off [fixed]", 
                "rx_all": "off [fixed]", 
                "rx_checksumming": "off [fixed]", 
                "rx_fcs": "off [fixed]", 
                "rx_udp_tunnel_port_offload": "off [fixed]", 
                "rx_vlan_filter": "off [fixed]", 
                "rx_vlan_offload": "off [fixed]", 
                "rx_vlan_stag_filter": "off [fixed]", 
                "rx_vlan_stag_hw_parse": "off [fixed]", 
                "scatter_gather": "on", 
                "tcp_segmentation_offload": "on", 
                "tx_checksum_fcoe_crc": "off [fixed]", 
                "tx_checksum_ip_generic": "on", 
                "tx_checksum_ipv4": "off [fixed]", 
                "tx_checksum_ipv6": "off [fixed]", 
                "tx_checksum_sctp": "off [fixed]", 
                "tx_checksumming": "on", 
                "tx_esp_segmentation": "on", 
                "tx_fcoe_segmentation": "off [requested on]", 
                "tx_gre_csum_segmentation": "on", 
                "tx_gre_segmentation": "on", 
                "tx_gso_partial": "on", 
                "tx_gso_robust": "off [requested on]", 
                "tx_ipxip4_segmentation": "on", 
                "tx_ipxip6_segmentation": "on", 
                "tx_lockless": "on [fixed]", 
                "tx_nocache_copy": "off", 
                "tx_scatter_gather": "on", 
                "tx_scatter_gather_fraglist": "on", 
                "tx_sctp_segmentation": "on", 
                "tx_tcp6_segmentation": "on", 
                "tx_tcp_ecn_segmentation": "on", 
                "tx_tcp_mangleid_segmentation": "on", 
                "tx_tcp_segmentation": "on", 
                "tx_udp_tnl_csum_segmentation": "on", 
                "tx_udp_tnl_segmentation": "on", 
                "tx_vlan_offload": "on", 
                "tx_vlan_stag_hw_insert": "on", 
                "udp_fragmentation_offload": "off", 
                "vlan_challenged": "off [fixed]"
            }, 
            "hw_timestamp_filters": [], 
            "id": "8000.fae4b01ca2e7", 
            "interfaces": [
                "veth22ff1102"
            ], 
            "ipv4": {
                "address": "10.58.1.1", 
                "broadcast": "10.58.1.255", 
                "netmask": "255.255.255.0", 
                "network": "10.58.1.0"
            }, 
            "macaddress": "fa:e4:b0:1c:a2:e7", 
            "mtu": 1450, 
            "promisc": false, 
            "stp": false, 
            "timestamping": [
                "rx_software", 
                "software"
            ], 
            "type": "bridge"
        }, 
        "ansible_date_time": {
            "date": "2019-10-24", 
            "day": "24", 
            "epoch": "1571887218", 
            "hour": "11", 
            "iso8601": "2019-10-24T03:20:18Z", 
            "iso8601_basic": "20191024T112018259753", 
            "iso8601_basic_short": "20191024T112018", 
            "iso8601_micro": "2019-10-24T03:20:18.259852Z", 
            "minute": "20", 
            "month": "10", 
            "second": "18", 
            "time": "11:20:18", 
            "tz": "CST", 
            "tz_offset": "+0800", 
            "weekday": "Thursday", 
            "weekday_number": "4", 
            "weeknumber": "42", 
            "year": "2019"
        }, 
        "ansible_default_ipv4": {
            "address": "172.16.0.143", 
            "alias": "eth0", 
            "broadcast": "172.16.0.255", 
            "gateway": "172.16.0.1", 
            "interface": "eth0", 
            "macaddress": "fa:16:3e:fe:b9:07", 
            "mtu": 1500, 
            "netmask": "255.255.255.0", 
            "network": "172.16.0.0", 
            "type": "ether"
        }, 
        "ansible_default_ipv6": {}, 
        "ansible_device_links": {
            "ids": {
                "vda": [
                    "virtio-c73433ca-8dce-4ca5-8"
                ], 
                "vda1": [
                    "virtio-c73433ca-8dce-4ca5-8-part1"
                ], 
                "vda2": [
                    "virtio-c73433ca-8dce-4ca5-8-part2"
                ], 
                "vdb": [
                    "virtio-c803c677-7cee-4edb-9"
                ]
            }, 
            "labels": {}, 
            "masters": {}, 
            "uuids": {
                "vda1": [
                    "fd694735-9f36-470c-9c7c-aae381aa886a"
                ], 
                "vda2": [
                    "97DA-23C5"
                ], 
                "vdb": [
                    "3fab9476-573b-489f-a63f-bceb02ca38c1"
                ]
            }
        }, 
        "ansible_devices": {
            "loop0": {
                "holders": [], 
                "host": "", 
                "links": {
                    "ids": [], 
                    "labels": [], 
                    "masters": [], 
                    "uuids": []
                }, 
                "model": null, 
                "partitions": {}, 
                "removable": "0", 
                "rotational": "1", 
                "sas_address": null, 
                "sas_device_handle": null, 
                "scheduler_mode": "none", 
                "sectors": "0", 
                "sectorsize": "512", 
                "size": "0.00 Bytes", 
                "support_discard": "4096", 
                "vendor": null, 
                "virtual": 1
            }, 
            "loop1": {
                "holders": [], 
                "host": "", 
                "links": {
                    "ids": [], 
                    "labels": [], 
                    "masters": [], 
                    "uuids": []
                }, 
                "model": null, 
                "partitions": {}, 
                "removable": "0", 
                "rotational": "1", 
                "sas_address": null, 
                "sas_device_handle": null, 
                "scheduler_mode": "none", 
                "sectors": "0", 
                "sectorsize": "512", 
                "size": "0.00 Bytes", 
                "support_discard": "0", 
                "vendor": null, 
                "virtual": 1
            }, 
            "loop2": {
                "holders": [], 
                "host": "", 
                "links": {
                    "ids": [], 
                    "labels": [], 
                    "masters": [], 
                    "uuids": []
                }, 
                "model": null, 
                "partitions": {}, 
                "removable": "0", 
                "rotational": "1", 
                "sas_address": null, 
                "sas_device_handle": null, 
                "scheduler_mode": "none", 
                "sectors": "0", 
                "sectorsize": "512", 
                "size": "0.00 Bytes", 
                "support_discard": "0", 
                "vendor": null, 
                "virtual": 1
            }, 
            "loop3": {
                "holders": [], 
                "host": "", 
                "links": {
                    "ids": [], 
                    "labels": [], 
                    "masters": [], 
                    "uuids": []
                }, 
                "model": null, 
                "partitions": {}, 
                "removable": "0", 
                "rotational": "1", 
                "sas_address": null, 
                "sas_device_handle": null, 
                "scheduler_mode": "none", 
                "sectors": "0", 
                "sectorsize": "512", 
                "size": "0.00 Bytes", 
                "support_discard": "0", 
                "vendor": null, 
                "virtual": 1
            }, 
            "loop4": {
                "holders": [], 
                "host": "", 
                "links": {
                    "ids": [], 
                    "labels": [], 
                    "masters": [], 
                    "uuids": []
                }, 
                "model": null, 
                "partitions": {}, 
                "removable": "0", 
                "rotational": "1", 
                "sas_address": null, 
                "sas_device_handle": null, 
                "scheduler_mode": "none", 
                "sectors": "0", 
                "sectorsize": "512", 
                "size": "0.00 Bytes", 
                "support_discard": "0", 
                "vendor": null, 
                "virtual": 1
            }, 
            "loop5": {
                "holders": [], 
                "host": "", 
                "links": {
                    "ids": [], 
                    "labels": [], 
                    "masters": [], 
                    "uuids": []
                }, 
                "model": null, 
                "partitions": {}, 
                "removable": "0", 
                "rotational": "1", 
                "sas_address": null, 
                "sas_device_handle": null, 
                "scheduler_mode": "none", 
                "sectors": "0", 
                "sectorsize": "512", 
                "size": "0.00 Bytes", 
                "support_discard": "0", 
                "vendor": null, 
                "virtual": 1
            }, 
            "loop6": {
                "holders": [], 
                "host": "", 
                "links": {
                    "ids": [], 
                    "labels": [], 
                    "masters": [], 
                    "uuids": []
                }, 
                "model": null, 
                "partitions": {}, 
                "removable": "0", 
                "rotational": "1", 
                "sas_address": null, 
                "sas_device_handle": null, 
                "scheduler_mode": "none", 
                "sectors": "0", 
                "sectorsize": "512", 
                "size": "0.00 Bytes", 
                "support_discard": "0", 
                "vendor": null, 
                "virtual": 1
            }, 
            "loop7": {
                "holders": [], 
                "host": "", 
                "links": {
                    "ids": [], 
                    "labels": [], 
                    "masters": [], 
                    "uuids": []
                }, 
                "model": null, 
                "partitions": {}, 
                "removable": "0", 
                "rotational": "1", 
                "sas_address": null, 
                "sas_device_handle": null, 
                "scheduler_mode": "none", 
                "sectors": "0", 
                "sectorsize": "512", 
                "size": "0.00 Bytes", 
                "support_discard": "0", 
                "vendor": null, 
                "virtual": 1
            }, 
            "vda": {
                "holders": [], 
                "host": "SCSI storage controller: Red Hat, Inc Virtio block device (rev 01)", 
                "links": {
                    "ids": [
                        "virtio-c73433ca-8dce-4ca5-8"
                    ], 
                    "labels": [], 
                    "masters": [], 
                    "uuids": []
                }, 
                "model": null, 
                "partitions": {
                    "vda1": {
                        "holders": [], 
                        "links": {
                            "ids": [
                                "virtio-c73433ca-8dce-4ca5-8-part1"
                            ], 
                            "labels": [], 
                            "masters": [], 
                            "uuids": [
                                "fd694735-9f36-470c-9c7c-aae381aa886a"
                            ]
                        }, 
                        "sectors": "76169216", 
                        "sectorsize": 512, 
                        "size": "36.32 GB", 
                        "start": "2048", 
                        "uuid": "fd694735-9f36-470c-9c7c-aae381aa886a"
                    }, 
                    "vda2": {
                        "holders": [], 
                        "links": {
                            "ids": [
                                "virtio-c73433ca-8dce-4ca5-8-part2"
                            ], 
                            "labels": [], 
                            "masters": [], 
                            "uuids": [
                                "97DA-23C5"
                            ]
                        }, 
                        "sectors": "7712768", 
                        "sectorsize": 512, 
                        "size": "3.68 GB", 
                        "start": "76171264", 
                        "uuid": "97DA-23C5"
                    }
                }, 
                "removable": "0", 
                "rotational": "1", 
                "sas_address": null, 
                "sas_device_handle": null, 
                "scheduler_mode": "none", 
                "sectors": "83886080", 
                "sectorsize": "512", 
                "size": "40.00 GB", 
                "support_discard": "0", 
                "vendor": "0x1af4", 
                "virtual": 1
            }, 
            "vdb": {
                "holders": [], 
                "host": "SCSI storage controller: Red Hat, Inc Virtio block device (rev 01)", 
                "links": {
                    "ids": [
                        "virtio-c803c677-7cee-4edb-9"
                    ], 
                    "labels": [], 
                    "masters": [], 
                    "uuids": [
                        "3fab9476-573b-489f-a63f-bceb02ca38c1"
                    ]
                }, 
                "model": null, 
                "partitions": {}, 
                "removable": "0", 
                "rotational": "1", 
                "sas_address": null, 
                "sas_device_handle": null, 
                "scheduler_mode": "none", 
                "sectors": "209715200", 
                "sectorsize": "512", 
                "size": "100.00 GB", 
                "support_discard": "0", 
                "vendor": "0x1af4", 
                "virtual": 1
            }
        }, 
        "ansible_distribution": "Ubuntu", 
        "ansible_distribution_file_parsed": true, 
        "ansible_distribution_file_path": "/etc/os-release", 
        "ansible_distribution_file_variety": "Debian", 
        "ansible_distribution_major_version": "18", 
        "ansible_distribution_release": "bionic", 
        "ansible_distribution_version": "18.04", 
        "ansible_dns": {
            "nameservers": [
                "127.0.0.53"
            ], 
            "options": {
                "single-request-reopen": true
            }, 
            "search": [
                "openstacklocal"
            ]
        }, 
        "ansible_docker0": {
            "active": false, 
            "device": "docker0", 
            "features": {
                "esp_hw_offload": "off [fixed]", 
                "esp_tx_csum_hw_offload": "off [fixed]", 
                "fcoe_mtu": "off [fixed]", 
                "generic_receive_offload": "on", 
                "generic_segmentation_offload": "on", 
                "highdma": "on", 
                "hw_tc_offload": "off [fixed]", 
                "l2_fwd_offload": "off [fixed]", 
                "large_receive_offload": "off [fixed]", 
                "loopback": "off [fixed]", 
                "netns_local": "on [fixed]", 
                "ntuple_filters": "off [fixed]", 
                "receive_hashing": "off [fixed]", 
                "rx_all": "off [fixed]", 
                "rx_checksumming": "off [fixed]", 
                "rx_fcs": "off [fixed]", 
                "rx_udp_tunnel_port_offload": "off [fixed]", 
                "rx_vlan_filter": "off [fixed]", 
                "rx_vlan_offload": "off [fixed]", 
                "rx_vlan_stag_filter": "off [fixed]", 
                "rx_vlan_stag_hw_parse": "off [fixed]", 
                "scatter_gather": "on", 
                "tcp_segmentation_offload": "on", 
                "tx_checksum_fcoe_crc": "off [fixed]", 
                "tx_checksum_ip_generic": "on", 
                "tx_checksum_ipv4": "off [fixed]", 
                "tx_checksum_ipv6": "off [fixed]", 
                "tx_checksum_sctp": "off [fixed]", 
                "tx_checksumming": "on", 
                "tx_esp_segmentation": "on", 
                "tx_fcoe_segmentation": "on", 
                "tx_gre_csum_segmentation": "on", 
                "tx_gre_segmentation": "on", 
                "tx_gso_partial": "on", 
                "tx_gso_robust": "on", 
                "tx_ipxip4_segmentation": "on", 
                "tx_ipxip6_segmentation": "on", 
                "tx_lockless": "on [fixed]", 
                "tx_nocache_copy": "off", 
                "tx_scatter_gather": "on", 
                "tx_scatter_gather_fraglist": "on", 
                "tx_sctp_segmentation": "on", 
                "tx_tcp6_segmentation": "on", 
                "tx_tcp_ecn_segmentation": "on", 
                "tx_tcp_mangleid_segmentation": "on", 
                "tx_tcp_segmentation": "on", 
                "tx_udp_tnl_csum_segmentation": "on", 
                "tx_udp_tnl_segmentation": "on", 
                "tx_vlan_offload": "on", 
                "tx_vlan_stag_hw_insert": "on", 
                "udp_fragmentation_offload": "off", 
                "vlan_challenged": "off [fixed]"
            }, 
            "hw_timestamp_filters": [], 
            "id": "8000.0242f7f80cc2", 
            "interfaces": [], 
            "ipv4": {
                "address": "169.254.31.1", 
                "broadcast": "169.254.31.255", 
                "netmask": "255.255.255.0", 
                "network": "169.254.31.0"
            }, 
            "macaddress": "02:42:f7:f8:0c:c2", 
            "mtu": 1500, 
            "promisc": false, 
            "stp": false, 
            "timestamping": [
                "rx_software", 
                "software"
            ], 
            "type": "bridge"
        }, 
        "ansible_domain": "", 
        "ansible_effective_group_id": 0, 
        "ansible_effective_user_id": 0, 
        "ansible_env": {
            "HOME": "/root", 
            "LANG": "C", 
            "LC_ALL": "C", 
            "LC_NUMERIC": "C", 
            "LOGNAME": "root", 
            "MAIL": "/var/mail/root", 
            "PATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games", 
            "PWD": "/root", 
            "SHELL": "/bin/bash", 
            "SHLVL": "1", 
            "SSH_CLIENT": "172.16.0.143 44134 22", 
            "SSH_CONNECTION": "172.16.0.143 44134 172.16.0.143 22", 
            "USER": "root", 
            "XDG_RUNTIME_DIR": "/run/user/0", 
            "XDG_SESSION_ID": "49", 
            "_": "/bin/sh"
        }, 
        "ansible_eth0": {
            "active": true, 
            "device": "eth0", 
            "features": {
                "esp_hw_offload": "off [fixed]", 
                "esp_tx_csum_hw_offload": "off [fixed]", 
                "fcoe_mtu": "off [fixed]", 
                "generic_receive_offload": "on", 
                "generic_segmentation_offload": "on", 
                "highdma": "on [fixed]", 
                "hw_tc_offload": "off [fixed]", 
                "l2_fwd_offload": "off [fixed]", 
                "large_receive_offload": "off [fixed]", 
                "loopback": "off [fixed]", 
                "netns_local": "off [fixed]", 
                "ntuple_filters": "off [fixed]", 
                "receive_hashing": "off [fixed]", 
                "rx_all": "off [fixed]", 
                "rx_checksumming": "on [fixed]", 
                "rx_fcs": "off [fixed]", 
                "rx_udp_tunnel_port_offload": "off [fixed]", 
                "rx_vlan_filter": "on [fixed]", 
                "rx_vlan_offload": "off [fixed]", 
                "rx_vlan_stag_filter": "off [fixed]", 
                "rx_vlan_stag_hw_parse": "off [fixed]", 
                "scatter_gather": "on", 
                "tcp_segmentation_offload": "on", 
                "tx_checksum_fcoe_crc": "off [fixed]", 
                "tx_checksum_ip_generic": "on", 
                "tx_checksum_ipv4": "off [fixed]", 
                "tx_checksum_ipv6": "off [fixed]", 
                "tx_checksum_sctp": "off [fixed]", 
                "tx_checksumming": "on", 
                "tx_esp_segmentation": "off [fixed]", 
                "tx_fcoe_segmentation": "off [fixed]", 
                "tx_gre_csum_segmentation": "off [fixed]", 
                "tx_gre_segmentation": "off [fixed]", 
                "tx_gso_partial": "off [fixed]", 
                "tx_gso_robust": "on [fixed]", 
                "tx_ipxip4_segmentation": "off [fixed]", 
                "tx_ipxip6_segmentation": "off [fixed]", 
                "tx_lockless": "off [fixed]", 
                "tx_nocache_copy": "off", 
                "tx_scatter_gather": "on", 
                "tx_scatter_gather_fraglist": "off [fixed]", 
                "tx_sctp_segmentation": "off [fixed]", 
                "tx_tcp6_segmentation": "on", 
                "tx_tcp_ecn_segmentation": "off [fixed]", 
                "tx_tcp_mangleid_segmentation": "off", 
                "tx_tcp_segmentation": "on", 
                "tx_udp_tnl_csum_segmentation": "off [fixed]", 
                "tx_udp_tnl_segmentation": "off [fixed]", 
                "tx_vlan_offload": "off [fixed]", 
                "tx_vlan_stag_hw_insert": "off [fixed]", 
                "udp_fragmentation_offload": "off", 
                "vlan_challenged": "off [fixed]"
            }, 
            "hw_timestamp_filters": [], 
            "ipv4": {
                "address": "172.16.0.143", 
                "broadcast": "172.16.0.255", 
                "netmask": "255.255.255.0", 
                "network": "172.16.0.0"
            }, 
            "macaddress": "fa:16:3e:fe:b9:07", 
            "module": "virtio_net", 
            "mtu": 1500, 
            "pciid": "virtio3", 
            "promisc": false, 
            "speed": -1, 
            "timestamping": [
                "tx_software", 
                "rx_software", 
                "software"
            ], 
            "type": "ether"
        }, 
        "ansible_fibre_channel_wwn": [], 
        "ansible_fips": false, 
        "ansible_flannel.1": {
            "active": true, 
            "device": "flannel.1", 
            "features": {
                "esp_hw_offload": "off [fixed]", 
                "esp_tx_csum_hw_offload": "off [fixed]", 
                "fcoe_mtu": "off [fixed]", 
                "generic_receive_offload": "on", 
                "generic_segmentation_offload": "on", 
                "highdma": "off [fixed]", 
                "hw_tc_offload": "off [fixed]", 
                "l2_fwd_offload": "off [fixed]", 
                "large_receive_offload": "off [fixed]", 
                "loopback": "off [fixed]", 
                "netns_local": "off [fixed]", 
                "ntuple_filters": "off [fixed]", 
                "receive_hashing": "off [fixed]", 
                "rx_all": "off [fixed]", 
                "rx_checksumming": "on", 
                "rx_fcs": "off [fixed]", 
                "rx_udp_tunnel_port_offload": "off [fixed]", 
                "rx_vlan_filter": "off [fixed]", 
                "rx_vlan_offload": "off [fixed]", 
                "rx_vlan_stag_filter": "off [fixed]", 
                "rx_vlan_stag_hw_parse": "off [fixed]", 
                "scatter_gather": "on", 
                "tcp_segmentation_offload": "on", 
                "tx_checksum_fcoe_crc": "off [fixed]", 
                "tx_checksum_ip_generic": "on", 
                "tx_checksum_ipv4": "off [fixed]", 
                "tx_checksum_ipv6": "off [fixed]", 
                "tx_checksum_sctp": "off [fixed]", 
                "tx_checksumming": "on", 
                "tx_esp_segmentation": "off [fixed]", 
                "tx_fcoe_segmentation": "off [fixed]", 
                "tx_gre_csum_segmentation": "off [fixed]", 
                "tx_gre_segmentation": "off [fixed]", 
                "tx_gso_partial": "off [fixed]", 
                "tx_gso_robust": "off [fixed]", 
                "tx_ipxip4_segmentation": "off [fixed]", 
                "tx_ipxip6_segmentation": "off [fixed]", 
                "tx_lockless": "on [fixed]", 
                "tx_nocache_copy": "off", 
                "tx_scatter_gather": "on", 
                "tx_scatter_gather_fraglist": "off [fixed]", 
                "tx_sctp_segmentation": "on", 
                "tx_tcp6_segmentation": "on", 
                "tx_tcp_ecn_segmentation": "on", 
                "tx_tcp_mangleid_segmentation": "on", 
                "tx_tcp_segmentation": "on", 
                "tx_udp_tnl_csum_segmentation": "off [fixed]", 
                "tx_udp_tnl_segmentation": "off [fixed]", 
                "tx_vlan_offload": "off [fixed]", 
                "tx_vlan_stag_hw_insert": "off [fixed]", 
                "udp_fragmentation_offload": "off", 
                "vlan_challenged": "off [fixed]"
            }, 
            "hw_timestamp_filters": [], 
            "ipv4": {
                "address": "10.58.1.0", 
                "broadcast": "global", 
                "netmask": "255.255.255.255", 
                "network": "10.58.1.0"
            }, 
            "macaddress": "02:56:20:ec:e5:2c", 
            "mtu": 1450, 
            "promisc": false, 
            "timestamping": [
                "rx_software", 
                "software"
            ], 
            "type": "ether"
        }, 
        "ansible_form_factor": "Other", 
        "ansible_fqdn": "ubuntu", 
        "ansible_hostname": "k8s-arm64-dev-master-0001", 
        "ansible_hostnqn": "", 
        "ansible_interfaces": [
            "cni0", 
            "docker0", 
            "lo", 
            "flannel.1", 
            "tunl0", 
            "eth0", 
            "veth22ff1102"
        ], 
        "ansible_is_chroot": false, 
        "ansible_iscsi_iqn": "iqn.1993-08.org.debian:01:6287d09e6157", 
        "ansible_kernel": "4.15.0-29-generic", 
        "ansible_lo": {
            "active": true, 
            "device": "lo", 
            "features": {
                "esp_hw_offload": "off [fixed]", 
                "esp_tx_csum_hw_offload": "off [fixed]", 
                "fcoe_mtu": "off [fixed]", 
                "generic_receive_offload": "on", 
                "generic_segmentation_offload": "on", 
                "highdma": "on [fixed]", 
                "hw_tc_offload": "off [fixed]", 
                "l2_fwd_offload": "off [fixed]", 
                "large_receive_offload": "off [fixed]", 
                "loopback": "on [fixed]", 
                "netns_local": "on [fixed]", 
                "ntuple_filters": "off [fixed]", 
                "receive_hashing": "off [fixed]", 
                "rx_all": "off [fixed]", 
                "rx_checksumming": "on [fixed]", 
                "rx_fcs": "off [fixed]", 
                "rx_udp_tunnel_port_offload": "off [fixed]", 
                "rx_vlan_filter": "off [fixed]", 
                "rx_vlan_offload": "off [fixed]", 
                "rx_vlan_stag_filter": "off [fixed]", 
                "rx_vlan_stag_hw_parse": "off [fixed]", 
                "scatter_gather": "on", 
                "tcp_segmentation_offload": "on", 
                "tx_checksum_fcoe_crc": "off [fixed]", 
                "tx_checksum_ip_generic": "on [fixed]", 
                "tx_checksum_ipv4": "off [fixed]", 
                "tx_checksum_ipv6": "off [fixed]", 
                "tx_checksum_sctp": "on [fixed]", 
                "tx_checksumming": "on", 
                "tx_esp_segmentation": "off [fixed]", 
                "tx_fcoe_segmentation": "off [fixed]", 
                "tx_gre_csum_segmentation": "off [fixed]", 
                "tx_gre_segmentation": "off [fixed]", 
                "tx_gso_partial": "off [fixed]", 
                "tx_gso_robust": "off [fixed]", 
                "tx_ipxip4_segmentation": "off [fixed]", 
                "tx_ipxip6_segmentation": "off [fixed]", 
                "tx_lockless": "on [fixed]", 
                "tx_nocache_copy": "off [fixed]", 
                "tx_scatter_gather": "on [fixed]", 
                "tx_scatter_gather_fraglist": "on [fixed]", 
                "tx_sctp_segmentation": "on", 
                "tx_tcp6_segmentation": "on", 
                "tx_tcp_ecn_segmentation": "on", 
                "tx_tcp_mangleid_segmentation": "on", 
                "tx_tcp_segmentation": "on", 
                "tx_udp_tnl_csum_segmentation": "off [fixed]", 
                "tx_udp_tnl_segmentation": "off [fixed]", 
                "tx_vlan_offload": "off [fixed]", 
                "tx_vlan_stag_hw_insert": "off [fixed]", 
                "udp_fragmentation_offload": "off", 
                "vlan_challenged": "on [fixed]"
            }, 
            "hw_timestamp_filters": [], 
            "ipv4": {
                "address": "127.0.0.1", 
                "broadcast": "host", 
                "netmask": "255.0.0.0", 
                "network": "127.0.0.0"
            }, 
            "mtu": 65536, 
            "promisc": false, 
            "timestamping": [
                "tx_software", 
                "rx_software", 
                "software"
            ], 
            "type": "loopback"
        }, 
        "ansible_local": {}, 
        "ansible_lsb": {
            "codename": "bionic", 
            "description": "Ubuntu 18.04.1 LTS", 
            "id": "Ubuntu", 
            "major_release": "18", 
            "release": "18.04"
        }, 
        "ansible_lvm": {
            "lvs": {}, 
            "pvs": {}, 
            "vgs": {}
        }, 
        "ansible_machine": "aarch64", 
        "ansible_machine_id": "3429daa6fdb44a7ca005e42a710f6fff", 
        "ansible_memfree_mb": 303, 
        "ansible_memory_mb": {
            "nocache": {
                "free": 3013, 
                "used": 928
            }, 
            "real": {
                "free": 303, 
                "total": 3941, 
                "used": 3638
            }, 
            "swap": {
                "cached": 0, 
                "free": 0, 
                "total": 0, 
                "used": 0
            }
        }, 
        "ansible_memtotal_mb": 3941, 
        "ansible_mounts": [
            {
                "block_available": 24341736, 
                "block_size": 4096, 
                "block_total": 25671918, 
                "block_used": 1330182, 
                "device": "/dev/vdb", 
                "fstype": "ext4", 
                "inode_available": 6553589, 
                "inode_total": 6553600, 
                "inode_used": 11, 
                "mount": "/data/var/lib/dcoker", 
                "options": "rw,relatime,data=ordered", 
                "size_available": 99703750656, 
                "size_total": 105152176128, 
                "uuid": "3fab9476-573b-489f-a63f-bceb02ca38c1"
            }, 
            {
                "block_available": 60243, 
                "block_size": 65536, 
                "block_total": 60250, 
                "block_used": 7, 
                "device": "/dev/vda2", 
                "fstype": "vfat", 
                "inode_available": 0, 
                "inode_total": 0, 
                "inode_used": 0, 
                "mount": "/boot/efi", 
                "options": "rw,relatime,fmask=0077,dmask=0077,codepage=437,iocharset=iso8859-1,shortname=mixed,errors=remount-ro", 
                "size_available": 3948085248, 
                "size_total": 3948544000, 
                "uuid": "97DA-23C5"
            }, 
            {
                "block_available": 6482831, 
                "block_size": 4096, 
                "block_total": 9305970, 
                "block_used": 2823139, 
                "device": "/dev/vda1", 
                "fstype": "ext4", 
                "inode_available": 2252984, 
                "inode_total": 2383872, 
                "inode_used": 130888, 
                "mount": "/", 
                "options": "rw,relatime,errors=remount-ro,data=ordered", 
                "size_available": 26553675776, 
                "size_total": 38117253120, 
                "uuid": "fd694735-9f36-470c-9c7c-aae381aa886a"
            }
        ], 
        "ansible_nodename": "k8s-arm64-dev-master-0001", 
        "ansible_os_family": "Debian", 
        "ansible_pkg_mgr": "apt", 
        "ansible_proc_cmdline": {
            "BOOT_IMAGE": "/boot/vmlinuz-4.15.0-29-generic", 
            "net.ifnames": "0", 
            "ro": true, 
            "root": "UUID=fd694735-9f36-470c-9c7c-aae381aa886a"
        }, 
        "ansible_processor": [
            "0", 
            "1"
        ], 
        "ansible_processor_cores": 1, 
        "ansible_processor_count": 2, 
        "ansible_processor_threads_per_core": 1, 
        "ansible_processor_vcpus": 2, 
        "ansible_product_name": "KVM Virtual Machine", 
        "ansible_product_serial": "NA", 
        "ansible_product_uuid": "F8904BE9-8638-4D66-A08D-F549C016BE4E", 
        "ansible_product_version": "1.0", 
        "ansible_python": {
            "executable": "/usr/bin/python", 
            "has_sslcontext": true, 
            "type": "CPython", 
            "version": {
                "major": 2, 
                "micro": 15, 
                "minor": 7, 
                "releaselevel": "candidate", 
                "serial": 1
            }, 
            "version_info": [
                2, 
                7, 
                15, 
                "candidate", 
                1
            ]
        }, 
        "ansible_python_version": "2.7.15rc1", 
        "ansible_real_group_id": 0, 
        "ansible_real_user_id": 0, 
        "ansible_selinux": {
            "status": "Missing selinux Python library"
        }, 
        "ansible_selinux_python_present": false, 
        "ansible_service_mgr": "systemd", 
        "ansible_ssh_host_key_dsa_public": "AAAAB3NzaC1kc3MAAACBANjP7cpCxEAqHFXScaBW80uO/Z7ZDDGBEel3wdOdkRr7j++EE2lcImfJkh0JCfhJJEDKjhqNeM3pHdhjyvVRFB9vJX8KGJRVAlbiDzxVkZI1pB2KIiABfiUnByuwCU0FFZbpUzPlNyEBid2M7whqI2BvDaXH67D33NmVUPDzBBDFAAAAFQD4S5F2pYlhYTpolDJfpGWNfI+WFwAAAIEAkfRYwf8gJK1Lz+saDbN3JVbjDzPP3mUSrY3AqBUFy1cls/9Fj6xl9SLHmyWiHS4Rhqze/PNb4viAsGIYc7he7MfkQh2wB5Eq/uyUVEf5eSKC7qi+y8IEjSDYxp0h+k3RG+7DMXdydZ6uBPlvHWoYkfruxG8t6K7vUMja0gaS2kYAAACAGkzGnUWj/f9oGhB+/mvIuXt6ko8GFC85SG7oer/c/sf+1iBS8tek1tMZ4mPJrOokzesEy+Pu8WxZ+y36jztyQFytkF05ecvmwSUhBrIraJ0QQ2DLyhOTg75XIc+ocezmsJrDBmc8W/WpF779tHtVMNtg67mp3yuNjxMoaVoG0i8=", 
        "ansible_ssh_host_key_ecdsa_public": "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBHAbcKrz2iUi/fNFnEI5wySM5CEBH90bJiCm6pDvsTDIFCiNj96ekJ0uI826O0jFgadhL3EjEDe1IFBCk5logGA=", 
        "ansible_ssh_host_key_ed25519_public": "AAAAC3NzaC1lZDI1NTE5AAAAIHuYgoOIt1soh86x/cyv6oZ4uggLwBuuV9zPDLnKCRGv", 
        "ansible_ssh_host_key_rsa_public": "AAAAB3NzaC1yc2EAAAADAQABAAABAQC/EAsEEQ0cA6xNZPkmfiKGjfKfIaTsYyBKV1MasoiEXL54Z6nCfAMt5xTfOWpzpdfMrmNwy42OziNpsKeRLLfh1HZKZErZhnGVfSkWbfluuiBPbMAOW2IlONzGA1HIg07ROiNfaUP6kbPWrPcp8cXHfeWMvQQ1cH4qlBL2g8IWVkrOoYAiyWUANqCO1iRTF215pyGBu3OLX5v/SDBNLweMl/aMRiDiuCiG6a1bUb0z3tD+GzlEB5oBXn+kaAylmDQSYS/YmLAC01vwKj6tuE4tkJN6uis90Z9WSipYgrpU+vqgup2SrzRpts+PQZJOJQ8OrqMQO4mxFfgwGWWuYQmL", 
        "ansible_swapfree_mb": 0, 
        "ansible_swaptotal_mb": 0, 
        "ansible_system": "Linux", 
        "ansible_system_capabilities": [
            "cap_chown", 
            "cap_dac_override", 
            "cap_dac_read_search", 
            "cap_fowner", 
            "cap_fsetid", 
            "cap_kill", 
            "cap_setgid", 
            "cap_setuid", 
            "cap_setpcap", 
            "cap_linux_immutable", 
            "cap_net_bind_service", 
            "cap_net_broadcast", 
            "cap_net_admin", 
            "cap_net_raw", 
            "cap_ipc_lock", 
            "cap_ipc_owner", 
            "cap_sys_module", 
            "cap_sys_rawio", 
            "cap_sys_chroot", 
            "cap_sys_ptrace", 
            "cap_sys_pacct", 
            "cap_sys_admin", 
            "cap_sys_boot", 
            "cap_sys_nice", 
            "cap_sys_resource", 
            "cap_sys_time", 
            "cap_sys_tty_config", 
            "cap_mknod", 
            "cap_lease", 
            "cap_audit_write", 
            "cap_audit_control", 
            "cap_setfcap", 
            "cap_mac_override", 
            "cap_mac_admin", 
            "cap_syslog", 
            "cap_wake_alarm", 
            "cap_block_suspend", 
            "cap_audit_read+ep"
        ], 
        "ansible_system_capabilities_enforced": "True", 
        "ansible_system_vendor": "QEMU", 
        "ansible_tunl0": {
            "active": false, 
            "device": "tunl0", 
            "features": {
                "esp_hw_offload": "off [fixed]", 
                "esp_tx_csum_hw_offload": "off [fixed]", 
                "fcoe_mtu": "off [fixed]", 
                "generic_receive_offload": "on", 
                "generic_segmentation_offload": "on", 
                "highdma": "on", 
                "hw_tc_offload": "off [fixed]", 
                "l2_fwd_offload": "off [fixed]", 
                "large_receive_offload": "off [fixed]", 
                "loopback": "off [fixed]", 
                "netns_local": "on [fixed]", 
                "ntuple_filters": "off [fixed]", 
                "receive_hashing": "off [fixed]", 
                "rx_all": "off [fixed]", 
                "rx_checksumming": "off [fixed]", 
                "rx_fcs": "off [fixed]", 
                "rx_udp_tunnel_port_offload": "off [fixed]", 
                "rx_vlan_filter": "off [fixed]", 
                "rx_vlan_offload": "off [fixed]", 
                "rx_vlan_stag_filter": "off [fixed]", 
                "rx_vlan_stag_hw_parse": "off [fixed]", 
                "scatter_gather": "on", 
                "tcp_segmentation_offload": "on", 
                "tx_checksum_fcoe_crc": "off [fixed]", 
                "tx_checksum_ip_generic": "on", 
                "tx_checksum_ipv4": "off [fixed]", 
                "tx_checksum_ipv6": "off [fixed]", 
                "tx_checksum_sctp": "off [fixed]", 
                "tx_checksumming": "on", 
                "tx_esp_segmentation": "off [fixed]", 
                "tx_fcoe_segmentation": "off [fixed]", 
                "tx_gre_csum_segmentation": "off [fixed]", 
                "tx_gre_segmentation": "off [fixed]", 
                "tx_gso_partial": "off [fixed]", 
                "tx_gso_robust": "off [fixed]", 
                "tx_ipxip4_segmentation": "off [fixed]", 
                "tx_ipxip6_segmentation": "off [fixed]", 
                "tx_lockless": "on [fixed]", 
                "tx_nocache_copy": "off", 
                "tx_scatter_gather": "on", 
                "tx_scatter_gather_fraglist": "on", 
                "tx_sctp_segmentation": "on", 
                "tx_tcp6_segmentation": "on", 
                "tx_tcp_ecn_segmentation": "on", 
                "tx_tcp_mangleid_segmentation": "on", 
                "tx_tcp_segmentation": "on", 
                "tx_udp_tnl_csum_segmentation": "off [fixed]", 
                "tx_udp_tnl_segmentation": "off [fixed]", 
                "tx_vlan_offload": "off [fixed]", 
                "tx_vlan_stag_hw_insert": "off [fixed]", 
                "udp_fragmentation_offload": "off", 
                "vlan_challenged": "off [fixed]"
            }, 
            "hw_timestamp_filters": [], 
            "macaddress": "00:00:00:00", 
            "mtu": 1480, 
            "promisc": false, 
            "timestamping": [
                "rx_software", 
                "software"
            ], 
            "type": "unknown"
        }, 
        "ansible_uptime_seconds": 136633, 
        "ansible_user_dir": "/root", 
        "ansible_user_gecos": "root", 
        "ansible_user_gid": 0, 
        "ansible_user_id": "root", 
        "ansible_user_shell": "/bin/bash", 
        "ansible_user_uid": 0, 
        "ansible_userspace_bits": "64", 
        "ansible_veth22ff1102": {
            "active": true, 
            "device": "veth22ff1102", 
            "features": {
                "esp_hw_offload": "off [fixed]", 
                "esp_tx_csum_hw_offload": "off [fixed]", 
                "fcoe_mtu": "off [fixed]", 
                "generic_receive_offload": "on", 
                "generic_segmentation_offload": "on", 
                "highdma": "on", 
                "hw_tc_offload": "off [fixed]", 
                "l2_fwd_offload": "off [fixed]", 
                "large_receive_offload": "off [fixed]", 
                "loopback": "off [fixed]", 
                "netns_local": "off [fixed]", 
                "ntuple_filters": "off [fixed]", 
                "receive_hashing": "off [fixed]", 
                "rx_all": "off [fixed]", 
                "rx_checksumming": "on", 
                "rx_fcs": "off [fixed]", 
                "rx_udp_tunnel_port_offload": "off [fixed]", 
                "rx_vlan_filter": "off [fixed]", 
                "rx_vlan_offload": "on", 
                "rx_vlan_stag_filter": "off [fixed]", 
                "rx_vlan_stag_hw_parse": "on", 
                "scatter_gather": "on", 
                "tcp_segmentation_offload": "on", 
                "tx_checksum_fcoe_crc": "off [fixed]", 
                "tx_checksum_ip_generic": "on", 
                "tx_checksum_ipv4": "off [fixed]", 
                "tx_checksum_ipv6": "off [fixed]", 
                "tx_checksum_sctp": "on", 
                "tx_checksumming": "on", 
                "tx_esp_segmentation": "off [fixed]", 
                "tx_fcoe_segmentation": "off [fixed]", 
                "tx_gre_csum_segmentation": "on", 
                "tx_gre_segmentation": "on", 
                "tx_gso_partial": "off [fixed]", 
                "tx_gso_robust": "off [fixed]", 
                "tx_ipxip4_segmentation": "on", 
                "tx_ipxip6_segmentation": "on", 
                "tx_lockless": "on [fixed]", 
                "tx_nocache_copy": "off", 
                "tx_scatter_gather": "on", 
                "tx_scatter_gather_fraglist": "on", 
                "tx_sctp_segmentation": "on", 
                "tx_tcp6_segmentation": "on", 
                "tx_tcp_ecn_segmentation": "on", 
                "tx_tcp_mangleid_segmentation": "on", 
                "tx_tcp_segmentation": "on", 
                "tx_udp_tnl_csum_segmentation": "on", 
                "tx_udp_tnl_segmentation": "on", 
                "tx_vlan_offload": "on", 
                "tx_vlan_stag_hw_insert": "on", 
                "udp_fragmentation_offload": "off", 
                "vlan_challenged": "off [fixed]"
            }, 
            "hw_timestamp_filters": [], 
            "macaddress": "a6:f1:f4:39:e2:83", 
            "mtu": 1450, 
            "promisc": true, 
            "speed": 10000, 
            "timestamping": [
                "rx_software", 
                "software"
            ], 
            "type": "ether"
        }, 
        "ansible_virtualization_role": "guest", 
        "ansible_virtualization_type": "kvm", 
        "discovered_interpreter_python": "/usr/bin/python", 
        "gather_subset": [
            "all"
        ], 
        "module_setup": true
    }, 
    "changed": false
}


```
