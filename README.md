# perl_util (Perl Package Modules)

**perl_util** is framework for creating/building Apps/Tools/Scripts.

Developed in **[perl](https://www.perl.org/)** code: **100%**.

A README file is required for CPAN modules since CPAN extracts the
README file from a module distribution so that people browsing the
archive can use it get an idea of the modules uses. It is usually a
good idea to provide version information here so that people can
decide whether fixes for the module are worth downloading.

![Perl package](https://github.com/vroncevic/perl_util/workflows/perl_util_checker/badge.svg?branch=master) [![GitHub issues open](https://img.shields.io/github/issues/vroncevic/perl_util.svg)](https://github.com/vroncevic/perl_util/issues) [![GitHub contributors](https://img.shields.io/github/contributors/vroncevic/perl_util.svg)](https://github.com/vroncevic/perl_util/graphs/contributors)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Installation](#installation)
- [Dependencies](#dependencies)
- [Library structure](#library-structure)
- [Docs](#docs)
- [Copyright and licence](#copyright-and-licence)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Installation

Follow instructions from README for each module.

Set INSTALL_BASE=/usr/local/perl/

### Dependencies

**perl_util** requires next modules and libraries

Check requires from README for each module.

### Library structure

```bash
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
```

### Docs

[![Documentation Status](https://readthedocs.org/projects/perl_util/badge/?version=latest)](https://perl-util.readthedocs.io/projects/perl_util/en/latest/?badge=latest)

More documentation and info at

* [perl_util.readthedocs.io](https://perl-util.readthedocs.io/en/latest/)
* [www.perl.org](https://www.perl.org/)

### Copyright and licence

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Copyright (C) 2015 - 2024 by [vroncevic.github.io/perl_util](https://vroncevic.github.io/perl_util/)

**perl_util** is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.
