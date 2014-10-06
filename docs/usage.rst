.. _usage:

=====
Usage
=====

.. _create:
create
======

The create command generates an encrypted data store in ``$HOME/.trousseau.tr``.
Alternatively, the store will be created at the destination pointed by the ``$TROUSSEAU_HOME`` environment variable.

Encryption is made using your GPG main identity, and targets the GPG recipients you provide as the command arguments.

prototype
---------

.. code-block:: bash

    $ trousseau create [recipients...]

examples
--------

.. code-block:: bash

    # Create a store encrypted for a single recipient
    $ trousseau create 16DB4F3

    # Or multiple recipients
    $ trousseau create 16DB4F3 F514AD3

    # You can also provide recipients identity with the email
    # address attached to their gpg identity
    $ trousseau create tcrevon@gmail.com

    # Providing the TROUSSEAU_STORE environment variable lets you
    # tell trousseau which store to manipulate.
    $ export TROUSSEAU_STORE=/tmp/test_trousseau.tr && trousseau create 16DB4F3



.. _set:
set
===

Set a key-value pair in the encrypted data store

prototype
---------

.. code-block:: bash

    $ trousseau set [options] [key] [value]

options
-------

* ``--file``, ``-f``: Extracts the value of a key from the pointed file


examples
--------

.. code-block:: bash

    # Set a key-value pair
    $ trousseau set abc 123

    # Set a key-value pair from a file content using the --file option.
    $ trousseau set my.ssh.key.private --file ~/.ssh/id_rsa
    $ trousseau set my.ssh.key.public --file ~/.ssh/id_rsa.pub

.. _get:
get
===

Get a key's value from the encrypted data store

prototype
---------

.. code-block:: bash

    $ trousseau get [options] [key] [value]

options
-------

* ``--file``, ``-f``: Write the value of a key to the pointed file


examples
--------

.. code-block:: bash

    # Get a key's value
    $ trousseau get abc
    123

    # Write the value of a key to a file content using the --file option.
    $ trousseau get my.ssh.key.private --file ~/id_rsa
    $ trousseau get my.ssh.key.public --file ~/id_rsa.pub

.. _del:
del
===

Delete a key value pair from the store

prototype
---------

.. code-block:: bash

    $ trousseau del [key]

examples
--------

.. code-block:: bash

    # Rename a key
    $ trousseau set abc 123
    $ trousseau show
    abc : 123

    $ trousseau del abc

    $ trousseau show

.. _rename:
rename
======

Rename an encrypted data store's key

prototype
---------

.. code-block:: bash

    $ trousseau rename [options] [source key] [destination key]

options
-------

* ``--overwrite``: If destination key already exists, overwrite it's value with source key's value.


examples
--------

.. code-block:: bash

    # Rename a key
    $ trousseau show
    foo : 123
    $ trousseau rename foo bar
    $ trousseau show
    bar : 123

    # However, if the destination key already exists, an error will be thrown
    $ trousseau set foo 456
    $ trousseau show
    foo : 456
    bar : 123
    $ trousseau rename foo bar
    error: ...
    $ echo $status
    1

    # If you want to override the destination key's value, pass
    # the overwrite option
    $ trousseau rename --overwrite foo bar
    $ trousseau show
    bar : 456

.. _keys:
keys
====

List the encrypted data store keys

prototype
---------

.. code-block:: bash

    $ trousseau keys

examples
--------

.. code-block:: bash

    $ trousseau set abc 123
    $ trousseau keys
    abc

.. _show:
show
====

Show the encrypted data store key value pairs

prototype
---------

.. code-block:: bash

    $ trousseau show

examples
--------

.. code-block:: bash

    $ trousseau set abc 123
    $ trousseau show
    abc : 123

.. _export:
export
======

The export command exports the content of your data store, plain or encrypted, to a destination on your file system.

First and unique argument of the command is the destination file where to write the content of the data store to. If no destination is provided, content will be printed on stdout.
As a default the data store located in ``$HOME/.trousseau.tr`` will be exported. However, the ``$TROUSSEAU_STORE`` environment variable will be taken in account.

prototype
---------

.. code-block:: bash

    $ trousseau export [options...] [destination]

options
-------
* ``--overwrite``: Overwrite any existing destination file
* ``--plain``: Export the content of the encrypted data store as plain data

examples
--------

.. code-block:: bash

    # Export the encrypted content of the data store to a file
    $ trousseau export /tmp/mytrousseau.tr
    $ cat /tmp/mytrousseau.tr
    {'crypto_type': 1, 'crypto_algo': 0, '_data': 1209jd10id0[i1md[09ji1nodi1d ... 1298jd0i1wd0mmi1wdoik}

    # If no destination is provided, content will be printed directly on stdin
    $ trousseau export
    {'crypto_type': 1, 'crypto_algo': 0, '_data': 1209jd10id0[i1md[09ji1nodi1d ... 1298jd0i1wd0mmi1wdoik}

    # You might want for some (probably bad) reason export the content of your store
    # as plain key-value pairs
    $ trousseau export --plain /tmp/myplainstore
    $ cat /tmp/myplainstore
    abc : 123
    easy as : do re mi


.. _import:
import
======

Import an encrypted data store from a file system location

The import command imports the content of an encrypted data store, plain or encrypted, into your current data store.

First and unique argument of the command is the source file from which to read the content of the data store. If no source is provided, content will be read from stdin.

prototype
---------

.. code-block:: bash

    $ trousseau import [options...] [source]

options
-------

* ``--overwrite``: Overwrite local data store with imported resource
* ``--plain``: Import the content of the encrypted data store from a plain file
* ``--theirs``: In case of conflicting keys, keep the imported file values
* ``--yours``: In case of conflicting keys, keep your current data store values

examples
--------

.. code-block:: bash

    # Import the encrypted content of a file to the data store
    $ trousseau import /tmp/mytrousseau.tr
    $ trousseau show
    abc : 123
    easy as : do re mi

    # If no destination is provided, content will be printed directly on stdin
    $ echo "{'crypto_type': 1, 'crypto_algo': 0, '_data': 1209jd10id0[i1md[09ji1nodi1d ... 1298jd0i1wd0mmi1wdoik}" | trousseau import

    # You might want for some (probably bad) reason export the content of your store
    # as plain key-value pairs
    $ cat /tmp/myplainstore
    abc : 123
    easy as : do re mi

    $ trousseau import --plain /tmp/myplainstore

    $ trousseau show
    abc : 123
    easy as : do re mi

.. _push:
push
====

Push the encrypted data store to a remote storage


.. _pull:
pull
====

Pull the encrypted data store from a remote storage


.. _list-recipients:
list-recipients
===============

List the data store encryption recipients


.. _add-recipient:
add-recipient
=============

Add a recipient to the encrypted data store


.. _remove-recipient:
remove-recipient
================

Remove a recipient from the encrypted data store


.. _meta:
meta
====

Show the encrypted data store metadata


.. _upgrade:
upgrade
=======

Upgrade the encrypted data store to a newer version's file format


.. _help:
help
====

Shows a list of commands or help for one command