package CheckStrings;
#
# @brief    Check strings collected in hash structure
# @version  ver.1.0
# @date     Mon Feb 13 15:36:07 CET 2017
# @company  Free software to use 2017
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
our @EXPORT = qw(check_strings);
our $VERSION = '1.0';
our $TOOL_DBG = "false";

#
# @brief   Checking strings [hash structure]
# @param   Value required string hash structure
# @retval  Success 0, else 1
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# use CheckStrings qw(check_strings);
# use Status;
#
# ...
#
# if(check_strings(\%strings) == $SUCCESS) {
#	# true
#	# notify admin | user
# } else {
#	# false
#	# return $NOT_SUCCESS
#	# or
#	# exit 128
# }
#
sub check_strings {
	my %strings = %{$_[0]};
	my $msg = "None";
	if(%strings) {
		$msg = "Checking strings [hash structure]";
		info_debug_message($msg);
		foreach my $key (keys(%strings)) {
			if("$strings{$key}" eq "None") {
				return ($NOT_SUCCESS);
			}
		}
		$msg = "Done";
		info_debug_message($msg);
		return ($SUCCESS);
	}
	$msg = "Missing argument [STRING_STRUCTURE]";
	error_message($msg);
	return ($NOT_SUCCESS);
}

1;
__END__

=head1 NAME

CheckStrings - If one string from hash structure contain None string return 1

=head1 SYNOPSIS

	use CheckStrings qw(check_strings);

	...

	if(check_strings(\%struct) == $NOT_SUCCESS) {
		exit(130);
	}

=head1 DESCRIPTION

Status constants for return states, or for condition statemnts.

=head2 EXPORT

check_strings - return 0 if strings are ne to None, else return 1.

=head1 AUTHOR

Vladimir Roncevic, E<lt>elektron.ronca@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by https://github.com/vroncevic/perl_util

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
