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