package Logging;
#
# @brief    Write log message to App/Tool/Script log file
# @version  ver.1.0
# @date     Mon Sep 12 22:48:32 2015
# @company  Frobas IT Department, www.frobas.com 2015
# @author   Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
use warnings FATAL => 'all';
use strict;
use Sys::Hostname;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter);
$VERSION = '1.0';
@EXPORT = qw();
%EXPORT_TAGS = ('all' => [qw(logging)]);
@EXPORT_OK = (@{$EXPORT_TAGS{'all'}});

use lib '/usr/local/perl/lib/perl5';
use InfoDebugMessage qw(info_debug_message);
use ErrorMessage qw(error_message);
use Utils qw(def);
use Status qw(:all);

#
# @brief   Write log message to App/Tool/Script log file
# @param   Value required log hash
# @retval  Success 1, else 0
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# use Logging qw(logging);
# use Status qw(:all);
# 
# my %log;
# $log{LOG_FILE_PATH}="/opt/toolname/toolname.log"
# $log{LOG_MESSAGE}="Started toolname";
#
# if(logging(\%log)) {
#	# true
#	# notify admin | user
# } else {
#	# false
#	# return NOT_SUCCESS
#	# or
#	# exit 128
# }
#
sub logging {
	my $lref = $_[0];
	my $msg = "None";
	if(def($lref)) {
		$msg = "Write log message to LOG file";
		info_debug_message($msg);
		my $time = localtime();
		my $host = hostname();
		$msg = "Checking log file [$$lref{LOG_FILE_PATH}]";
		info_debug_message($msg);
		my $fh;
		if(not open($fh, ">>", "$$lref{LOG_FILE_PATH}")) {
			$msg = "Faild to open log file\n$$lref{LOG_FILE_PATH}";
			error_message($msg);
			return (NOT_SUCCESS);
		}
		print($fh "[$time] $$lref{LOG_MESSAGE} [host: $host]\n");
		$msg = "Done";
		info_debug_message($msg);
		close($fh);
		return (SUCCESS);
	}
	$msg = "Missing argument [LOG_STRUCTURE]";
	error_message($msg);
	return (NOT_SUCCESS);
}

1;
__END__

=head1 NAME

Logging - Write log message to App/Tool/Script log file

=head1 SYNOPSIS

	use Logging qw(logging);
	use Status qw(:all);

	my %log;
	$log{LOG_FILE_PATH} = "/opt/toolname/toolname.log"
	$log{LOG_MESSAGE} = "Started toolname";

	if(logging(\%log)) {
		# true
		# notify admin | user
	} else {
		# false
		# return NOT_SUCCESS
		# or
		# exit 128
	}

=head1 DESCRIPTION

Write log message to App/Tool/Script LOG file

=head2 EXPORT

logging - Success return 1, else return 0.

=head1 AUTHOR

Vladimir Roncevic, E<lt>vladimir.roncevic@frobas.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by www.frobas.com

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
