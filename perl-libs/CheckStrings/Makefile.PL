#
# @brief    Check strings collected in hash structure
# @version  ver.1.0
# @date     Mon Feb 13 15:36:07 CET 2017
# @company  Free software to use 2017
# @author   Vladimir Roncevic <elektron.ronca@gmail.com>
#
use warnings FATAL => 'all';
use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => 'CheckStrings',
	VERSION_FROM => 'lib/CheckStrings.pm',
	PREREQ_PM => {},
	($] >= 5.005 ?
		(
			ABSTRACT_FROM => 'lib/CheckStrings.pm',
			AUTHOR => 'Vladimir Roncevic <elektron.ronca@gmail.com>'
		):()
	),
);
