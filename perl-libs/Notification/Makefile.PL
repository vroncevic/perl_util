#
# @brief	Sending notification to administrator by email
# @version  ver.1.0
# @date	 Sun Sep 13 11:15:32 2015
# @company  Frobas IT Department, www.frobas.com 2015
# @author   Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
use warnings FATAL => 'all';
use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => 'Notification',
	VERSION_FROM => 'lib/Notification.pm',
	PREREQ_PM => {},
	($] >= 5.005 ?
		(
			ABSTRACT_FROM => 'lib/Notification.pm',
			AUTHOR => 'Vladimir Roncevic <vladimir.roncevic@forbas.com>'
		):()
	),
);
