use 5.018002;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => 'Notification',
	VERSION_FROM => 'lib/Notification.pm',
	PREREQ_PM => {},
	($] >= 5.005 ?
		(ABSTRACT_FROM => 'lib/Notification.pm',
		AUTHOR => 'Vladimir Roncevic <vladimir.roncevic@forbas.com>'):()),
);

