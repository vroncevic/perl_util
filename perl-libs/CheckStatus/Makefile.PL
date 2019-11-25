#
# @brief	Checking status hash structure
# @version  ver.1.0
# @date	 Mon Feb 13 15:36:07 CET 2017
# @company  Free software to use 2017
# @author   Vladimir Roncevic <elektron.ronca@gmail.com>
#
use warnings FATAL => 'all';
use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => 'CheckStatus',
	VERSION_FROM => 'lib/CheckStatus.pm',
	PREREQ_PM => {},
	($] >= 5.005 ?
		(
			ABSTRACT_FROM => 'lib/CheckStatus.pm',
			AUTHOR => 'Vladimir Roncevic <elektron.ronca@gmail.com>'
		):()
	),
);

