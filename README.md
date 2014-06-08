A Lightweight NodeJS and Mongo Dev Machine using Vagrant (that also works in Windows)
======================================================================

This is a Vagrant project that will create a barebones Ubuntu 14.04 x64 virtual machine with [NodeJS](http://nodejs.org/) and [MongoDB](http://www.mongodb.org/) installed.  Provisioning will be done using chef-solo and the vagrant-librarian plugin.

**Developed using a Windows 8.1 x64 Professional host machine**

Prerequisites
-------------

 - [Vagrant >= 1.6.3](http://www.vagrantup.com)
 - [Vagrant-Librarian-Chef-Nochef](https://github.com/emyl/vagrant-librarian-chef-nochef)
 - [Virtualbox >= 4.3](http://www.virtualbox.org)


Installation
------------

On your workstation ...

1. Download and install [Vagrant](http://www.vagrantup.com) 
2. Download and install [Virtualbox](http://www.virtualbox.org).
3. Install the [Vagrant-Librarian-Chef-Nochef](https://github.com/emyl/vagrant-librarian-chef-nochef) plugin
  * `$: vagrant plugin install vagrant-librarian-chef-nochef`


Launch, Login and Verify
--------------------------
```bash
	$: vagrant up
	$: vagrant ssh
	$: node -v
	$: mongo --version
```

If `node -v` and `mongo --version` return with version numbers then you're **done!** You should be ready to rock.
  
  
Troubleshooting in Windows
---------------

If you run into an error along the lines of **"fileutils unlink: permission denied"**, you can try the following:

- find your `~/.vagrant.d` folder, mine was located `C:/Users/ME/.vagrant.d`
- disable the READ-ONLY flag recursively for the `~/.vagrant.d` folder
- set permissions for **EVERYONE** to **full control** on the `~/.vagrant.d` folder