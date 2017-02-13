use 5.018002;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => 'CheckStatus',
	VERSION_FROM => 'lib/CheckStatus.pm',
	PREREQ_PM => {},
	($] >= 5.005 ?
		(ABSTRACT_FROM => 'lib/CheckStatus.pm',
		AUTHOR => 'Vladimir Roncevic <elektron.ronca@gmail.com>'):()),
);

