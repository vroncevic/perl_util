package Status;
#
# @brief    Status constants
# @version  ver.1.0
# @date     Thu Jun 16 13:17:32 2016
# @company  Frobas IT Department, www.frobas.com 2016
# @author   Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
use strict;
use warnings;
use Exporter;
use File::Basename qw(dirname);
use Cwd qw(abs_path);
use lib dirname(dirname(abs_path($0))) . '/../../lib/perl5';
use InfoDebugMessage qw(info_debug_message);
use ErrorMessage qw(error_message);
our @ISA = qw(Exporter);
our %EXPORT_TAGS = ('all' => [qw()]);
our @EXPORT_OK = ($EXPORT_TAGS{all} );
our @EXPORT = qw($SUCCESS $NOT_SUCCESS check_status);
our $VERSION = '1.0';
our $TOOL_DBG="false";
our $SUCCESS = 0;
our $NOT_SUCCESS = 1;

#
# @brief   Checking status [hash structure]
# @param   Value required status hash structure
# @retval  Success 0, else 1
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# use Status::CheckStatus qw(all);
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

Status - Perl extension for status constants

=head1 SYNOPSIS

	use Status;
	...
	if($status == $NOT_SUCCESS) {
		exit(130);
	}

=head1 DESCRIPTION

Status constants for return states, or for condition statemnts

=head2 EXPORT

None by default.

=head1 AUTHOR

Vladimir Roncevic, E<lt>vladimir.roncevic@frobas.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by Vladimir Roncevic

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
