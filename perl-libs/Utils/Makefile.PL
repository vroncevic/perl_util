#
# @brief	Checking is scalar variable defined
# @version  ver.1.0
# @date	 Sun Jan 22 23:46:31 CET 2017
# @company  None, free software to use 2017
# @author   Vladimir Roncevic <elektron.ronca@gmail.com>
#
use warnings FATAL => 'all';
use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => 'Utils',
	VERSION_FROM => 'lib/Utils.pm',
	PREREQ_PM => {},
	ABSTRACT_FROM => 'lib/Utils.pm',
	AUTHOR => 'Vladimir Roncevic <elektron.ronca@gmail.com>'
);

