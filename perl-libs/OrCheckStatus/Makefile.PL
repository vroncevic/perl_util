use 5.018002;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => 'OrCheckStatus',
	VERSION_FROM => 'lib/OrCheckStatus.pm',
	PREREQ_PM => {},
	($] >= 5.005 ?
		(ABSTRACT_FROM => 'lib/OrCheckStatus.pm',
		AUTHOR => 'Vladimir Roncevic <elektron.ronca@gmail.com>'):()),
);

