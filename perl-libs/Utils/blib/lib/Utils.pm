package Utils;
#
# @brief    Checking is scalar variable defined and hash status
# @version  ver.1.0
# @date     Sun Jan 22 23:46:31 CET 2017
# @company  None, free software to use 2017
# @author   Vladimir Roncevic <elektron.ronca@gmail.com>
#
use warnings FATAL => 'all';
use strict;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
$VERSION = '1.0';
@ISA = qw(Exporter);
@EXPORT = qw();
%EXPORT_TAGS = ('all' => [qw(def)]);
@EXPORT_OK = (@{$EXPORT_TAGS{'all'}});

use lib '/usr/local/perl/lib/perl5';
use Status qw(SUCCESS NOT_SUCCESS);

#
# @brief   Checking is scalar variable defined
# @param   Value required scalar variable
# @retval  Success 0, else 1
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# use Utils qw(def);
# use Status qw(SUCCESS NOT_SUCCESS);
#
# ...
#
# if(def($status)) {
#	# true
#	# notify admin | user
# } else {
#	# false
#	# return NOT_SUCCESS
#	# or
#	# exit 128
# }
#
sub def {
	my $var = $_[0];
	if(defined($var)) {
		return (SUCCESS);
	}
	return (NOT_SUCCESS);
}

1;
__END__

=head1 NAME

Utils - Helpful functions

=head1 SYNOPSIS

	use Utils qw(def);
	use UtilStatus qw(SUCCESS NOT_SUCCESS);

	...

	if(def($status) == NOT_SUCCESS) {
		exit(130);
	}

	if(def($status)) {
		# Do operation for status SUCCESS
	}

=head1 DESCRIPTION

def - success (defined) 0, else 1

=head2 EXPORT

def - Success 0, else 1.

=head1 AUTHOR

Vladimir Roncevic, E<lt>elektron.ronca@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by https://github.com/vroncevic/perl_util

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
