#
# @brief	Print info debug message in parent function
# @version  ver.1.0
# @date	 Sun Jan 22 23:46:31 CET 2017
# @company  None, free software to use 2017
# @author   Vladimir Roncevic <elektron.ronca@gmail.com>
#
use warnings FATAL => 'all';
use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => 'InfoDebugMessage',
	VERSION_FROM => 'lib/InfoDebugMessage.pm',
	PREREQ_PM => {},
	ABSTRACT_FROM => 'lib/InfoDebugMessage.pm',
	AUTHOR => 'Vladimir Roncevic <elektron.ronca@gmail.com>'
);

