# Born2beRoot
(in progress)

## Harnessing the Power of Virtualization: Deploying a RockyLinux Server on VirtualBox for Ecole 42's Born2beRoot Project

### Introduction

Welcome to the world of server virtualization! As part of my educational journey at [Ecole 42](https://42.fr/en/homepage/), I embarked on an exciting project - Born2beRoot. This educational initiative presented a unique opportunity to delve deeper into the world of operating systems, network administration, and system administration. It's designed to challenge students like me to deploy a server, enforcing stringent rules to ensure we understand and implement best practices in system and network management.

[Born2beRoot](https://github.com/AGolz/Born2beRoot/blob/main/en.subject.pdf) is more than just a project; it's a testament to the capabilities of virtualization and its transformative impact on the world of technology. The project comes with a predefined set of rules and a well-laid-out subject matter to help guide the implementation. This, however, does not in any way limit creativity and problem-solving.

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
- __Cross-platform compatibility__: VirtualBox runs on a large number of host operating systems.
- __Multi-generation branched snapshots__: VirtualBox allows you to save the VM state at a particular point in time, which can later be reverted to, allowing developers to "go back in time".
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

### Download Rocky Linux ISO.
Download the ISO file for Rocky Linux from the official Rocky Linux download [page](https://rockylinux.org/ru/download).

### Open VirtualBox and Create a New VM.
After acquiring the Rocky Linux ISO, open VirtualBox and click on the `New` button to create a new VM.

A new window will open for the VM setup. Here, you need to specify several settings:
- __Name and Operating System__: Give your VM a name and specify the type and version of the operating system.Since we are installing Rocky linux, select `Linux` as the system and the required bit depth. 
- __Memory Size__: Allocate memory (RAM) for your VM. 
- __Hard Disk__: Choose `Create a virtual hard disk now` VirtualBox will create a virtual hard disk where Rocky Linux will be installed.

<img width="1014" alt="Screen Shot 2023-03-09 at 5 05 30 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/42764d43-7dda-4c8f-8cef-48fcd514422a">

### Configure Virtual Hard Disk.

In the subsequent window, you'll be asked to choose the hard disk file type, its size, and storage details.

Hard Disk File Type: Select `VDI (VirtualBox Disk Image)` as it is compatible with VirtualBox.

Storage on Physical Hard Disk: Choose `Dynamically allocated`, which means your virtual hard disk will grow as it is used, up to the maximum size you set.

File Location and Size: Finally, set the maximum size of the virtual hard disk. A minimum of 10GB is recommended for Rocky Linux, but if you can, allocate more space to avoid running out of space in the future.
 <img width="1023" alt="Screen Shot 2023-03-09 at 5 06 33 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/e6cfc159-c970-436d-84c8-5a3a5d861769">
 
### Configure VM Further. 

Before we proceed to the installation of RockyLinux, we need to make a few more adjustments to our VM. Select your VM and click on `Settings`:
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

### Start the VM and Install Rocky Linux.

While graphical user interfaces (GUIs) have made operating systems more user-friendly, text mode installation offers a set of advantages, especially when it comes to server environments. Text mode is less resource-intensive and faster, and it allows installations on systems with low graphical capabilities. It's a valuable skill to master for anyone aiming for proficiency in system administration. However, you should always consider the available alternatives before starting a text-based installation. Text mode is limited in the amount of choices you can make during the installation.

Limits of interactive text mode installation include:
- The installer will always use the English language and the US English keyboard layout. You can configure your language and keyboard settings, but these settings will only apply to the installed system, not to the installation.
- You cannot configure any advanced storage methods (LVM, software RAID, FCoE, zFCP and iSCSI).
- It is not possible to configure custom partitioning; you must use one of the automatic partitioning settings. You also cannot configure where the boot loader will be installed.
- You cannot select any package add-ons to be installed; they must be added after the installation finishes using the DNF package manager.

But let's try to get around some of these limitations :)

Let's walk through the process of installing Rocky Linux in text mode.

### Start the VM. 
When you start the Rocky Linux installation, you will see a prompt asking you to choose the installation mode. If you select "Install Rocky Linux 9.0", the installation will start in graphical mode by default. However, if you append the `inst.text` option to the boot command, the installer will start in text mode instead. Once you have configured your VM and attached the Rocky Linux ISO, start your VM. The Rocky Linux boot menu will appear. 
At the boot prompt, press the Tab key to edit the boot command.
Add `inst.text` to the end of the command.
Press Enter to start the installation in text mode.
Once the installation starts in text mode, you can follow the installation process using the text-based interface instead of the graphical interface. 

<img width="953" alt="Screen Shot 2023-05-11 at 8 49 28 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/0b1a9a99-74fc-4157-9725-43bf18aeea49">


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

Select item 5 and press `ENTER`, in the window that appears, select your hard drive and press `c` .

<img width="1079" alt="Screen Shot 2023-05-11 at 9 00 23 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/e33511c0-7e1a-401a-990d-56a10336ab63">

Select item 4 "Manually assign mount points" and press `c` .
<img width="1083" alt="Screen Shot 2023-05-11 at 9 07 28 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/c843f135-fa5c-4f0a-b254-8d18f85d9b47">

We got into a menu where you can specify mount points for specific partitions. So far we have only one section. 

<img width="1079" alt="Screen Shot 2023-05-11 at 9 44 26 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/1d009601-2fd6-4473-9428-ceee51094a5a">

Press `Alt+Tab` and switch to `shell` command line mode.

<img width="1083" alt="Screen Shot 2023-05-11 at 9 46 30 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/2935c797-429b-45e0-b76c-7269e643344a">

Before proceeding with disk partitioning, let's discuss two popular command-line tools for this task: `fdisk` and `parted`. I will also explain why I decided to use fdisk for this tutorial.

### fdisk vs. parted: A Brief Comparison

fdisk and parted are both powerful and widely used tools for partitioning disks in Linux systems. They have their advantages and specific use cases, but they also differ in some key aspects.

#### fdisk
`fdisk` is a widely used, text-based utility for managing disk partitions on Linux systems. It supports creating, deleting, and modifying partitions on a hard disk. While `fdisk` primarily works with MBR (Master Boot Record) partition tables, it also offers limited support for GPT (GUID Partition Table) partition tables. Some of the reasons to choose `fdisk` include:
- __Familiarity__: `fdisk` has been around for a long time, and many users are accustomed to using it.
- __Simplicity__: `fdisk` provides a straightforward interface for managing partitions, making it easier for users to accomplish their tasks.

#### parted
`parted` is another command-line utility for partitioning hard drives on Linux systems. It is more advanced than `fdisk` and supports a broader range of partition table formats, including MBR and GPT. Some reasons to choose parted include:
- __Greater compatibility__: `parted` works with a wider variety of partition tables, making it more versatile for managing modern hard drives.
- __Advanced features__: `parted` offers more advanced functionality, such as resizing partitions without data loss.

#### Why choose fdisk?
In this guide, I decided to use `fdisk` to partition the disk. The primary reason is its simplicity and familiarity among Linux users. Although parted offers more advanced features and broader compatibility, `fdisk` is more than sufficient for the partitioning requirements of the Born2beRoot project. In addition, using `fdisk` aligns with the text-based installation approach we've been following, making it a suitable choice for this scenario.

Now that we have discussed fdisk and the rationale for choosing it, let's look at the process of partitioning a disk using the `fdisk` command.

And so, in my project, I had to set up the partitions correctly to get a structure similar to the one below:

<img width="601" alt="Screen Shot 2023-05-11 at 10 54 32 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/f407936c-9c8f-48c2-af9f-b1b91e7f3027">

As we learned earlier, there are limitations in text mode, so we will create only a few partitions with which the loader will not have problems during mounting.
To start, select our device using the following command:
`fdisk /dev/sda`
Enter `n`, fdisk will prompt us to choose which partition we want to create "primary" or "extended".
<img width="1083" alt="Screen Shot 2023-05-11 at 11 02 35 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/c9db09d9-efe9-46ad-996b-305a99b237ae">

### Understanding Primary and Extended Partitions
Before we proceed with the partitioning process, it's essential to understand the difference between primary and extended partitions.

Hard drives can be divided into one or more logical sections, known as partitions. These partitions function as separate drives, and they can have different file systems. In the context of an MBR partitioning scheme, which is the type of partition table fdisk primarily works with, there are two types of partitions: primary and extended.

#### Primary Partitions
![07-file-systems-001](https://github.com/AGolz/Born2beRoot/assets/51645091/aa0949a4-5de7-4a15-8607-b0750e44a73f)

Primary partitions are the main partitions on a disk. They can host a file system directly, which means you can install an operating system on them or use them for data storage. According to the MBR partitioning scheme, you can have up to four primary partitions on a disk.

#### Extended Partitions
![07-file-systems-002](https://github.com/AGolz/Born2beRoot/assets/51645091/f9786998-1cc5-412f-92a4-d7c796342ef9)

The limitation of four primary partitions can be restrictive, especially on large hard drives. That's where extended partitions come in.

An extended partition is a special type of partition that acts as a container for additional partitions known as logical partitions. You can only have one extended partition on a disk, but this extended partition can be subdivided into multiple logical partitions.

This structure allows you to effectively bypass the limit of four primary partitions. Instead of creating multiple primary partitions, you can create a single primary partition, an extended partition, and then as many logical partitions within the extended partition as you need.

In summary, primary partitions are the main divisions of your hard disk and can host a file system or an operating system directly. On the other hand, an extended partition acts as a container for multiple logical partitions, allowing you to create more than four partitions on a disk.

With this understanding of primary and extended partitions, let's proceed with the fdisk partitioning process.

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
