# Born2beRoot ([42cursus](https://www.42.fr)) 2023 :package:

**Actual Status :** Finished

**Result :** 125%

**Update:** This project was initially written for Rocky-9.1-x86_64. Errors may occur when manually partitioning and encrypting disks in later versions. You can download Rocky-9.1 before the release of Rocky-10 from [here](http://dl.rockylinux.org/vault/rocky/9.1/isos/x86_64/Rocky-9.1-x86_64-minimal.iso).
Similar issues have been reported in Fedora, RHEL, and CentOS. A possible solution can be found [here](https://linuxconfig.org/how-to-install-fedora-rhel-centos-via-kickstart-on-an-existing-luks-device).
The `ks.cfg` file and `updates.img` are provided as examples in this repository.
For more details, refer to the error message on the Rocky forum [here](https://bugs.rockylinux.org/view.php?id=5974) or in this [discussion](https://github.com/rhinstaller/anaconda/discussions/5552).


## Harnessing the Power of Virtualization: Deploying a Rocky Linux Server on VirtualBox for Ecole 42's Born2beRoot Project

### Introduction

Welcome to the world of server virtualization! As part of my educational journey at [Ecole 42](https://42.fr/en/homepage/), I embarked on an exciting project - [Born2beRoot](https://github.com/AGolz/Born2beRoot/blob/main/en.subject.pdf). This educational initiative presented a unique opportunity to delve deeper into the world of operating systems, network administration, and system administration. It's designed to challenge students like me to deploy a server, enforcing stringent rules to ensure we understand and implement best practices in system and network management.

Born2beRoot is more than just a project; it's a testament to the capabilities of virtualization and its transformative impact on the world of technology. The project comes with a predefined set of rules and a well-laid-out subject matter to help guide the implementation. This, however, does not in any way limit creativity and problem-solving.

In this article, I will share my journey of deploying a server on Rocky Linux in a VirtualBox environment. The experience was both challenging and enriching, providing me with invaluable hands-on experience in configuring and managing virtual servers. From the installation of the operating system, setting up network configurations, to ensuring secure user management, each step provided me with a deeper understanding of how servers function.

This article aims to serve as a comprehensive guide for anyone interested in undertaking a similar project. It will detail the theoretical aspects of virtual machines and VirtualBox before delving into the practical aspects of deploying a server on Rocky Linux. So, whether you're a student, a budding system administrator, or a seasoned professional looking for some refreshers, this guide has something to offer. Let's dive in!

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

Now that we have learned a little more about VirtualBox, we are ready to dive into the world of Linux distributions, in particular Rocky Linux. This open source operating system provides a reliable, stable and high-performance environment for our server. Let's look at what Rocky Linux has to offer and how we can configure it in our VirtualBox environment.
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

__Hard Disk File Type__: Select `VDI (VirtualBox Disk Image)` as it is compatible with VirtualBox.

__Storage on Physical Hard Disk__: Choose `Dynamically allocated`, which means your virtual hard disk will grow as it is used, up to the maximum size you set.

__File Location and Size__: Finally, set the maximum size of the virtual hard disk. A minimum of 10GB is recommended for Rocky Linux, but if you can, allocate more space to avoid running out of space in the future.
 <img width="1023" alt="Screen Shot 2023-03-09 at 5 06 33 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/e6cfc159-c970-436d-84c8-5a3a5d861769">
 
### Configure VM Further. 

Before we proceed to the installation of RockyLinux, we need to make a few more adjustments to our VM. Select your VM and click on `Settings`:
- __System__: Under the `System` tab, ensure that the boot order is set to `Optical` then `Hard Disk`.
- __Display__: Allocate video memory. The recommended minimum is 16MB.
- __Storage__: Here, you need to attach the Rocky Linux ISO you downloaded earlier. Under the `Controller: IDE`, click on the CD icon with a plus sign (Add Optical Drive), then choose `Add`. Navigate to the location of your Rocky Linux ISO, select it, and click `Choose`.

<div id="stat" align="center">
 <img width="1025" alt="Screen Shot 2023-05-10 at 3 08 40 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/32cc0a12-4b24-45e0-bd6c-c27120fa4ef1">
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
Once you have configured your VM and attached the Rocky Linux ISO, start your VM. The Rocky Linux boot menu will appear. When you start the Rocky Linux installation, you will see a prompt asking you to choose the installation mode. If you select "Install Rocky Linux 9.0", the installation will start in graphical mode by default. However, if you append the `inst.text` option to the boot command, the installer will start in text mode instead. 

<img width="953" alt="Screen Shot 2023-05-11 at 8 49 28 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/0b1a9a99-74fc-4157-9725-43bf18aeea49">

## Part IV: Anaconda Unveiled. Exploring Disk Partitioning, LVM, and LUKS
### The Anaconda Installer
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

Now let's go back to our Rocky Linux installation in text mode.

### Description of the installation. 
Follow the instructions of the installer until you reach the installation menu with nine items, where you will configure several aspects of the installation: 

<img width="1259" alt="Screen Shot 2023-03-02 at 11 49 22 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/7ce9890c-e23d-49c5-837d-bb78284d4990">

In total, you will be presented with 9 points of the form each of which is quite simple and easy to set up. Specify the language, date and time, [NTP server](https://www.ntp-servers.net/servers.html), installation source, and so on.

More detailed information should be provided only about the fifth paragraph of the "Installation Destination" form. Let's will try to split the disk into the partitions we need and create an encrypted LVM volume in text mode.

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

`fdisk` and `parted` are both powerful and widely used tools for partitioning disks in Linux systems. They have their advantages and specific use cases, but they also differ in some key aspects.

#### fdisk
`fdisk` is a widely used, text-based utility for managing disk partitions on Linux systems. It supports creating, deleting, and modifying partitions on a hard disk. While `fdisk` primarily works with MBR (Master Boot Record) partition tables, it also offers limited support for GPT (GUID Partition Table) partition tables. Some of the reasons to choose `fdisk` include:
- __Familiarity__: `fdisk` has been around for a long time, and many users are accustomed to using it.
- __Simplicity__: `fdisk` provides a straightforward interface for managing partitions, making it easier for users to accomplish their tasks.

#### parted
`parted` is another command-line utility for partitioning hard drives on Linux systems. It is more advanced than `fdisk` and supports a broader range of partition table formats, including MBR and GPT. Some reasons to choose parted include:
- __Greater compatibility__: `parted` works with a wider variety of partition tables, making it more versatile for managing modern hard drives.
- __Advanced features__: `parted` offers more advanced functionality, such as resizing partitions without data loss.

#### Why choose fdisk?
In this guide, I decided to use fdisk to partition the disk. The primary reason is its simplicity and familiarity among Linux users. Although parted offers more advanced features and wider compatibility, fdisk is more than sufficient to meet the requirements of the Born2beRoot project. In addition, using fdisk aligns with the text-based installation approach we've been following, making it a suitable choice for this scenario.

Now that we have discussed fdisk and the rationale for choosing it, let's look at the process of partitioning a disk using the `fdisk` command.

And so, in my project, I had to set up the partitions correctly to get a structure similar to the one below:

<img width="601" alt="Screen Shot 2023-05-11 at 10 54 32 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/f407936c-9c8f-48c2-af9f-b1b91e7f3027">

As we learned earlier, there are limitations in text mode, so we will create only a few partitions with which the loader will not have problems during mounting.
To start, select our device using the following command:
```
fdisk /dev/sda
```
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

To begin with, we will create a primary partition for the boot mount point:
<img width="1076" alt="Screen Shot 2023-05-11 at 11 38 06 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/a7875100-5ac3-4b7c-b22a-9e3c018dc456">

next, we will create an extended partition that will take up all the remaining space.
<img width="1079" alt="Screen Shot 2023-05-11 at 11 39 34 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/6431841d-2f20-4d98-8107-b6afc284b03c">

Then enter `n` again and fdisk will automatically create a new logical partition `sda5`. 
<img width="1081" alt="Screen Shot 2023-05-12 at 12 59 55 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/4bb4f99c-b84f-4aa2-88aa-b8eb67baaea3">

Now, you need to write these changes to the disk. Type `w` and press `Enter`.
Here's what we got:

<img width="1081" alt="Screen Shot 2023-05-12 at 1 04 44 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/4362160f-3318-42c7-918e-a58cb030dd51">

In my assignment, my extended partition had to be encrypted, for this I used LUKS.

### LUKS: Linux Unified Key Setup
__LUKS__, or __Linux Unified Key Setup__, is a disk encryption specification that provides a platform-independent standard on-disk format for use in various tools. This not only facilitates compatibility and interoperability among different systems but also provides secure management of multiple user passwords.

LUKS encrypts entire block devices and is thereby well-suited for protecting the contents of mobile devices such as removable storage media or laptop disk drives. It was designed to conform to the TKS1 secure key setup scheme and is the standard for disk encryption on Linux systems.

Here's why LUKS makes an excellent choice for your disk encryption needs:
- __Platform-Independence__: LUKS stores all necessary setup information in the partition header, enabling the user to transport or migrate data seamlessly.
- __Secure against Low Entropy Attacks__: Passwords are secured against low entropy attacks through the use of salting and iterated PBKDF2 hashing.
- __Supports Multiple Keys__: LUKS supports eight different keys for a single encrypted partition. This feature allows multiple users to have their distinct access keys to the same device.
- __Effective Passphrase Revocation__: With LUKS, when a passphrase is overwritten, it is entirely infeasible to recover any data associated with that passphrase.

#### Why LUKS1?
In September 2021, two versions of LUKS became available for Linux: LUKS1 and LUKS2. While LUKS2 brings several improvements, such as a new keyslot area layout and improved binary key descriptor management, it may not always be the best choice depending on the specific circumstances of your project.

LUKS1 is widely supported, well tested, and provides a strong encryption standard that is sufficient for most purposes. It's also more compatible with various systems and software. Because of its wide adoption, troubleshooting and support are easier to find if issues arise.

In the context of the Born2beRoot project, the choice of LUKS1 aligns well with the requirement of the project to provide strong disk encryption while ensuring broad compatibility and stability. 

To start encryption, enter the following command:

```
cryptsetup luksFormat --type luks1 /dev/sda5
```

and follow the instructions:
<img width="1086" alt="Screen Shot 2023-05-12 at 1 10 45 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/dc8997f4-99b9-45df-80e8-d0cf2c5b2b8f">

Open the container:

```
cryptsetup open /dev/sda5 sda5_crypt
```
The decrypted container is now available:
<img width="1080" alt="Screen Shot 2023-05-12 at 1 16 57 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/8c1924a7-da1a-4c06-8c1b-023fe1c5a872">

Let's create a group of logical volumes in our container and several logical partitions.

### LVM: Logical Volume Management
__Logical Volume Management (LVM)__ is a flexible and advanced option for disk management available on Linux. It allows you to manage disk drives and similar mass-storage devices in a more abstract and flexible manner than traditional methods. Instead of working with individual devices, LVM provides the ability to manage disk storage in terms of logical volumes.

Here's a quick breakdown of LVM components:
- __Physical Volumes (PV)__: These are your actual physical disks or partitions.
- __Volume Groups (VG)__: These are abstracted layers over physical volumes. You can consider a volume group as one large disk made up of the combined space of its underlying physical volumes. This abstraction provides great flexibility. You can add or remove physical volumes to the volume group, effectively resizing it.
- __Logical Volumes (LV)__: These are the equivalent of disk partitions in a non-LVM system. However, unlike traditional partitions, logical volumes can span across multiple physical volumes. Logical volumes are the functional equivalent of a partition in a disk, and you can create filesystems on them as you would on a traditional partition.

The real strength of LVM comes from its flexibility. You can resize logical volumes, add new physical volumes to your volume groups, migrate data between physical volumes, and much more, often without downtime.

For example, if you are running out of space on a logical volume, you can simply add a new physical volume to the volume group (if you have a free disk or a disk with free space), and then extend the logical volume across the new space, all without interrupting service.

Now that we have understood what LVM is and its components, let's create a volume group and logical volumes in our decrypted container.

Create a physical volume on top of the opened LUKS container:

```
pvcreate /dev/mapper/sda5_crypt
```

Create a volume group (in this example named LVMGroup, but it can be whatever you want) and add the previously created physical volume to it:

```
vgcreate LVMGroup /dev/mapper/sda5_crypt
```

<img width="1081" alt="Screen Shot 2023-05-12 at 1 33 56 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/8a3c9548-0c09-4c61-94a7-c2adf7f9b46c">

Create logical volumes in a volume group using the `lvcreate` command:

<img width="1038" alt="Screen Shot 2023-05-12 at 3 05 04 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/82ce5360-a31a-4a1b-98e4-c73589e92aa9">

Format your filesystems on each logical volume:
```
mkfs.ext4 /dev/LVMGroup/root
mkswap /dev/LVMGroup/swap
```
set the mount point for swap:
```
swapon /dev/LVMGroup/swap
```
Now we have the following structure:
<img width="1048" alt="Screen Shot 2023-05-12 at 3 16 22 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/564fafb8-d07a-4c13-92af-b57e717a37e3">

Let's go back to the loader user interface by pressing `Alt+Tab` and update the information about the sections by pressing `s`.
Now we see three partitions on our hard drive. Specify the mount points for the `root` partition and set the mount point for `boot` to /dev/sda1.

<img width="1084" alt="Screen Shot 2023-05-12 at 3 23 24 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/8ec88c08-6191-4f91-a0b4-7aba51d9b04e">
<img width="1077" alt="Screen Shot 2023-05-12 at 3 22 18 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/579a00db-4e2e-448c-abf0-d93dd5445b4d">

After filling in all the fields of the installation form, press "b" to finish the installation.

<img width="1077" alt="Screen Shot 2023-05-12 at 2 29 11 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/07a683f4-4231-4ee4-b0b0-7a2b9c825053">

After the installation is complete, enter the login and password for root.
Now the fun begins, we need to add a few more sections to our LV group, but if we enter the vgdisplay command, we will find that the system does not see it.
<img width="1081" alt="Screen Shot 2023-05-12 at 3 56 04 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/533989ee-116a-4a5e-891a-4f026958179a">

Let's fix this by going to the `/etc/lvm/lvm.conf` file and setting `use_devicesfile=0`
<img width="1077" alt="Screen Shot 2023-05-12 at 4 01 57 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/336597b6-8f1a-40d3-9a09-b9fde0380a98">
<img width="1058" alt="Screen Shot 2023-05-12 at 4 02 48 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/0fbfd5b7-0fac-4cee-bfeb-4e80361f8e34">

### The LVM Configuration File and Rocky Linux

The `/etc/lvm/lvm.conf` file is the main configuration file for the Logical Volume Manager (LVM). It includes settings that affect the behavior of all LVM commands. This configuration file is read by each LVM command to determine its overall behavior.

One of the parameters in the `lvm.conf` file is `use_devicesfile`. As per the LVM documentation, setting use_devicesfile to 1 (or leaving it unspecified, as the default is 1) means that LVM will use the `/etc/lvm/devices/system.devices` file to check which devices it should scan for physical volumes. This behavior is new in LVM2 and is intended to improve LVM's handling of complex device setups.

However, in certain scenarios, such as ours, this feature might lead to problems. For instance, if you have an encrypted LVM setup (like we do), and the `devices/system.devices` file doesn't include the encrypted device mapper nodes, LVM commands will not be able to see your volume groups and logical volumes, leading to a situation like the one we encountered.

By setting `use_devicesfile` to 0 in the lvm.conf file, we're instructing LVM to scan all devices for physical volumes, ensuring that it sees our volume group on the encrypted container.

The situation we faced is a relatively known issue in the Rocky Linux community. The encrypted LVM setup creates a layer of complexity that the newer LVM2 device filtering feature does not handle well by default. This is not a problem exclusive to Rocky Linux and can occur in any Linux distribution that uses LVM2 and supports disk encryption.

By understanding and modifying the LVM configuration, we are able to work around this issue and properly set up our disk partitions as per the Born2beRoot project requirements. Now, let's proceed with creating the additional logical volumes in our volume group.
<img width="1084" alt="Screen Shot 2023-05-12 at 4 16 40 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/cb67dd77-a4da-407b-8765-6ccb1cf90bd7">

Perform formatting:
```
mkfs.ext4 /dev/LVMGroup/home
mkfs.ext4 /dev/LVMGroup/var
mkfs.ext4 /dev/LVMGroup/srv
mkfs.ext4 /dev/LVMGroup/tmp
mkfs.ext4 /dev/LVMGroup/var-log
```
Mount your filesystems:
```
mount /dev/LVMGroup/home /home
mount /dev/LVMGroup/var /var
mount /dev/LVMGroup/srv /srv
mount /dev/LVMGroup/tmp /tmp
mkdir /var/log/
mount /dev/LVMGroup/var-log /var/log
```
Edit the `/etc/fstab` file using a text editor. For each partition, add a line to the fstab file that specifies the mount point and options. The format of the line should be as follows:
```
/dev/mapper/LVMGroup-root    /      ext4  defaults  0 0
/dev/mapper/LVMGroup-home     /home      ext4  defaults  0 0
/dev/mapper/LVMGroup-var      /var       ext4  defaults  0 0
/dev/mapper/LVMGroup-srv      /srv       ext4  defaults  0 0
/dev/mapper/LVMGroup-tmp      /tmp       ext4  defaults  0 0
/dev/mapper/LVMGroup-var--log  /var/log   ext4  defaults  0 0
```
The `/etc/fstab` file is a system configuration file on Linux and Unix-like operating systems that contains information about filesystems. The file is read by the mount command to determine which options should be used when mounting the specified filesystems.

`fstab` stands for File System Table, and it has a simple structure with each line representing one filesystem. Each line in the file contains six fields separated by spaces or tabs. Here's what those fields represent:
- __File System__: This field is the name of the partition or storage device. It could be identified in several ways, such as by UUID, or by its file path under /dev/.
- __Mount Point__: This field is the directory where the file system will be mounted. If the directory doesn't exist, it will need to be created before the filesystem can be mounted.
- __Type__: This field specifies the type of the filesystem. Common filesystem types include ext4, xfs, ntfs, vfat, swap, and auto (which tells the system to automatically detect the filesystem type).
- __Options__: This field specifies the mount options that should be used. Options are comma-separated and include things like defaults (use the default options), ro (mount read-only), rw (mount read-write), auto (mount automatically at boot), noauto (do not mount automatically at boot), and many others. The `x-systemd.device-timeout=0` option is a special mount option understood by systemd. It sets the device timeout to 0 seconds, meaning systemd will not wait for the device to be ready or accessible and will fail immediately if the device is not available at boot time.
- __Dump__: This field is used by the dump utility to decide when to make a backup. If it is set to 0, dump will ignore the filesystem. If set to 1, dump will make a backup.
- __Pass__: This field is used by the fsck program to determine the order in which filesystem checks are done at boot time. The root filesystem should have a pass of 1, and other filesystems should have a pass of 2. A pass value of 0 means that fsck will not check the filesystem.

To register the swap partition in /etc/fstab, you need to add the following entry: 
```
/dev/mapper/LVMGroup/swap none swap sw 0 0
```
- __none__: There is no mount point for swap, as it's not a filesystem.
- __swap__: This specifies the type of the entry (in this case, swap).
- __sw__: This is the mount option, indicating that it's a swap partition.
- __0__: This field is for the dump utility. Since swap is not a filesystem, it's set to 0.
- __0__: This field is for fsck order. Again, since swap is not a filesystem, it's set to 0.

<img width="900" alt="Screen Shot 2024-03-03 at 5 32 32 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/04598723-2cb9-49f0-b248-424e95be5f73">

Test that the partitions are mounted correctly by running the `mount -a` command. This will attempt to mount all the partitions listed in the fstab file. However, it won't catch errors that might only occur during boot, such as an incorrect `fsck` order or a device that isn't ready in time.

After mounting the partitions, ensure that the ownership and permissions of the directories are set correctly. For instance:

```
chown -R root:root /home
chown -R root:root /var
chown -R root:root /srv
chown -R root:root /tmp
chown -R root:root /var/log
```

To enable the swap partition immediately, run the following command:
```
swapon -a
```
This command activates all swap partitions listed in `/etc/fstab`. You can check the swap status with the following command:
```
free -h
```
This will display memory and swap usage in a human-readable format.

Now our sections look like this:

<img width="1087" alt="Screen Shot 2023-05-18 at 3 06 55 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/476fa50e-de9e-4b90-9e7d-65e16a1c0fc4">

If you are experiencing logs appearing on the terminal after a reboot, it might be due to the default behavior of system logs being displayed on the console during the boot process. To prevent these logs from interfering with the terminal, you can make some adjustments.

Here are steps to redirect logs during boot to a file and prevent them from being displayed on the console:

Open the `/etc/default/grub` file for editing. Find the line that starts with `GRUB_CMDLINE_LINUX` and add quiet and splash to the parameters. Additionally, add `rd.systemd.show_status=0` to disable status messages. The line should look something like this:

```
GRUB_CMDLINE_LINUX="quiet splash rd.systemd.show_status=0"
```
Save the file and exit the text editor.
Reboot your system.
This should prevent most of the logs from being displayed on the console during boot. If you want to capture all logs in a file, you can use the rsyslog service to redirect logs to a file.

Install rsyslog if it's not already installed:

```
dnf install rsyslog
```
if dnf fails with an error "Unable to detect release version (use '--releasever' to specify release version)" use the command `dnf --releasever=9 install rsyslog`.

Edit  or create the rsyslog configuration file `/etc/rsyslog.d/50-default.conf`:

<img width="831" alt="Screen Shot 2024-03-26 at 4 38 49 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/c711e77e-75b3-4292-93b1-b46c54589480">

Don't forget to create all the necessary files.

Save the file and restart the rsyslog service:
```
systemctl restart rsyslog
```

Reboot your system:
```
reboot
```
Once your system is set up with the correct filesystems and mount points, and you've verified that everything is working correctly, you're ready to move on to setting up the server.

## Part V: Setting Up the Server

#### Adjusting SELinux for SSH
SELinux (Security-Enhanced Linux) provides an additional layer of system security by managing the permissions of your applications. It prevents them from performing unauthorized actions, even if they have been exploited or compromised.

SELinux and AppArmor are Mandatory Access Control (MAC) systems for Linux. They provide a way to restrict system access beyond the typical user/group/other permissions system (also known as Discretionary Access Control, or DAC).

SELinux was initially developed by the NSA and contributed to the open-source community. It provides a fine level of control over system interactions, but it can be complex to manage due to its policy complexity.

AppArmor is somewhat simpler to use than SELinux. It works by applying profiles to individual applications rather than working system-wide. This can make it less powerful, but also less likely to cause unintended side effects.

SSH communication is typically allowed by default in the SELinux policies. However, if you have changed the default SSH port (22), SELinux might not allow the SSH daemon (sshd) to use the new port. In that case, you need to add the new port to the SELinux policy.

Here are the steps to add a new SSH port to the SELinux policy (replace YOUR_NEW_PORT with your actual new port number):

Install the selinux-policy-targeted package which provides the semanage command:
```
dnf install selinux-policy-targeted
```
Install the policycoreutils-python-utils package which provides the semanage command:
```
dnf install policycoreutils-python-utils
```

Then add the new port to the SELinux policy with the semanage command:
```
semanage port -a -t ssh_port_t -p tcp 4242
```
erify that the new port is added:
```
semanage port -l | grep ssh
```
The command in step 2 tells SELinux to add (-a) a new rule that allows the sshd process type (ssh_port_t) to listen on the new TCP port (-p tcp 4242).

### Secure Shell
Secure Shell (SSH) is a cryptographic network protocol for operating network services securely over an unsecured network. It is typically used to log into a remote machine and execute commands, but it also supports tunneling, forwarding TCP ports and X11(X Window System) connections. It can transfer files using the associated Secure Copy Protocol (SCP) or Secure File Transfer Protocol (SFTP).

SSH uses public-key cryptography to authenticate the remote computer and allow the remote computer to authenticate the user, if necessary. SSH protects the privacy and integrity of the transferred identities, data, and files.

It was designed as a replacement for Telnet and other insecure remote shell protocols, which send information, notably passwords, in plaintext, leaving them susceptible to interception and disclosure using packet analysis.

#### Configuring SSH
Forward the required port in the settings of your virtual machine. Go to the `Network` tab and click `Port Forwarding`. Specify the following settings:
<img width="1025" alt="237240242-527fcce7-58a1-4852-becb-c4dca765b7d5" src="https://github.com/AGolz/Born2beRoot/assets/51645091/86c1eef4-d621-40e1-9c57-0bbc527e6cd6">
<img width="719" alt="Screen Shot 2024-03-03 at 11 43 22 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/54c3ec88-7e73-4b59-843a-89c1c92195a9">

SSH configuration is controlled by the /etc/ssh/sshd_config file on your system. In this file, you can customize various settings such as the SSH port, authentication methods, and security-related options.

As per our project requirements, we need to modify the SSH configuration to make it more secure and meet specific criteria. Here's a step-by-step guide on how to do that:
- __Generate SSH Key Pair on the VM__: Simply run `ssh-keygen -t rsa` on your VM. Accept the default file location and optionally provide a passphrase for added security.
- __Hange the default port__. Open the SSH configuration file `/etc/ssh/sshd_config` with a text editor, locate the `#Port 22` line, remove the `#`, and change the port number to `4242`. So, the line should look like this: `Port 4242`. This will cause SSH to listen on port 4242 instead of the default port 22. 
<img width="1089" alt="Screen Shot 2023-05-18 at 11 15 28 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/77af3142-e606-4338-b330-20efdb344c5b">

- __Disable root login__. To prevent direct access to the root account over SSH, look for the `#PermitRootLogin` line, uncomment it (by removing the #), and set its value to `no`. So, it should look like this: `PermitRootLogin no`.
<img width="1079" alt="Screen Shot 2023-05-18 at 9 53 36 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/421d1dc1-aa19-408e-92fd-a39c624495ed">

-  __Password Authentication__.  Make sure that password authentication is enabled. You can do this by looking for a line that says PasswordAuthentication yes. If you don't see this line, or if it's commented out, then add it to the file.
<img width="1071" alt="Screen Shot 2023-05-18 at 9 54 21 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/e83f5078-dbce-420a-b7e3-92899959932f">

These steps allow for key-based authentication on your VM, where the VM itself is the server accepting SSH connections.

However, if you intend to SSH from this VM to another machine (making this VM an SSH client), you will need to add the VM's public key to the ~/.ssh/authorized_keys file on the target server (the other machine).


#### Configuring Firewall for SSH

The firewall protects your system by controlling inbound and outbound network traffic. In our project we will use FirewallD.

__firewall-cmd__ is the command-line interface for FirewallD, a dynamically managed firewall that supports network zones to define the trust level of network connections or interfaces.

FirewallD is used to configure rules either permanently or temporarily to allow or block traffic coming into your server's system ports.

firewall-cmd is a part of the firewalld application, which is installed by default on some Linux distributions.

Here are a few common commands you might use with firewall-cmd:
- __firewall-cmd --state__: This command checks if the firewall is running.
- __firewall-cmd --reload__: This command reloads the configuration without interrupting existing connections.
- __firewall-cmd --get-default-zone__: This command returns the default zone used for connections and interfaces where no specific zone has been assigned.
- __firewall-cmd --get-active-zones__: This command returns the currently active zones along with the network interfaces and sources that are assigned to them.
- __firewall-cmd --zone=public --list-all__: This command shows all settings for the zone (replace "public" with your specific zone if necessary).

We need to configure it to allow SSH traffic through port 4242.

Here's how to open port 4242 for SSH:
```
firewall-cmd --permanent --add-port=4242/tcp
firewall-cmd --reload
```
Now, you should be able to connect to your VM via SSH on port 4242 while having the enhanced security of SELinux and a configured firewall.

With this, we have completed the chapter on Configuring SSH. You've successfully set up a secure SSH environment for your server. Moving forward, keep these principles of key-based authentication, SELinux permissions, and firewall configurations in mind—they are fundamental to maintaining a secure server environment.

#### The Internet Protocol Suite 

The Transmission Control Protocol (TCP) is one of the main protocols in the Internet Protocol Suite. TCP is one of the two original components of the suite, complementing the Internet Protocol (IP), and therefore the entire suite is commonly referred to as TCP/IP. TCP provides reliable, ordered, and error-checked delivery of a stream of octets (bytes) between applications running on hosts communicating over an IP network.

TCP is a connection-oriented protocol, which means a connection is established and maintained until the application programs at each end have finished exchanging messages. It determines how to break application data into packets that networks can deliver, sends packets to and accepts packets from the network layer, manages flow control, and—because it is meant to provide error-free data transmission—handles retransmission of dropped or garbled packets as well as acknowledgment of all packets that arrive.

Major internet applications such as the World Wide Web, email, remote administration, and file transfer rely on TCP, which is part of the Transport Layer of the TCP/IP suite. SSL/TLS often runs on top of TCP.

Apart from TCP, there are several other important protocols as well, including:
- __UDP__ (User Datagram Protocol): Unlike TCP, UDP is a connectionless protocol. It doesn't guarantee delivery by itself, but it allows for a very low overhead transmission. It's commonly used in streaming media, games, and VoIP calls.
- __ICMP__ (Internet Control Message Protocol): This protocol is used by network devices, like routers, to send error messages and operational information indicating, for example, that a requested service is not available or that a host or router could not be reached.
- __HTTP__ (Hypertext Transfer Protocol) and HTTPS (HTTP Secure): These protocols are used for transmitting hypertext over the internet. HTTP operates at the application layer of the TCP/IP networking model and has been the foundation of data communication on the world wide web since its inception. HTTPS is the secure version of HTTP, where communications are encrypted by SSL or TLS.
- __FTP__ (File Transfer Protocol): This is a standard network protocol used for the transfer of computer files between a client and server on a computer network.
- __DNS__ (Domain Name System): A hierarchical and decentralized naming system for computers, services, or other resources connected to the Internet or a private network. It associates various information with domain names assigned to each of the participating entities.

The appropriate choice of protocol largely depends on the application requirements, such as the need for speed, reliability, or security.

Reboot your system:
```
reboot
```

let's try to connect to our server via ssh:
```
ssh username@localhost -p 4242
```
Voila! Welcome home! :) 

<img width="572" alt="Screen Shot 2023-05-18 at 11 13 31 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/5234e0cb-b2e9-4e88-8170-76db55825b5f">

#### Setting the Stage: Configuring Your Hostname in Rocky Linux

Your machine's hostname is akin to its own identity card, a unique name that separates it from other machines on the same network. In certain situations, such as this educational endeavor, we want our hostname to follow a certain convention, perhaps representing a login ID or a unique identifier associated with an individual or task. Here we'll outline the steps to achieve this, focusing on the robust Rocky Linux distribution.

Our tool of choice is the hostnamectl command. This handy tool is responsible for controlling the Linux system hostname. You can set the hostname to the required value with the following command. Be sure to replace 'emaksimo42' with your specific hostname:
```
sudo hostnamectl set-hostname emaksimo42
```
To ensure our operation was successful, we'll verify by querying the hostname:
```
hostnamectl
```
<img width="1187" alt="Screen Shot 2023-05-18 at 11 46 30 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/58909c33-fd20-42e8-b27d-ae3109ef3cce">
Your new hostname should make its appearance in both the Static and Pretty lines.

But we're not done just yet. We want this change to be reflected throughout your system, so we'll go ahead and edit the hosts file:
```
sudo vi /etc/hosts
```
Look for a line that follows this format: 127.0.1.1 your-old-hostname. It's time to bid farewell to your-old-hostname and replace it with your new hostname, yourlogin42. In the case this line is absent, don't worry. Simply add it right below the line that states 127.0.0.1 localhost.
<img width="950" alt="Screen Shot 2023-05-18 at 11 50 00 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/27f5a44d-ca32-42cc-bd9c-6dd2527d32f8">
Save the changes and close the file.
Finally, to ensure that our changes take effect, we'll reboot the system:

```
sudo reboot
```
After the system emerges from its brief slumber, it will wake up sporting its new identity, your customized hostname. 

#### Implementing Robust Password and Sudo Policies on Your Linux Machine
Maintaining a secure Linux environment entails setting strong password and sudo policies. These policies not only safeguard your system against unauthorized access, but also ensure its overall stability.

__Implementing Strong Password Policies__
To set strong password policies, you'd typically modify the configuration files associated with PAM (Pluggable Authentication Modules) and login.defs. Here's how:

Open the `/etc/security/pwquality.conf` file and change the following values:
```
minlen = 8  # minimum password length
minclass = 4  # minimum number of character classes
minage = 2  # minimum password age (days)
maxage = 30  # maximum password age (days)
```

Open the `/etc/login.defs` file and make the following changes:
- __Set PASS_MAX_DAYS__ to __30__ to ensure passwords expire every 30 days.
- __Set PASS_MIN_DAYS__ to __2__ to require at least two days before a password can be changed.
- __Set PASS_WARN_AGE__ to __7__ to give users a 7-day warning before their password expires.

<img width="980" alt="Screen Shot 2023-05-18 at 12 13 14 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/a1e03288-f37f-4713-af77-17d2359824a8">

To ensure complex passwords, update the pam_pwquality.so line in the `/etc/pam.d/system-auth` and `/etc/pam.d/password-auth files`. You should set the minimum length to 10, require different case letters, digits and restrict repeating characters. Here is an example line:
```
password    requisite     pam_pwquality.so try_first_pass local_users_only retry=3 authtok_type= minlen=10 ucredit=-1 lcredit=-1 dcredit=-1 difok=3 reject_username enforce_for_root

```
Note that ucredit, lcredit, and dcredit are used to enforce usage of upper case, lower case, and digits respectively.

To enforce password history checks, modify the following line in the same files, `/etc/pam.d/system-auth` and `/etc/pam.d/password-auth`:
```
password sufficient pam_unix.so remember=7
```
The remember option forces the user to choose a password that differs from the last 7 ones.


__Configuring Sudo Policies__
Sudo policies are typically configured in the sudoers file. Here's how:

To limit sudo attempts, add or modify the following line in the `/etc/sudoers` file:
```
Defaults        passwd_tries=3
```
To display a custom error message, add the following line to the same file:

```
Defaults        badpass_message="Sorry, but you entered the wrong password  ¯\_(ツ)_/¯"
```
To log sudo inputs and outputs, add the following lines:

```
Defaults        log_input
Defaults        log_output
Defaults        iolog_dir=/var/log/sudo/
Defaults        logfile=/var/log/sudo/sudo.log
```

To enable TTY mode, add this line:
```
Defaults        requiretty
```
To restrict sudo path, ensure secure_path is set as follows:
```
Defaults        secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
```
After making these changes, use the `passwd` command to change the passwords for all users (`sudo passwd username`), including root, to comply with the new policies.

Remember to carefully modify these files as incorrect changes can lead to system instability. Always backup these files before making any changes. Use the visudo command to safely edit the sudoers file as it checks the syntax before saving.

### Utilizing Bash and Cron for System Monitoring
Introduction
System monitoring is a vital part of any system administrator's job. It involves constantly checking various parameters of the system like processor usage, available memory, disk usage, etc. In this chapter, we'll discuss how to create a bash script that does this for you and how to automate its execution using Cron.

#### Understanding Bash Scripts
Bash (Bourne Again SHell) is the default command-line interpreter for many Linux distributions. A bash script is a plain text file which contains a series of commands. These commands are a combination of commands that you could type on the command line and commands (control structures) that are specific to bash scripting.

The script we've created for system monitoring, [monitoring.sh](https://github.com/AGolz/Born2beRoot/blob/main/monitoring.sh), collects a variety of important system information. Here's how it works:
```
!/bin/bash
```
This line, called a shebang, tells the system that this script should be executed using the bash shell interpreter.
```
while true; do
```
This is the start of a loop that will run indefinitely because the condition for the loop (true) is always met.
```
ARCH=$(uname -m)
KERNEL=$(uname -r)
```
These lines use the uname command to capture the system's architecture (e.g., x86_64, i386, armv7l, etc.) and the kernel version.
```
CPU_PHYSICAL=$(lscpu | grep "Socket(s):" | awk '{print $2}')
VCPU=$(lscpu | grep "^CPU(s):" | awk '{print $2}')
```
Here, the lscpu command is used to capture the number of physical CPU sockets and the total number of virtual CPUs (vCPUs).

```
DISTRIBUTION=$(cat /etc/redhat-release | awk '{print $1}'):
```
`cat /etc/redhat-release` This command prints the contents of the `/etc/redhat-release` file to the standard output.
`|` This is a pipe operator that takes the output of the previous command (`cat /etc/redhat-release`) and passes it as input to the next command (`awk '{print $1}'`).
`awk '{print $1}'` This awk command is used to manipulate text files. Here, it's instructed to print the first field (separated by whitespace) of each line. The output of this command will be the first word on the first line of the `/etc/redhat-release` file, which typically indicates the distribution name.

```
VERSION=$(cat /etc/redhat-release | awk '{print $4}'):
```
Similar to the line "DISTRIBUTION" this command retrieves the contents of the `/etc/redhat-release file`.
`awk '{print $4}'` Here, awk is again used to print a specific field from each line. In this case, it prints the fourth field of each line. This typically corresponds to the version information in the `/etc/redhat-release file`.
```
RAM_USAGE=$(free -m | awk 'NR==2{printf "%.0f/%.0fMB (%.2f%%)", $3, $2, $3*100/$2}')
```
This line uses the free command to fetch information about the RAM usage of the system in MB, including the percentage of RAM used.
```
DISK_USAGE=$(df -BG --output=size,used,pcent / | awk 'NR==2 {printf "%s/%s (%s)\n", $2, $1, $3}')
```
Here, df is used to display disk usage of the root directory in GB, including the percentage of disk used.
```
CPU_LOAD=$(top -b -n1 | grep "Cpu(s)" | awk '{printf "%.1f%%", $2+$4}')
```
This line uses the top command to calculate the CPU load, which is the percentage of time that the CPU is working.
```
LAST_BOOT=$(who -b | awk '{print $3, $4}')
```
The who command with the -b option is used here to fetch the date and time of the last system boot.
```
LVM_STATUS=$(/usr/sbin/lvs --noheadings -o lv_active LVMGroup 2>/dev/null | head -n 1 | grep -q "active" && echo "yes" || echo "no")
```
This line checks if any active Logical Volume Manager (LVM) volumes exist.
```
TCP_CONNECTIONS=$(ss -tn state established '( dport = :ssh or sport = :ssh )' | grep -c -v LISTEN)
```
The ss command is used to count the number of active TCP connections.
```
USER_LOG=$(users | wc -w)
```
This line uses the users command to count the number of users currently logged into the system.
```
IP_MAC=$(ip -4 -o addr show | awk '!/^[0-9]*: ?lo/ {print $4 " ("$6")"}')
```
The ip command is used here to display the IPv4 address and the MAC address of the server.
```
SUDO_CMDS=$(journalctl _COMM=sudo | grep COMMAND | wc -l)
```
Every 10 minutes, the script runs these commands, packages the results into a well-formatted message, and then broadcasts this message to all terminals using the wall command.

<img width="811" alt="Screen Shot 2024-04-04 at 4 05 56 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/32bf7307-1704-45f3-9ff3-0f6d1ef0bdd7">

This script collects and displays a wealth of information about the system, including architecture, kernel version, CPU, RAM and Disk usage, last boot time, LVM status, TCP connections, logged users, network details, and sudo commands executed. It uses a variety of common Linux utilities to gather this information.

To make the script executable, save it to a file, let's say, "monitoring.sh", and then change its permissions using the chmod command like so:
```
sudo chmod +x /path/to/monitoring.sh
```
#### Automating Tasks with Cron
Cron is a time-based job scheduling utility in Unix-like operating systems. Users can schedule jobs (commands or scripts) to run at specific times on specific days.

In our case, we want monitoring.sh to run at system startup and every 10 minutes thereafter. The script itself contains an infinite loop that ensures the script will keep running once it's started, with a pause of 600 seconds (10 minutes) between iterations.


While there are many ways to make a script run at startup, one common method involves using cron's special @reboot keyword, which runs a job once at startup.

<img width="972" alt="Screen Shot 2023-05-18 at 2 08 44 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/b287092c-7a9e-46b7-9abe-6077a43c7821">

Update Package Repository:
```
sudo dnf update
```
Install cronie Package:
```
sudo dnf install cronie
```
This command will install the cronie package along with its dependencies.
```
sudo systemctl start crond
```
To ensure that the cronie service starts automatically at boot, you can enable it:
```
sudo systemctl enable crond
```
You can check the status of the cronie service to ensure it's running without any issues:
```
sudo systemctl status crond
```
Once cronie is installed and running, you can edit your cron jobs using the crontab -e command:
```
sudo crontab -e
```
This will open the default text editor (usually vi or nano) where you can add, edit, or remove cron jobs.

Inside the crontab file, add your cron jobs following the cron syntax. For example:

```
@reboot /path/to/monitoring.sh
```
Replace `/path/to/monitoring.sh` with the actual path to your script.

After adding your cron jobs, save and exit the crontab editor.

Please remember that you need to have the correct permissions to execute these scripts and to schedule cron jobs.

And that's it! You've created a script that monitors key system parameters and set it up to run automatically. Not only will this save you a lot of manual work, but it also ensures you're constantly up to date with the state of your system.

Remember to test your script thoroughly to ensure that it's working as expected. When you're ready, you can deploy it on your production system with confidence.

__Now let's check our settings:__
```
head -n 2 /etc/os-release
sestatus
ss -tunlp
sudo firewall-cmd --list-service
sudo firewall-cmd --list-port
sudo firewall-cmd --state
```
Here's what we need to see :
<img width="1011" alt="Screen Shot 2023-05-18 at 3 44 58 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/c8486f06-ec6f-4e12-ab11-8d94a8ca2b06">

## Part VI: Setting Up WordPress with Lighttpd, MariaDB, and PHP
In this chapter, we're going to explore how to set up a functional WordPress website on your server. The configuration will utilize Lighttpd as the web server, MariaDB as the database, and PHP for dynamic content processing. We'll also discuss adding an additional service of your choice that enhances the performance or security of your WordPress site.

### Lighttpd: A Lightweight Web Server
Lighttpd, pronounced "lighty", is a secure, fast, compliant, and flexible open-source web-server that has been optimized for high-performance environments. Its low memory footprint (compared to other web servers), small CPU load and speed optimizations make it perfect for servers that are suffering from load problems.

Installing Lighttpd is typically straightforward on most systems using the system's package manager. Once installed, you will need to configure it to serve your WordPress site.

### MariaDB: A Robust Database Server
MariaDB is a community-developed, commercially supported fork of the MySQL relational database management system (RDBMS). MariaDB is highly compatible with MySQL and is a great choice for most applications that utilize MySQL. Installation is typically accomplished through the system's package manager. Once installed, you'll need to set up a new database and user for your WordPress installation.

### PHP: A Server-side Scripting Language
PHP is a popular general-purpose scripting language that is especially suited to web development. It's the language that WordPress is written in. Again, installation is generally straightforward. You will need to ensure that the PHP FastCGI module is installed and enabled, as this is what Lighttpd will use to interface with PHP.

To create a functional WordPress website with lighttpd, MariaDB, and PHP, follow these instructions:

First, let's open the HTTPS port on our virtual machine by registering it in the settings.
<img width="714" alt="Screen Shot 2024-03-28 at 9 34 04 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/a68a7d43-9500-4697-80ac-a327f6599468">

Configure the firewall:

Allow HTTP and HTTPS traffic:
```
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --add-service=https --permanent
```
Allow MySQL/MariaDB traffic (assuming default port 3306):
```
sudo firewall-cmd --zone=public --add-port=3306/tcp --permanent
```
Allow PHP FastCGI traffic (assuming default port 9000 for PHP-FPM):
```
sudo firewall-cmd --zone=public --add-port=9000/tcp --permanent
```
restart the firewall settings by running the `sudo firewall-cmd --reload command`

Update and upgrade the system:
```
sudo dnf update -y
sudo dnf upgrade -y
```
You have to install the EPEL (Extra Package for Enterprise Linux) repository on your server. It is a free repository and allows you to connect many other open-source software packages. Use the below command to install EPEL.

```
sudo dnf install epel-release
```
Press y to accept the installation confirmation and press the Enter key.

Install the required packages:
```
sudo dnf install -y lighttpd lighttpd-fastcgi mariadb mariadb-server php php-mysqlnd php-fpm php-gd php-xml php-mbstring wget unzip
```
Start and enable the services:
```
sudo systemctl start lighttpd
sudo systemctl enable lighttpd
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo systemctl start php-fpm
sudo systemctl enable php-fpm
```
__Configure lighttpd__:
Edit the lighttpd configuration file to include the fastcgi configuration:
```
sudo vi /etc/lighttpd/lighttpd.conf
```
Add the following line at the end of the file:
```
include "conf.d/fastcgi.conf"
```
disable IPv6:
```
server.use-ipv6 = "disable"
```
Save and close the file.

And make sure that the configuration of the FastCGI module in the `/etc/lighttpd/conf.d/fastcgi.conf` file is correct. If you are using a TCP socket, it should look like this:
```
fastcgi.server += (
    ".php" => (
        "localhost" => (
            "socket" => "/var/run/php-fpm/www.sock",
            "broken-scriptfilename" => "enable"
        )
    )
)
```
Save and close the file.


__Configure PHP-FPM__:
Edit the PHP-FPM configuration file:
```
sudo vi /etc/php-fpm.d/www.conf
```
Find the following lines and change their values:

```
listen.owner = lighttpd
listen.group = lighttpd
listen.acl_users = lighttpd
```
Save and close the file.

Use the chmod command to set the appropriate permissions for the socket file: 
```
sudo chmod 660 /var/run/php-fpm/www.sock
```
After making changes restart the PHP-FPM service to apply the changes:
```
sudo systemctl restart php-fpm
```
Here are the rights that a socket file should have:

<img width="615" alt="Screen Shot 2024-04-04 at 4 23 38 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/c6ce3103-fd23-402b-8013-5940a8f9252e">

To verify this, run the following command:
```
ls -l /var/run/php-fpm/www.sock
```
Ensure that the owner and group are set to lighttpd.

Restart the services:
```
sudo systemctl restart lighttpd
```

__Secure the MariaDB installation__:
```
sudo mysql_secure_installation
```
Follow the prompts to set a root password and remove anonymous users, disallow remote root login, and remove the test database.

__Create a WordPress database and user__:
Log in to MariaDB:
```
sudo mysql -u root -p
```
Create a new database, user, and grant permissions:

```
CREATE DATABASE wordpress;
CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```
__Download and install WordPress__:
```
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
sudo mv wordpress/* /var/www/html/
rm -rf latest.tar.gz wordpress/
```
Set the proper ownership and permissions:
```
sudo chown -R lighttpd:lighttpd /var/www/html
sudo find /var/www/html/ -type d -exec chmod 755 {} \;
sudo find /var/www/html/ -type f -exec chmod 644 {} \;
```
__Configure WordPress__:
Copy the sample configuration file:
```
sudo mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
```
Edit the configuration file:
```
sudo vi wp-config.php
```
Replace the database details with the values you created earlier:
```
define('DB_NAME', 'wordpress');
define('DB_USER', 'wpuser');
define('DB_PASSWORD', 'your_password');
define('DB_HOST', 'localhost');
```
Save and close the file.

Ensure the correct ownership and permissions for the `wp-config.php` file:
```
sudo chown lighttpd:lighttpd /var/www/html/wp-config.php
sudo chmod 644 /var/www/html/wp-config.php
```
Determine the SELinux context of the WordPress files:
```
sudo ls -Z /var/www/html
```
Set the appropriate SELinux context for the WordPress files:

```
sudo chcon -R -t httpd_sys_content_t /var/www/html
```
Replace `/var/www/lighttpd/wordpress` with the actual path to your WordPress installation.

Confirm that the SELinux context has been updated successfully:

```
sudo ls -Z /var/www/html
```
Restart the Lighttpd server to apply the changes:
```
sudo systemctl restart lighttpd
```
By setting the correct SELinux context for the WordPress files, SELinux should allow access to them while still enforcing security policies. 
Now, you can visit your website at http://localhost:8080/.

<img width="1703" alt="Screen Shot 2023-05-25 at 5 41 32 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/a265f2db-3aac-4146-bbf2-73d200a83578">

:) Great, now that you have access to the WordPress dashboard, you can create a new page with the desired content. Here's how:  

<img width="1497" alt="Screen Shot 2024-04-04 at 4 15 23 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/df2375ca-ecef-4f16-b68d-3591fc75079e">

### Adding an Extra Service

This is where you can truly customize your server setup. There are many services that could enhance a WordPress site, so choose one that align with your particular needs or interests. For example, you might choose to install a caching service like Varnish or Memcached to improve the performance of your site, or a security service like Fail2Ban to enhance security.

#### We will install Fail2ban:

Fail2ban is an intrusion prevention software framework that is designed to protect computer servers from brute-force attacks. It works by monitoring log files for various services and detecting repeated login failures or other suspicious activity. Once suspicious activity is identified, Fail2ban takes action by dynamically updating firewall rules to block the IP address from which the suspicious activity originated, thus preventing further unauthorized access attempts.

The primary purpose of Fail2ban is to enhance server security by reducing the risk of unauthorized access through brute-force attacks. By automatically blocking IP addresses that exhibit suspicious behavior, Fail2ban helps to mitigate the risk of successful attacks and improves the overall security posture of the server.

In summary, Fail2ban is a valuable tool for server administrators to proactively defend against unauthorized access attempts and enhance the security of their systems.

To install Fail2ban on a Linux system, you can follow these general steps:

Update Package Lists: Ensure your package manager's cache is up-to-date by running:

```
sudo dnf update
```
Install Fail2ban: Use the package manager to install Fail2ban:

```
sudo dnf install fail2ban
```
Start Fail2ban Service: After installation, start the Fail2ban service:

```
sudo systemctl start fail2ban
```

Enable Fail2ban Service: If you want Fail2ban to start automatically at boot, enable the service:

```
sudo systemctl enable fail2ban
```
Verify Installation: Check the status of the Fail2ban service to ensure it's running without errors:
```
sudo systemctl status fail2ban
```
Configuration: Fail2ban's main configuration file is typically located at `/etc/fail2ban/jail.conf` or `/etc/fail2ban/jail.local`. You can customize the configuration to suit your needs. Remember to restart Fail2ban after making any changes to the configuration files:

```
sudo systemctl restart fail2ban
```
Check Logs: Monitor Fail2ban's logs to ensure it's functioning as expected:

```
sudo tail -f /var/log/fail2ban.log
```
That's it! Fail2ban should now be installed and running on your system, helping to protect your server from brute-force attacks. Remember to periodically review Fail2ban's logs and adjust its configuration as needed to ensure optimal security.

<img width="986" alt="Screen Shot 2024-04-04 at 1 29 30 PM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/22a1b7e4-a39d-4668-a3b3-0871579fec77">

Fail2ban has successfully connected to its persistent database.

#### And for dessert 😋

We will install Nginx anyway. Because it's right and good :)

Nginx serves as a reverse proxy in this setup, providing several benefits:

__Load Balancing__: Nginx can distribute incoming traffic across multiple servers, helping to balance the load and prevent any single server from becoming overwhelmed.

__Caching__: Nginx can cache frequently accessed content, reducing the load on your backend servers and improving overall performance. However, this feature is not being used in your current setup.

__Security__: Nginx can act as a barrier between the internet and your backend servers, helping to protect against common web attacks like DDoS attacks and SQL injection.

__Reverse Proxy__: By acting as a reverse proxy, Nginx can improve the performance and scalability of your web application by offloading tasks such as SSL termination, compression, and serving static files.

__Flexibility__: Nginx is highly configurable and can be customized to suit your specific needs. It offers a wide range of features and can be extended with third-party modules.

In your specific setup with Nginx acting as a reverse proxy forwarding requests to Lighttpd hosting your WordPress site, Lighttpd serves as the backend web server responsible for handling PHP requests and serving static content.

Here's what Lighttpd is doing in your setup:

Handling PHP requests: Lighttpd is responsible for processing PHP scripts required by your WordPress site. When a PHP file is requested, Nginx forwards the request to Lighttpd, which executes the PHP code and generates the dynamic content to be sent back to the client.

Serving static content: Lighttpd also serves static files such as images, CSS, and JavaScript files directly to clients. This helps improve the performance of your WordPress site by efficiently delivering static content without the overhead of processing through PHP.

In summary, while Nginx acts as the frontend reverse proxy handling incoming requests and providing additional features like load balancing and SSL termination, Lighttpd serves as the backend web server responsible for executing PHP scripts and serving static content for your WordPress site. This setup allows for a flexible and scalable architecture, where each server plays a specific role in delivering your web application to users efficiently and securely.

#### Installing Nginx:

To install Nginx, follow these steps:

Update the package repository:

```
sudo dnf update
```
Install Nginx using the package manager:
```
sudo dnf install nginx
```
Open the Nginx configuration file /etc/nginx/nginx.conf for editing:
```
sudo vi /etc/nginx/nginx.conf
```
Inside the http block, add a new server block to define the reverse proxy configuration:
```
server {
    listen 8080;  # Listen on port 8080

    location / {
        proxy_pass http://localhost:8080;  # Forward requests to Lighttpd
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

<img width="1040" alt="Screen Shot 2024-04-04 at 7 21 50 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/5018f264-d527-4992-af0e-5137d1f69e4e">

Save the changes and exit the text editor.

Test the Nginx configuration for syntax errors:
```
sudo nginx -t
```
If the configuration test is successful, restart Nginx to apply the changes:
```
sudo systemctl restart nginx
sudo systemctl enable nginx
```
With this configuration, Nginx will listen on port 8080 and forward incoming requests to your Lighttpd server running on http://localhost:8080. You can access your site using http://localhost:8080 locally, and Nginx will manage the incoming traffic as a reverse proxy without caching the responses.

__let's check the work of Nginx__:

Do the following:
```
ab -n 1000 -c 10 http://localhost:8080/
```
Here's what you'll see:

<img width="1175" alt="Screen Shot 2024-04-04 at 7 26 08 AM" src="https://github.com/AGolz/Born2beRoot/assets/51645091/eed03dd8-c97c-47a9-94cc-8e32104d2d9e">

The output from ApacheBench (ab) provides information about the performance of your server when handling 1000 requests with a concurrency of 10.

Here's a breakdown of the key metrics:

__Server Software__: Indicates the software running on the server. In this case, it's Nginx version 1.20.1.  
__Server Hostname__: The hostname of the server, which is "localhost" in this case.  
__Server Port__: The port number the server is listening on, which is 8080.  
__Document Path__: The path to the document being requested, which is "/" indicating the homepage.  
__Document Length__: The size of the document being served, which is 157 bytes.  
__Concurrency Level__: The number of multiple requests being sent simultaneously, which is 10.  
__Time taken for tests__: The total time taken to complete the benchmarking tests, which is 0.149 seconds.  
__Complete requests__: The total number of requests completed, which is 1000.  
__Failed requests__: The number of requests that failed, which is 0 in this case.  
__Non-2xx responses__: The number of responses that were not in the 2xx range (e.g., 200 OK), which is 1000, indicating all responses were successful.  
__Requests per second__: The average number of requests handled per second, which is 6716.37.  
__Time per request__: The average time taken to process each request, which is 1.489 milliseconds.  
__Transfer rate__: The average data transfer rate, which is 2026.72 kilobytes per second.

The `Connection Times` section provides details about the time taken for various stages of the request-handling process, including connecting to the server, processing the request, and waiting for a response.

Finally, the `Percentage of the requests served within a certain time` section shows the distribution of response times. For example, 50% of requests were served within 1 milliseconds, 95% within 3 milliseconds, and 100% within 9 milliseconds. This information helps assess the overall responsiveness of the server under load.

## Resume:**[Project instructions](https://github.com/AGolz/ft_printf-42/files/10759004/en.subject.pdf)**


In this article, we took a journey to deploy a server on Rocky Linux using VirtualBox. We started by understanding the concept of virtual machines (VMs) and their importance in modern software development and OT infrastructure.

Turning to the practical side, we studied the process of installing and configuring Rocky Linux in VirtualBox. We learned about the advantages of Rocky Linux as a stable and secure corporate operating system.

Following this detailed guide, we have successfully deployed our own Linux server ready to support our development needs. We have a powerful combination that allows us to experiment, test and deploy applications in a controlled and isolated environment.

Congratulations on completing the deployment of your server! 

Need help: elmaksim@student.42yerevan.am

