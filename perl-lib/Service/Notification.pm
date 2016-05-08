package Service::Notification;
#
# @brief    Sending notification to administrator by email
# @version  ver.1.0
# @date     Sun Sep 13 11:15:32 2015
# @company  Frobas IT Department, www.frobas.com 2015
# @author   Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
use strict;
use warnings;
use Sys::Hostname;
use Mail::Sendmail;
use File::Basename qw(dirname);
use Cwd qw(abs_path);
use lib dirname(dirname(abs_path($0))) . '/../perl-lib';
use Status::Constants;
use Status::Info qw(info);
use Status::Error qw(error);
use Exporter qw(import);
our @EXPORT_OK = qw(notify);

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
# if ($status == $Status::Constants::SUCCESS) {
#	# true
# } else {
#	# false
# }
#
sub notify {
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
            my $fcaller = (caller(0))[3];
            my $msg = "Sent email to administrator";
            info($fcaller, $msg);
            return ($Status::Constants::SUCCESS);
        }
        my $fcaller = (caller(0))[3];
        my $msg = "Check sendmail configuration";
        error($fcaller, $msg);
        return ($Status::Constants::NOT_SUCCESS);
    }
    my $fcaller = (caller(0))[3];
    my $msg = "Check notification-hash structure";
    error($fcaller, $msg);
    return ($Status::Constants::NOT_SUCCESS);
}

1;
__END__
