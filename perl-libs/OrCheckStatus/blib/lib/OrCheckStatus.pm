package OrCheckStatus;
#
# @brief    Checking status hash structure
# @version  ver.1.0
# @date     Tue Feb 14 20:38:14 CET 2017
# @company  Free software to use 2017
# @author   Vladimir Roncevic <elektron.ronca@gmail.com>
#
use warnings FATAL => 'all';
use strict;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter);
$VERSION = '1.0';
@EXPORT = qw();
%EXPORT_TAGS = ('all' => [qw(or_check_status)]);
@EXPORT_OK = (@{$EXPORT_TAGS{'all'}});

use lib '/usr/local/perl/lib/perl5';
use InfoDebugMessage qw(info_debug_message);
use ErrorMessage qw(error_message);
use Status qw(:all);


#
# @brief   Checking status [hash structure], only one NOT_SUCCESS is enough
# @param   Value required status hash structure
# @retval  Success 1, else 0
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# use OrCheckStatus qw(or_check_status);
# use Status qw(:all);
#
# ...
#
# my %status = (VAR1 => 1, VAR2 => 0);
# if(or_check_status(\%status)) {
#	# true
#	# notify admin | user
# } else {
#	# false
#	# return NOT_SUCCESS
#	# or
#	# exit 128
# }
#
sub or_check_status {
	my %status = %{$_[0]};
	my $msg = "None";
	if(%status) {
		$msg = "Checking status [hash structure]";
		info_debug_message($msg);
		foreach my $key (keys(%status)) {
			if($status{$key} == NOT_SUCCESS) {
				$msg = "Done";
				info_debug_message($msg);
				return (NOT_SUCCESS);
			}
		}
		$msg = "Done";
		info_debug_message($msg);
		return (SUCCESS);
	}
	$msg = "Missing argument [STATUS_STRUCTURE]";
	error_message($msg);
	return (NOT_SUCCESS);
}

1;
__END__

=head1 NAME

OrCheckStatus - Checking statuses collected in hash structure.

=head1 SYNOPSIS

	use OrCheckStatus qw(or_check_status);
	use Status qw(:all);

	...

	my %status = (VAR1 => 1, VAR2 => 0);
	if(not or_check_status(\%status)) {
		exit(130);
	}

=head1 DESCRIPTION

or_check_status - check elements of hash structure.

=head2 EXPORT

or_check_status - Success return 1, else return 0.

=head1 AUTHOR

Vladimir Roncevic, E<lt>elektron.ronca@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by https://github.com/vroncevic/perl_util

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
