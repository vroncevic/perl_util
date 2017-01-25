use 5.018002;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => 'Status',
	VERSION_FROM => 'lib/Status.pm',
	PREREQ_PM => {},
	($] >= 5.005 ?
		(ABSTRACT_FROM => 'lib/Status.pm',
		AUTHOR => 'Vladimir Roncevic <vladimir.roncevic@forbas.com>'):()),
);

