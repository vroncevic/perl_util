use 5.018002;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => 'Configuration',
	VERSION_FROM => 'lib/Configuration.pm',
	PREREQ_PM => {},
	($] >= 5.005 ?
		(ABSTRACT_FROM => 'lib/Configuration.pm',
		AUTHOR => 'Vladimir Roncevic <vladimir.roncevic@frobas.com>'):()),
);

