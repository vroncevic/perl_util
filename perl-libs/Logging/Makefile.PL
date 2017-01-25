use 5.018002;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => 'Logging',
	VERSION_FROM => 'lib/Logging.pm',
	PREREQ_PM => {},
	($] >= 5.005 ?
		(ABSTRACT_FROM => 'lib/Logging.pm',
		AUTHOR => 'Vladimir Roncevic <vladimir.roncevic@forbas.com>'):())
);

