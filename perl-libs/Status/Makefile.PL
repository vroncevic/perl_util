#
# @brief	Status constants for checking status
# @version  ver.1.0
# @date	 Thu Jun 16 13:17:32 2016
# @company  Frobas IT Department, www.frobas.com 2016
# @author   Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
use warnings FATAL => 'all';
use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => 'Status',
	VERSION_FROM => 'lib/Status.pm',
	PREREQ_PM => {},
	($] >= 5.005 ?
		(
			ABSTRACT_FROM => 'lib/Status.pm',
			AUTHOR => 'Vladimir Roncevic <vladimir.roncevic@forbas.com>'
		):()
	),
);
