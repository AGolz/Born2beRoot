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
- __Cross-platform compatibility__: VirtualBox runs on a large number of 64-bit host operating systems.
- __Multi-generation branched` snapshots__: VirtualBox allows you to save the VM state at a particular point in time, which can later be reverted to, allowing developers to 'go back in time'.
- __Clean architecture and modularity__: VirtualBox’s design makes it easy to control and manage.
- __Guest Additions__: This refers to software packages that can be installed on supported guest operating systems to improve performance and provide additional integration and communication with the host system.
- __Shared folders__: These allow for easy data exchange between host and guest operating systems.

In conclusion, VirtualBox is a versatile and powerful tool that provides an effective solution for running multiple operating systems on a single machine without the risk of system crashes or conflicts. With its wide array of features, VirtualBox not only enhances the development and testing environment but also promotes efficient resource utilization. It's no wonder that it is a go-to choice for many in the world of virtualization!

With a good understanding of VirtualBox, we are now ready to dive into the realm of Linux distributions, specifically Rocky Linux. This open-source operating system provides a robust, stable, and high-performance environment for our server. Let's explore what RockyLinux has to offer and how we can set it up on our VirtualBox environment.

## Part II: Rocky Linux: A Community-Driven Enterprise Linux
### Rocky Linux
In the spectrum of Linux distributions, Rocky Linux has rapidly made a name for itself as a community-driven, enterprise-grade operating system. It was designed to be 100% bug-for-bug compatible with America's top enterprise Linux distribution, now that CentOS has shifted its focus towards CentOS Stream.

While the Born2beRoot project allows to use Debian, I chose RockyLinux to deploy my server for several key reasons:
- __Long-Term Support__: Rocky Linux is a result of a community enterprise endeavor designed for long-term support. This makes it a more reliable choice for server environments, which are typically designed for longevity and stability.
- __Enterprise-Ready__: Rocky Linux is built with enterprise usage in mind. This means it is designed for high stability and performance, as well as extensive testing, which are crucial aspects for a server environment.
- __Backward Compatibility__: As a downstream build of RHEL (Red Hat Enterprise Linux), Rocky Linux provides full binary compatibility with it. This compatibility ensures that software running on RHEL will run the same way on Rocky Linux.
- __Strong Community Support__: The community-driven aspect of Rocky Linux ensures a wide base of support. The community is active and responsive, which means troubleshooting assistance is readily available, a feature quite critical for server environments.
- __Frequent Updates__: With its robust community support, Rocky Linux benefits from regular updates and patches, ensuring that any bugs or security vulnerabilities are promptly addressed.
- __Free__: Last but not least, Rocky Linux is free. For students and budget-conscious enterprises, this is a significant advantage over other enterprise-grade operating systems.

In the next section, we will walk through the process of installing Rocky Linux on a VirtualBox VM, setting it up as a server, and exploring the various features and configurations that make it a powerful and flexible choice for server deployment.

## Part III: Setting Up VirtualBox for Rocky Linux
Here, we will walk through the steps of setting up VirtualBox for Rocky Linux.

__Download Rocky Linux ISO__
Download the ISO file for Rocky Linux from the official Rocky Linux download [page](https://rockylinux.org/ru/download).

__Open VirtualBox and Create a New VM__
After acquiring the Rocky Linux ISO, open VirtualBox and click on the "New" button to create a new VM.

A new window will open for the VM setup. Here, you need to specify several settings:
- __Name and Operating System__: Give your VM a name and specify the type and version of the operating system.Since we are installing Rocky linux, select "Linux" as the system and the required bit depth.
<img width="1014" alt="Screen Shot 2023-03-09 at 5 05 30 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/42764d43-7dda-4c8f-8cef-48fcd514422a">
- 



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
