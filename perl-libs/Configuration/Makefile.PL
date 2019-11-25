#
# @brief	Load and parse configuration from file
# @version  ver.1.0
# @date	 Mon Sep 12 22:48:32 2015
# @company  Frobas IT Department, www.frobas.com 2015
# @author   Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
use warnings FATAL => 'all';
use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => 'Configuration',
	VERSION_FROM => 'lib/Configuration.pm',
	PREREQ_PM => {},
	($] >= 5.005 ?
		(
			ABSTRACT_FROM => 'lib/Configuration.pm',
			AUTHOR => 'Vladimir Roncevic <vladimir.roncevic@frobas.com>'
		):()
	),
);
