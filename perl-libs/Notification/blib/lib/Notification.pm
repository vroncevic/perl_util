package Notification;
#
# @brief    Sending notification to administrator by email
# @version  ver.1.0
# @date     Sun Sep 13 11:15:32 2015
# @company  Frobas IT Department, www.frobas.com 2015
# @author   Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
use strict;
use warnings;
use Exporter;
use Sys::Hostname;
use Mail::Sendmail;
use lib '/root/scripts/lib/perl5';
use InfoDebugMessage qw(info_debug_message);
use ErrorMessage qw(error_message);
use Utils qw(def);
use Status;
our @ISA = qw(Exporter);
our %EXPORT_TAGS = ('all' => [qw()]);
our @EXPORT_OK = (@{$EXPORT_TAGS{'all'}});
our @EXPORT = qw(notify);
our $VERSION = '1.0';
our $TOOL_DBG = "false";

#
# @brief   Sending notification to administrator by email
# @param   Value required notification hash
# @retval  Success 0, else 1
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# use Notification qw(notify);
# use Status;
# 
# my %notification;
# $notification{ADMIN_EMAIL} = "admin\@company.com"
# $notification{EMAIL_FROM} = "ToolName\@hostname";
# $notification{MESSAGE} = "Simple message";
#
# if(notify(\%notification) == $SUCCESS) {
#	# true
#	# notify admin | user
# } else {
#	# false
#	# return $NOT_SUCCESS
#	# or
#	# exit 128
# }
#
sub notify {
	my $nref = $_[0];
	my $msg = "None";
	if(def($nref) == $SUCCESS) {
		$msg = "Sending email to administrator";
		info_debug_message($msg);
		my $time = localtime();
		my $host = hostname();
		my $subject = "[NOTIFICATION] Workstation " . $host;
		my $body = "[$time] " . $$nref{MESSAGE} . " [host: $host]\n";
		my %mail = (
			To => $$nref{ADMIN_EMAIL}, From => $$nref{EMAIL_FROM},
			Subject => $subject, Message => $body
		);
		if(sendmail(%mail)) {
			$msg = "Sent email to administrator";
			info_debug_message($msg);
			return ($SUCCESS);
		}
		$msg = "Check sendmail configuration";
		error_message($msg);
		return ($NOT_SUCCESS);
	}
	$msg = "Missing argument [NOTIFICATION_STRUCTURE]";
	error_message($msg);
	return ($NOT_SUCCESS);
}

1;
__END__

=head1 NAME

Notification - Sending notification to administrator by email

=head1 SYNOPSIS

	use Notification qw(notify);
	use Status;

	my %notification;
	$notification{ADMIN_EMAIL} = "admin\@company.com"
	$notification{EMAIL_FROM} = "ToolName\@hostname";
	$notification{MESSAGE} = "Simple message";

	if(notify(\%notification) == $SUCCESS) {
		# true
		# notify admin | user
	} else {
		# false
		# return $NOT_SUCCESS
		# or
		# exit 128
	}

=head1 DESCRIPTION

Sending notification to administrator by email

=head2 EXPORT

notify - Success 0, else 1.

=head1 AUTHOR

Vladimir Roncevic, E<lt>vladimir.roncevic@frobas.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by www.frobas.com

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
