# Born2beRoot
(in progress)

## Harnessing the Power of Virtualization: Deploying a RockyLinux Server on VirtualBox for Ecole 42's Born2beRoot Project

### Introduction

Welcome to the world of server virtualization! As part of my educational journey at Ecole 42, I embarked on an exciting project - Born2beRoot. This educational initiative presented a unique opportunity to delve deeper into the world of operating systems, network administration, and system administration. It's designed to challenge students like me to deploy a server, enforcing stringent rules to ensure we understand and implement best practices in system and network management.

Born2beRoot is more than just a project; it's a testament to the capabilities of virtualization and its transformative impact on the world of technology. The project comes with a predefined set of rules and a well-laid-out subject matter to help guide the implementation. This, however, does not in any way limit creativity and problem-solving.

In this article, I will share my journey of deploying a server on RockyLinux in a VirtualBox environment. The experience was both challenging and enriching, providing me with invaluable hands-on experience in configuring and managing virtual servers. From the installation of the operating system, setting up network configurations, to ensuring secure user management, each step provided me with a deeper understanding of how servers function.

This article aims to serve as a comprehensive guide for anyone interested in undertaking a similar project. It will detail the theoretical aspects of virtual machines and VirtualBox before delving into the practical aspects of deploying a server on RockyLinux. So, whether you're a student, a budding system administrator, or a seasoned professional looking for some refreshers, this guide has something to offer. Let's dive in!

![emaksimo's b2beRoot](https://user-images.githubusercontent.com/51645091/221917201-45cedcb5-7568-466d-b2cd-fd52d3001af1.png)

## Part I: Understanding Virtual Machines and VirtualBox
### Virtual Machines: The Heart of Modern Development

Virtual Machines are emulations of computer systems. They run on a host operating system and provide the same functionality as a physical computer. Their operation involves replicating the dedicated hardware resources of a computer, including the CPU, RAM, and disk storage, among others, in a software-defined environment.

VMs have become ubiquitous in modern software development and IT infrastructure for several reasons. They allow for the separation of different applications and services on separate machines, enhancing security and manageability. They also enable users to run applications that require different operating systems on the same physical machine, which is particularly useful in software testing and development. Lastly, they allow for easier scaling and resource management, as resources can be allocated and deallocated to VMs based on demand.

### VirtualBox: A Powerful Virtualization Tool
One of the most popular tools for creating and managing VMs is VirtualBox, a free and open-source hypervisor developed by Oracle Corporation. VirtualBox supports a wide variety of guest operating systems including but not limited to Windows, Linux, and Solaris.

VirtualBox stands out because of its comprehensive feature set, which includes:
- Cross-platform compatibility: VirtualBox runs on a large number of 64-bit host operating systems.
- Multi-generation branched snapshots: VirtualBox allows you to save the VM state at a particular point in time, which can later be reverted to, allowing developers to 'go back in time'.
- Clean architecture and modularity: VirtualBox’s design makes it easy to control and manage.
- Guest Additions: This refers to software packages that can be installed on supported guest operating systems to improve performance and provide additional integration and communication with the host system.
- Shared folders: These allow for easy data exchange between host and guest operating systems.

## Rocky Linux
### inst.text
### anaconda
### fdisk and parted
### primary and extended part
### LVM
### LUKS
### lvm.conf
### ftstab file 

## Server on Rocky
### Configuring VB
### Installing Rocky
### SSH
#### sshd
#### Enabling ssh service
#### Rsync
### Firewall
#### Firewalld
#### Opening ports
#### SELinux
#### semanage 
