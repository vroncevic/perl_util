package Notification;
#
# @brief    Sending notification to administrator by email
# @version  ver.1.0
# @date     Sun Sep 13 11:15:32 2015
# @company  Frobas IT Department, www.frobas.com 2015
# @author   Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
use 5.018002;
use strict;
use warnings;
use Sys::Hostname;
use Mail::Sendmail;
require Exporter;
our @ISA = qw(Exporter);
our %EXPORT_TAGS = ('all' => [qw()]);
our @EXPORT_OK = (@{$EXPORT_TAGS{'all'}});
our @EXPORT = qw();
our $VERSION = '1.0';
our $SUCCESS = 0;
our $NOT_SUCCESS = 1;

#
# @brief   Sending notification to administrator by email
# @params  Values required notification-hash structure
# @retval  Success 0, else 1
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# my %notification;
# my $notification_ref=\%notification;
# $notification{ADMIN_EMAIL}="admin\@company.com"
# $notification{EMAIL_FROM}="ToolName\@hostname";
# my $status = notify($notification_ref);
#
# if ($status == $SUCCESS) {
#	# true
# } else {
#	# false
# }
#
sub notify {
	my $fcaller = (caller(0))[3];
    if($_[0]) {
        my $time = localtime();
        my $host = hostname();
        my $subject = "[NOTIFICATION] Workstation ".$host;
        my $body    = "[$time] " . ${$_[0]}{MESSAGE} . " [host: $host]\n";
        my %mail = (
            To      => ${$_[0]}{ADMIN_EMAIL},
            From    => ${$_[0]}{EMAIL_FROM},
            Subject => $subject,
            Message => $body
        );
        if(sendmail(%mail)) {
            my $msg = "Sent email to administrator";
            print("[Info] " . $fcaller . " " . $msg . "\n");
            return ($SUCCESS);
        }
        my $msg = "Check sendmail configuration";
        print("[Error] " . $fcaller . " " . $msg . "\n");
        return ($NOT_SUCCESS);
    }
    my $msg = "Check notification-hash structure";
    print("[Error] " . $fcaller . " " . $msg . "\n");
    return ($NOT_SUCCESS);
}

1;
__END__

=head1 NAME

Notification - Perl extension for sending notification to admin by email

=head1 SYNOPSIS

  use Notification;

  my %notification;
  my $notification_ref=\%notification;
  $notification{ADMIN_EMAIL}="admin\@company.com"
  $notification{EMAIL_FROM}="ToolName\@hostname";
  my $status = notify($notification_ref);
 
  if ($status == $SUCCESS) {
 	# true
  } else {
 	# false
  }

=head1 DESCRIPTION

Sending notification to administrator by email

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
