package Notification;
#
# @brief    Sending notification to administrator by email
# @version  ver.1.0
# @date     Sun Sep 13 11:15:32 2015
# @company  Frobas IT Department, www.frobas.com 2015
# @author   Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
use warnings FATAL => 'all';
use strict;
use Exporter;
use Sys::Hostname;
use Mail::Sendmail;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter);
$VERSION = '1.0';
@EXPORT = qw();
%EXPORT_TAGS = ('all' => [qw(notify)]);
@EXPORT_OK = (@{$EXPORT_TAGS{'all'}});

use lib '/usr/local/perl/lib/perl5';
use InfoDebugMessage qw(info_debug_message);
use ErrorMessage qw(error_message);
use Utils qw(def);
use Status qw(:all);

#
# @brief   Sending notification to administrator by email
# @param   Value required notification hash
# @retval  Success 1, else 0
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# use Notification qw(notify);
# use Status qw(:all);
# 
# my %notification;
# $notification{ADMIN_EMAIL} = "admin\@company.com"
# $notification{EMAIL_FROM} = "ToolName\@hostname";
# $notification{MESSAGE} = "Simple message";
#
# if(notify(\%notification)) {
#    # true
#    # notify admin | user
# } else {
#    # false
#    # return NOT_SUCCESS
#    # or
#    # exit 128
# }
#
sub notify {
    my $nref = $_[0];
    my $msg = "None";
    if(def($nref)) {
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
            return (SUCCESS);
        }
        $msg = "Check sendmail configuration";
        error_message($msg);
        return (NOT_SUCCESS);
    }
    $msg = "Missing argument [NOTIFICATION_STRUCTURE]";
    error_message($msg);
    return (NOT_SUCCESS);
}

1;
__END__

=head1 NAME

Notification - Sending notification to administrator by email.

=head1 SYNOPSIS

    use Notification qw(notify);
    use Status qw(:all);

    my %notification;
    $notification{ADMIN_EMAIL} = "admin\@company.com"
    $notification{EMAIL_FROM} = "ToolName\@hostname";
    $notification{MESSAGE} = "Simple message";

    if(notify(\%notification)) {
        # true
        # notify admin | user
    } else {
        # false
        # return NOT_SUCCESS
        # or
        # exit 128
    }

=head1 DESCRIPTION

Sending notification to administrator by email.

=head2 EXPORT

notify - Success return 1, else return 0.

=head1 AUTHOR

Vladimir Roncevic, E<lt>vladimir.roncevic@frobas.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by www.frobas.com

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
