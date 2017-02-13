package Utils;
#
# @brief    Checking is scalar variable defined and hash status
# @version  ver.1.0
# @date     Sun Jan 22 23:46:31 CET 2017
# @company  None, free software to use 2017
# @author   Vladimir Roncevic <elektron.ronca@gmail.com>
#
use strict;
use warnings;
use Exporter;
use lib '/root/scripts/lib/perl5';
use InfoDebugMessage qw(info_debug_message);
use ErrorMessage qw(error_message);
use Status;
our @ISA = qw(Exporter);
our %EXPORT_TAGS = ('all' => [qw()]);
our @EXPORT_OK = (@{$EXPORT_TAGS{'all'}});
our @EXPORT = qw(def check_status);
our $VERSION = '1.0';
our $TOOL_DBG = "false";

#
# @brief   Checking is scalar variable defined
# @param   Value required scalar variable
# @retval  Success 0, else 1
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# use Utils qw(def);
# use Status;
#
# ...
#
# if(def($status) == $SUCCESS) {
#	# true
#	# notify admin | user
# } else {
#	# false
#	# return $NOT_SUCCESS
#	# or
#	# exit 128
# }
#
sub def {
	my $var = $_[0];
	if(defined($var)) {
		return ($SUCCESS);
	}
	return ($NOT_SUCCESS);
}

#
# @brief   Checking status [hash structure]
# @param   Value required status hash structure
# @retval  Success 0, else 1
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# use Utils qw(check_status);
# use Status;
#
# ...
#
# if(check_status(\%status) == $SUCCESS) {
#	# true
#	# notify admin | user
# } else {
#	# false
#	# return $NOT_SUCCESS
#	# or
#	# exit 128
# }
#
sub check_status {
	my %status = %{$_[0]};
	my $msg = "None";
	if(%status) {
		$msg = "Checking status [hash structure]";
		info_debug_message($msg);
		foreach my $key (keys(%status)) {
			$msg = "$key: $status{$key}";
			info_debug_message($msg);
			if($status{$key} == $SUCCESS) {
				next;
			} else {
				return ($NOT_SUCCESS);
			}
		}
		$msg = "Done";
		info_debug_message($msg);
		return ($SUCCESS);
	}
	$msg = "Missing argument [STATUS_STRUCTURE]";
	error_message($msg);
	return ($NOT_SUCCESS);
}

1;
__END__

=head1 NAME

Status - Checking is scalar variable defined or check status hash structure

=head1 SYNOPSIS

	use Utils qw(def check_status);
	use Status;

	...

	if(def($status) == $NOT_SUCCESS) {
		exit(130);
	}

	if(check_status(\%status) == $NOT_SUCCESS) {
		exit(127);
	}

=head1 DESCRIPTION

def - success (defined) 0, else 1

=head2 EXPORT

def - Success 0, else 1; check_status - Success 0, else 1.

=head1 AUTHOR

Vladimir Roncevic, E<lt>elektron.ronca@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by https://github.com/vroncevic/perl-util

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
