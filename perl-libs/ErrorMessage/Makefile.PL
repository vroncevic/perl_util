#
# @brief	Print error message in parent function
# @version  ver.1.0
# @date	 Sun Jan 22 23:46:31 CET 2017
# @company  None, free software to use 2017
# @author   Vladimir Roncevic <elektron.ronca@gmail.com>
#
use warnings FATAL => 'all';
use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => 'ErrorMessage',
	VERSION_FROM => 'lib/ErrorMessage.pm',
	PREREQ_PM => {},
	ABSTRACT_FROM => 'lib/ErrorMessage.pm',
	AUTHOR => 'Vladimir Roncevic <elektron.ronca@gmail.com>'
);
