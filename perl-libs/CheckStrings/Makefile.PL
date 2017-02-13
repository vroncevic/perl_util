use 5.018002;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => 'CheckStrings',
	VERSION_FROM => 'lib/CheckStrings.pm',
	PREREQ_PM => {},
	($] >= 5.005 ?
		(ABSTRACT_FROM => 'lib/CheckStrings.pm',
		AUTHOR => 'Vladimir Roncevic <elektron.ronca@gmail.com>'):()),
);

