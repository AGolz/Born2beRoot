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

__Download Rocky Linux ISO__. Download the ISO file for Rocky Linux from the official Rocky Linux download [page](https://rockylinux.org/ru/download).

__Open VirtualBox and Create a New VM__. After acquiring the Rocky Linux ISO, open VirtualBox and click on the `New` button to create a new VM.

A new window will open for the VM setup. Here, you need to specify several settings:
- __Name and Operating System__: Give your VM a name and specify the type and version of the operating system.Since we are installing Rocky linux, select `Linux` as the system and the required bit depth. 
- __Memory Size__: Allocate memory (RAM) for your VM. 
- __Hard Disk__: Choose `Create a virtual hard disk now` VirtualBox will create a virtual hard disk where Rocky Linux will be installed.

<img width="1014" alt="Screen Shot 2023-03-09 at 5 05 30 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/42764d43-7dda-4c8f-8cef-48fcd514422a">

__Configure Virtual Hard Disk__. In the subsequent window, you'll be asked to choose the hard disk file type, its size, and storage details.

Hard Disk File Type: Select `VDI (VirtualBox Disk Image)` as it is compatible with VirtualBox.

Storage on Physical Hard Disk: Choose `Dynamically allocated`, which means your virtual hard disk will grow as it is used, up to the maximum size you set.

File Location and Size: Finally, set the maximum size of the virtual hard disk. A minimum of 10GB is recommended for Rocky Linux, but if you can, allocate more space to avoid running out of space in the future.
 <img width="1023" alt="Screen Shot 2023-03-09 at 5 06 33 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/e6cfc159-c970-436d-84c8-5a3a5d861769">
 
__Configure VM Further__. Before we proceed to the installation of RockyLinux, we need to make a few more adjustments to our VM. Select your VM and click on `Settings`:
- __System__: Under the `System` tab, ensure that the boot order is set to `Optical` then `Hard Disk`.
- __Display__: Allocate video memory. The recommended minimum is 16MB.
- __Storage__: Here, you need to attach the Rocky Linux ISO you downloaded earlier. Under the `Controller: IDE`, click on the CD icon with a plus sign (Add Optical Drive), then choose `Add`. Navigate to the location of your Rocky Linux ISO, select it, and click `Choose`.
- __Network__: Under the "Network" tab, make sure the Adapter is attached to `NAT`. And let's redirect the necessary ports.

<div id="stat" align="center">
 <img width="1025" alt="Screen Shot 2023-05-10 at 3 08 40 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/32cc0a12-4b24-45e0-bd6c-c27120fa4ef1">
 <img width="1025" alt="Screen Shot 2023-05-10 at 3 09 57 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/527fcce7-58a1-4852-becb-c4dca765b7d5">
 <img width="713" alt="Screen Shot 2023-05-10 at 3 11 09 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/3a00d5c4-cd7c-4cd3-b64d-8874f90643df">
</div>

Once you've made all these adjustments, click `OK` to save the settings.

__Start the VM and Install Rocky Linux__. While graphical user interfaces (GUIs) have made operating systems more user-friendly, text mode installation offers a set of advantages, especially when it comes to server environments. Text mode is less resource-intensive and faster, and it allows installations on systems with low graphical capabilities. It's a valuable skill to master for anyone aiming for proficiency in system administration. However, you should always consider the available alternatives before starting a text-based installation. Text mode is limited in the amount of choices you can make during the installation.

Limits of interactive text mode installation include:
- The installer will always use the English language and the US English keyboard layout. You can configure your language and keyboard settings, but these settings will only apply to the installed system, not to the installation.
- You cannot configure any advanced storage methods (LVM, software RAID, FCoE, zFCP and iSCSI).
- It is not possible to configure custom partitioning; you must use one of the automatic partitioning settings. You also cannot configure where the boot loader will be installed.
- You cannot select any package add-ons to be installed; they must be added after the installation finishes using the DNF package manager.

But let's try to get around some of these limitations :)

Let's walk through the process of installing Rocky Linux in text mode.

__Start the VM__. Once you have configured your VM and attached the Rocky Linux ISO, start your VM. The Rocky Linux boot menu will appear. Press `tab` and start the installation using the `inst.text` boot parameter. 

<img width="955" alt="Screen Shot 2023-05-10 at 3 33 18 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/e7906cd1-0b3f-44d1-adb6-abe29f1bd303">

Thus, we pass the inst.text parameter to the installer

## Part IV: The Anaconda Installer - Facilitating the Rocky Linux Installation

Anaconda is the installation program used by Rocky Linux, Fedora, CentOS, and other Linux distributions. It is a versatile and powerful tool that allows you to install Linux on your system exactly how you want it.

In the background, Anaconda performs various tasks like partitioning the disks, setting up the file system, and installing the packages. But what you see as a user is a straightforward, step-by-step process that guides you through the installation.

Anaconda is capable of running in several modes, including:
- __Graphical mode__: This is the default mode and provides a graphical user interface (GUI) for user interaction. It's the most user-friendly mode and is generally recommended for new users or those who prefer a GUI.
- __Text mode__: As we discussed earlier, by passing the inst.text parameter at the boot menu, you can run Anaconda in text mode. This is a more streamlined, terminal-based version of the installer. It's beneficial for servers, systems with low resources, or remote installations.
- __Kickstart mode__: Anaconda can also use a kickstart file to perform automated installations. A kickstart file is a simple text file that contains the settings for an installation. Once you've created a kickstart file, you can use it to automate the installation process—greatly simplifying the task of installing Linux on multiple machines.

One of the strengths of Anaconda is its flexibility. It can handle complex storage setups with its advanced storage options like LVM (Logical Volume Management), RAID (Redundant Array of Inexpensive Disks), and disk encryption.

Anaconda also integrates network and hostname settings, allowing you to set up your network and hostname during the installation process. It even includes the ability to configure your system to connect to a wireless network.

Lastly, Anaconda offers a range of customizability in terms of software selection. You can choose between several base environments, each tailored for a specific use case (like "Minimal Install" for a basic setup, or "Server with GUI" for a more comprehensive setup), and add additional software packages as needed.

In summary, Anaconda is a feature-rich and flexible installer that makes the process of installing Linux distributions like Rocky Linux straightforward, efficient, and customizable. Whether you're a beginner or an experienced user, Anaconda's various modes and advanced features can accommodate your needs.

__Description of the installation__. You will be presented with an Installation Summary screen, where you will configure several aspects of the installation:

<img width="1259" alt="Screen Shot 2023-03-02 at 11 49 22 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/7ce9890c-e23d-49c5-837d-bb78284d4990">

In total, you will be presented with 9 points of the form each of which is quite simple and easy to set up. Specify the language, date and time, [NTP server](https://www.ntp-servers.net/servers.html), installation source, and so on.

More detailed information should be provided only about the fifth paragraph of the __"Installation Destination"__ form. Let's will try to split the disk into the partitions we need and create an encrypted LVM volume in text mode.

### fdisk and parted

### primary and extended part

### LVM
### LUKS
### lvm.conf
### ftstab file 

### SSH
#### sshd
#### Enabling ssh service
#### Rsync
### Firewall
#### Firewalld
#### Opening ports
#### SELinux
#### semanage 
