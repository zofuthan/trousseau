.. Trousseau documentation master file, created by
   sphinx-quickstart on Mon Sep 15 17:28:07 2014.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to Trousseau's documentation!
=====================================

Secrets are made to be shared, just not with anyone
---------------------------------------------------

*Trousseau* is an encrypted key-value store designed to be a *simple*, *safe* and *trustworthy* place for your data.

It stores data in a single file, encrypted using the openpgp asymetric encryption algorithm.
It can be easily exported and imported to/from multiple remote storages: like S3, an ssh endpoint, gist (ftp, dropbox, and more to come...).
It is able to restrict access to the data store to a set of openpgp recipients.

Create a *trousseau* data store, specify which *opengpg* recipients are allowed to open and modify it, add some key-value pairs to it, export it to S3 for example, and re-import it on another device: As simple as that.

*Secrets are made to be shared, just not with anyone.* Whether you're an admin, a paranoid guy living in a bunker, or a random user who seeks a simple way to store it's critical data in secured manner. *Trousseau* can do something for you.

You can't thrust post-it, nor stick them on the cloud
-----------------------------------------------------

Storing, transporting, and sharing sensitive data can be hard, and much more difficult when it comes to automate it.

*Trousseau* was created with private keys transportation and sharing across a servers cluster in mind.
However it has proved being useful to anyone who need to store and eventually share a passwords store, bank accounts details or even more sensitive data.

Real world use cases
____________________

For the admins out there
~~~~~~~~~~~~~~~~~~~~~~~~


*Trousseau can be useful to you when it comes to*:

* **Store** sensitive data: No more plain certificates and keys in your repositories and configuration files. Your brand new shiny infrastructure surely relies on many certificates and private keys of different kinds: ssl, rsa, gpg, ... *Trousseau* provides a simple and fine-tuned way to store their content in a single file that you can safely version using your favorite cvs.
* **Share** passwords, keys and other critical data with co-workers and servers in your cluster in a safe manner. *Trousseau* encrypts its content for the specific recipient you provide it. Only the recipient you intend will be able to import and read-write the *Trousseau* store content. *Trousseau* proved itself to be a great way to share some services passwords with your co-workers too!
* **Deploy** keys to your servers in a safe and normative way. Encrypt the trousseau store for each server selectively.

For the common users
~~~~~~~~~~~~~~~~~~~~

* **Store** your sensitive data like passwords, bank account details, sex tapes involving you and your teachers or whatever comes to your mind in an encrypted store.
* **Sync** your sensitive data store to remote services and easily share it between your unix-like devices.


.. toctree::
   :maxdepth: 2

   getting_started
   configuration
   usage
   architecture



Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
