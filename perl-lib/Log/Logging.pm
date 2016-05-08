package Log::Logging;
#
# @brief    Write log nessage to App/Tool/Script log file
# @version  ver.1.0
# @date     Mon Sep 12 22:48:32 2015
# @company  Frobas IT Department, www.frobas.com 2015
# @author   Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
use strict;
use warnings;
use Sys::Hostname;
use File::Basename qw(dirname);
use Cwd qw(abs_path);
use lib dirname(dirname(abs_path($0))) . '/../perl-lib';
use Status::Constants;
use Status::Info qw(info);
use Status::Error qw(error);
use Exporter qw(import);
our @EXPORT_OK = qw(logging);

#
# @brief   Write log nessage to App/Tool/Script log file
# @params  Values required log-hash structure
# @retval  Success 0, else 1
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# my %log;
# my $log_ref=\%log;
# $log{LOG_FILE_PATH}="/opt/toolname/toolname.log"
# $log{LOG_MESSAGE}="Started toolname";
# my $status = logging($log_ref);
#
# if ($status == $Status::Constants::SUCCESS) {
#	# true
# } else {
#	# false
# }
#
sub logging {
    if($_[0]) {
        my $time = localtime(); 
        my $host = hostname();
        my $fcaller = (caller(0))[3];
        my $msg = "Checking log file";
        info($fcaller, $msg);
        unless(open(LOG_FILE, ">>${$_[0]}{LOG_FILE_PATH}")) {
            $msg = "faild to open log file\n${$_[0]}{LOG_FILE_PATH}";
            error($fcaller, $msg);
            return ($Status::Constants::NOT_SUCCESS);
        }
        print(LOG_FILE "[$time] ${$_[0]}{LOG_MESSAGE} [host: $host]\n");
        close(LOG_FILE);
        return ($Status::Constants::SUCCESS);
    }
    my $fcaller = (caller(0))[3];
    my $msg = "Check log-hash structure";
    error($fcaller, $msg);
    return ($Status::Constants::NOT_SUCCESS);
}

1;
__END__
