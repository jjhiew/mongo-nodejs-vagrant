A Lightweight NodeJS, ExpressJS and MongoDB Dev Machine using Vagrant (that also works in Windows)
======================================================================

This is a Vagrant project that will create a barebones Ubuntu 14.04 x64 virtual machine with [NodeJS](http://nodejs.org/), [ExpressJS](http://expressjs.com/) and [MongoDB](http://www.mongodb.org/) installed.  Provisioning will be done using chef-solo and the vagrant-librarian plugin.

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
	$: express -V
```

If `node -v`, `express -V` and `mongo --version` return with version numbers then you're **done!** You should be ready to rock.
  

Setting up your ExpressJS App
-----------------------------

If you already have source files, you can put it in the `app` folder.  Login to your Vagrant environment using `vagrant ssh` then run ...

```bash
	$: cd /home/vagrant
	$: express app 			# skip this step if you already have your source
	$: cd app 
	$: sudo npm install --no-bin-links
	$: npm start
```

Open up your browser and go to [http://localhost:3000](http://localhost:3000) and you should see the Express welcome page.

You will want to edit the `package.json` file and add an entry for the MongoDB driver you intend to use.  Be sure to re-run `sudo npm install --no-bin-links` again once you've added it in.  

The `--no-bin-links` flag is used to get around the issue of symlinking in shared folders with Virtualbox.  


Troubleshooting in Windows
--------------------------

If you run into an error along the lines of **"fileutils unlink: permission denied"**, it might be because you commented out the provisioning section in the Vagrantfile and ran a `vagrant provision`.  This causes all sorts of problems with the `vagrant-librarian-chef-nochef` plugin.  

Steps to recover:

1. destroy your vagrant environment
2. delete the `cookbooks`, `tmp`, and `Cheffile.lock` files
3. run `vagrant up` 