package Logging;
#
# @brief    Write log message to App/Tool/Script LOG file
# @version  ver.1.0
# @date     Mon Sep 12 22:48:32 2015
# @company  Frobas IT Department, www.frobas.com 2015
# @author   Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
use strict;
use warnings;
use Exporter;
use Sys::Hostname;
use Cwd qw(abs_path);
use File::Basename qw(dirname);
use lib dirname(dirname(abs_path($0))) . '/../../lib/perl5';
use Status qw($SUCCESS $NOT_SUCCESS check_status);
use InfoDebugMessage qw(info_debug_message);
use ErrorMessage qw(error_message);
our @ISA = qw(Exporter);
our %EXPORT_TAGS = ('all' => [qw()]);
our @EXPORT_OK = (@{$EXPORT_TAGS{'all'}});
our @EXPORT = qw(logging);
our $VERSION = '1.0';
our $TOOL_DBG="false";

#
# @brief   Write log message to App/Tool/Script LOG file
# @param   Value required log hash
# @retval  Success 0, else 1
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# use Logging qw(logging);
# use Status;
# 
# my %log;
# $log{LOG_FILE_PATH}="/opt/toolname/toolname.log"
# $log{LOG_MESSAGE}="Started toolname";
#
# if(logging(\%log) == $SUCCESS) {
#	# true
#	# notify admin | user
# } else {
#	# false
#	# return $NOT_SUCCESS
#	# or
#	# exit 128
# }
#
sub logging {
	my $lref = $_[0];
	my $msg = "None";
	if(defined($lref)) {
		my $time = localtime();
		my $host = hostname();
		$msg = "Checking log file [$$lref{LOG_FILE_PATH}]";
		info_debug_message($msg);
		unless(open(LOG_FILE, ">>$$lref{LOG_FILE_PATH}")) {
			$msg = "Faild to open log file\n$$lref{LOG_FILE_PATH}";
			error_message($msg);
			return ($NOT_SUCCESS);
		}
		print(LOG_FILE "[$time] $$lref{LOG_MESSAGE} [host: $host]\n");
		$msg = "Done";
		info_debug_message($msg);
		close(LOG_FILE);
		return ($SUCCESS);
	}
	$msg = "Check argument [LOG_STRUCTURE]";
	error_message($msg);
	return ($NOT_SUCCESS);
}

1;
__END__

=head1 NAME

Logging - Write log message to App/Tool/Script LOG file

=head1 SYNOPSIS

	use Logging qw(logging);
	use Status;

	my %log;
	$log{LOG_FILE_PATH} = "/opt/toolname/toolname.log"
	$log{LOG_MESSAGE} = "Started toolname";

	if(logging(\%log) == $SUCCESS) {
		# true
		# notify admin | user
	} else {
		# false
		# return $NOT_SUCCESS
		# or
		# exit 128
	}

=head1 DESCRIPTION

Write log message to App/Tool/Script LOG file

=head2 EXPORT

None by default.

=head1 AUTHOR

Vladimir Roncevic, E<lt>vladimir.roncevic@frobas.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by www.frobas.com

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
