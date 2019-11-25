#
# @brief	Checking status hash structure
# @version  ver.1.0
# @date	 Tue Feb 14 20:38:14 CET 2017
# @company  Free software to use 2017
# @author   Vladimir Roncevic <elektron.ronca@gmail.com>
#
use warnings FATAL => 'all';
use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => 'OrCheckStatus',
	VERSION_FROM => 'lib/OrCheckStatus.pm',
	PREREQ_PM => {},
	($] >= 5.005 ?
		(
			ABSTRACT_FROM => 'lib/OrCheckStatus.pm',
			AUTHOR => 'Vladimir Roncevic <elektron.ronca@gmail.com>'
		):()
	),
);
