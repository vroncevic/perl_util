perl_util (Perl Package Modules)
--------------------------------

**perl_util** is framework for creating Apps/Tools/Scripts.

Developed in `perl <https://www.perl.org/>`_ code.

The README is used to introduce the modules and provide instructions on
how to install the modules, any machine dependencies it may have and any
other information that should be provided before the modules are installed.

|perl_util checker| |perl_util github issues| |perl_util github contributors|

|perl_util documentation status|

.. |perl_util checker| image:: https://github.com/vroncevic/perl_util/actions/workflows/perl_util_checker.yml/badge.svg
   :target: https://github.com/vroncevic/perl_util/actions/workflows/perl_util_checker.yml

.. |perl_util github issues| image:: https://img.shields.io/github/issues/vroncevic/perl_util.svg
   :target: https://github.com/vroncevic/perl_util/issues

.. |perl_util github contributors| image:: https://img.shields.io/github/contributors/vroncevic/perl_util.svg
   :target: https://github.com/vroncevic/perl_util/graphs/contributors

.. |perl_util documentation status| image:: https://readthedocs.org/projects/perl-util/badge/?version=master
   :target: https://perl-util.readthedocs.io/?badge=master

.. toctree::
   :maxdepth: 4
   :caption: Contents

   self

Installation
-------------

Used next development environment

|debian linux os|

.. |debian linux os| image:: https://raw.githubusercontent.com/vroncevic/perl_util/dev/docs/debtux.png

Navigate to release `page`_ download and extract release archive.

.. _page: https://github.com/vroncevic/perl_util/releases

To install **perl_util** 

Follow instructions from README for each module.

Set INSTALL_BASE=/usr/local/perl/

Dependencies
-------------

**perl_util** requires next modules and libraries

Check requires from README for each module.

Library structure
--------------------

**perl_util** is based on MOP.

Library structure

.. code-block:: bash

    perl-libs/
        ├── CheckStatus/
        │   ├── blib
        │   │   ├── arch/
        │   │   │   └── auto/
        │   │   │       └── CheckStatus/
        │   │   ├── bin/
        │   │   ├── lib/
        │   │   │   ├── auto/
        │   │   │   │   └── CheckStatus/
        │   │   │   └── CheckStatus.pm
        │   │   ├── man1/
        │   │   ├── man3/
        │   │   │   └── CheckStatus.3pm
        │   │   └── script/
        │   ├── Changes
        │   ├── lib/
        │   │   └── CheckStatus.pm
        │   ├── Makefile
        │   ├── Makefile.old
        │   ├── Makefile.PL
        │   ├── MANIFEST
        │   ├── MANIFEST.bak
        │   ├── MYMETA.json
        │   ├── MYMETA.yml
        │   ├── pm_to_blib
        │   ├── README
        │   └── t/
        │       └── Status.t
        ├── CheckStrings/
        │   ├── blib/
        │   │   ├── arch/
        │   │   │   └── auto/
        │   │   │       └── CheckStrings/
        │   │   ├── bin/
        │   │   ├── lib/
        │   │   │   ├── auto/
        │   │   │   │   └── CheckStrings/
        │   │   │   └── CheckStrings.pm
        │   │   ├── man1/
        │   │   ├── man3/
        │   │   │   └── CheckStrings.3pm
        │   │   └── script/
        │   ├── Changes
        │   ├── lib/
        │   │   └── CheckStrings.pm
        │   ├── Makefile
        │   ├── Makefile.old
        │   ├── Makefile.PL
        │   ├── MANIFEST
        │   ├── MANIFEST.bak
        │   ├── MYMETA.json
        │   ├── MYMETA.yml
        │   ├── pm_to_blib
        │   ├── README
        │   └── t/
        │       └── Status.t
        ├── Configuration/
        │   ├── blib/
        │   │   ├── arch/
        │   │   │   └── auto/
        │   │   │       └── Configuration/
        │   │   ├── bin/
        │   │   ├── lib/
        │   │   │   ├── auto/
        │   │   │   │   └── Configuration/
        │   │   │   └── Configuration.pm
        │   │   ├── man1/
        │   │   ├── man3/
        │   │   │   └── Configuration.3pm
        │   │   └── script/
        │   ├── Changes
        │   ├── lib/
        │   │   └── Configuration.pm
        │   ├── Makefile
        │   ├── Makefile.PL
        │   ├── MANIFEST
        │   ├── MANIFEST.bak
        │   ├── MYMETA.json
        │   ├── MYMETA.yml
        │   ├── pm_to_blib
        │   ├── README
        │   └── t/
        │       └── Configuration.t
        ├── ErrorMessage/
        │   ├── blib/
        │   │   ├── arch/
        │   │   │   └── auto/
        │   │   │       └── ErrorMessage/
        │   │   ├── bin/
        │   │   ├── lib/
        │   │   │   ├── auto/
        │   │   │   │   └── ErrorMessage/
        │   │   │   └── ErrorMessage.pm
        │   │   ├── man1/
        │   │   ├── man3/
        │   │   │   └── ErrorMessage.3pm
        │   │   └── script/
        │   ├── Changes
        │   ├── lib/
        │   │   └── ErrorMessage.pm
        │   ├── Makefile
        │   ├── Makefile.PL
        │   ├── MANIFEST
        │   ├── MANIFEST.bak
        │   ├── MYMETA.json
        │   ├── MYMETA.yml
        │   ├── pm_to_blib
        │   ├── README
        │   └── t/
        │       └── ErrorMessage.t
        ├── InfoDebugMessage/
        │   ├── blib/
        │   │   ├── arch/
        │   │   │   └── auto/
        │   │   │       └── InfoDebugMessage/
        │   │   ├── bin/
        │   │   ├── lib/
        │   │   │   ├── auto/
        │   │   │   │   └── InfoDebugMessage/
        │   │   │   └── InfoDebugMessage.pm
        │   │   ├── man1/
        │   │   ├── man3/
        │   │   │   └── InfoDebugMessage.3pm
        │   │   └── script/
        │   ├── Changes
        │   ├── lib/
        │   │   └── InfoDebugMessage.pm
        │   ├── Makefile
        │   ├── Makefile.PL
        │   ├── MANIFEST
        │   ├── MANIFEST.bak
        │   ├── MYMETA.json
        │   ├── MYMETA.yml
        │   ├── pm_to_blib
        │   ├── README
        │   └── t/
        │       └── InfoDebugMessage.t
        ├── InfoMessage/
        │   ├── blib/
        │   │   ├── arch/
        │   │   │   └── auto/
        │   │   │       └── InfoMessage/
        │   │   ├── bin/
        │   │   ├── lib/
        │   │   │   ├── auto/
        │   │   │   │   └── InfoMessage/
        │   │   │   └── InfoMessage.pm
        │   │   ├── man1/
        │   │   ├── man3/
        │   │   │   └── InfoMessage.3pm
        │   │   └── script/
        │   ├── Changes
        │   ├── lib/
        │   │   └── InfoMessage.pm
        │   ├── Makefile
        │   ├── Makefile.PL
        │   ├── MANIFEST
        │   ├── MANIFEST.bak
        │   ├── MYMETA.json
        │   ├── MYMETA.yml
        │   ├── pm_to_blib
        │   ├── README
        │   └── t/
        │       └── InfoMessage.t
        ├── Logging/
        │   ├── blib/
        │   │   ├── arch/
        │   │   │   └── auto/
        │   │   │       └── Logging/
        │   │   ├── bin/
        │   │   ├── lib/
        │   │   │   ├── auto/
        │   │   │   │   └── Logging/
        │   │   │   └── Logging.pm
        │   │   ├── man1/
        │   │   ├── man3/
        │   │   │   └── Logging.3pm
        │   │   └── script/
        │   ├── Changes
        │   ├── lib/
        │   │   └── Logging.pm
        │   ├── Makefile
        │   ├── Makefile.PL
        │   ├── MANIFEST
        │   ├── MANIFEST.bak
        │   ├── MYMETA.json
        │   ├── MYMETA.yml
        │   ├── pm_to_blib
        │   ├── README
        │   └── t/
        │       └── Logging.t
        ├── Notification/
        │   ├── blib/
        │   │   ├── arch/
        │   │   │   └── auto/
        │   │   │       └── Notification/
        │   │   ├── bin/
        │   │   ├── lib/
        │   │   │   ├── auto/
        │   │   │   │   └── Notification/
        │   │   │   └── Notification.pm
        │   │   ├── man1/
        │   │   ├── man3/
        │   │   │   └── Notification.3pm
        │   │   └── script/
        │   ├── Changes
        │   ├── lib/
        │   │   └── Notification.pm
        │   ├── Makefile
        │   ├── Makefile.PL
        │   ├── MANIFEST
        │   ├── MANIFEST.bak
        │   ├── MYMETA.json
        │   ├── MYMETA.yml
        │   ├── pm_to_blib
        │   ├── README
        │   └── t/
        │       └── Notification.t
        ├── OrCheckStatus/
        │   ├── blib/
        │   │   ├── arch/
        │   │   │   └── auto/
        │   │   │       ├── CheckStatus/
        │   │   │       └── OrCheckStatus/
        │   │   ├── bin/
        │   │   ├── lib/
        │   │   │   ├── auto/
        │   │   │   │   ├── CheckStatus/
        │   │   │   │   └── OrCheckStatus/
        │   │   │   ├── CheckStatus.pm
        │   │   │   └── OrCheckStatus.pm
        │   │   ├── man1/
        │   │   ├── man3/
        │   │   │   ├── CheckStatus.3pm
        │   │   │   └── OrCheckStatus.3pm
        │   │   └── script/
        │   ├── Changes
        │   ├── lib/
        │   │   └── OrCheckStatus.pm
        │   ├── Makefile
        │   ├── Makefile.old
        │   ├── Makefile.PL
        │   ├── MANIFEST
        │   ├── MANIFEST.bak
        │   ├── MYMETA.json
        │   ├── MYMETA.yml
        │   ├── pm_to_blib
        │   ├── README
        │   └── t/
        │       └── Status.t
        ├── Status/
        │   ├── blib/
        │   │   ├── arch/
        │   │   │   └── auto/
        │   │   │       └── Status/
        │   │   ├── bin/
        │   │   ├── lib/
        │   │   │   ├── auto/
        │   │   │   │   └── Status/
        │   │   │   └── Status.pm
        │   │   ├── man1/
        │   │   ├── man3/
        │   │   │   └── Status.3pm
        │   │   └── script/
        │   ├── Changes
        │   ├── lib/
        │   │   └── Status.pm
        │   ├── Makefile
        │   ├── Makefile.old
        │   ├── Makefile.PL
        │   ├── MANIFEST
        │   ├── MANIFEST.bak
        │   ├── MYMETA.json
        │   ├── MYMETA.yml
        │   ├── pm_to_blib
        │   ├── README
        │   └── t/
        │       └── Status.t
        └── Utils/
            ├── blib/
            │   ├── arch/
            │   │   └── auto/
            │   │       └── Utils/
            │   ├── bin/
            │   ├── lib/
            │   │   ├── auto/
            │   │   │   └── Utils/
            │   │   └── Utils.pm
            │   ├── man1/
            │   ├── man3/
            │   │   └── Utils.3pm
            │   └── script/
            ├── Changes
            ├── lib/
            │   └── Utils.pm
            ├── Makefile
            ├── Makefile.PL
            ├── MANIFEST
            ├── MANIFEST.bak
            ├── MYMETA.json
            ├── MYMETA.yml
            ├── pm_to_blib
            ├── README
            └── t/
                └── Utils.t

Copyright and licence
----------------------

|license: gpl v3| |license: apache 2.0|

.. |license: gpl v3| image:: https://img.shields.io/badge/License-GPLv3-blue.svg
   :target: https://www.gnu.org/licenses/gpl-3.0

.. |license: apache 2.0| image:: https://img.shields.io/badge/License-Apache%202.0-blue.svg
   :target: https://opensource.org/licenses/Apache-2.0

Copyright (C) 2015 - 2024 by `vroncevic.github.io/perl_util <https://vroncevic.github.io/perl_util>`_

**perl_util** is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.

Indices and tables
------------------

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
