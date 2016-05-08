package Cfg::Parser;
#
# @brief    Load and parse configuration from file
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
use Status::Error qw(error);
use Status::Info qw(info);
use Exporter qw(import);
our @EXPORT_OK = qw(readpref);

#
# @brief   Load and parse configuration from file
# @params  Values required path to file and configuration
# @retval  Success 0, else 1
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# my %preferences;
# my $preferences_ref = \%preferences;
# my $cfg = dirname(dirname(abs_path($0))) . "/conf/toolname.cfg";
# my $status = readpref($cfg, $preferences_ref);
#
# if ($status == $Status::Constants::SUCCESS) {
#	# true
# } else {
#	# false
# }
#
sub readpref {
    my $filename = $_[0];
    my $fh;
    my $fcaller = (caller(0))[3];
    my $msg = "Checking confgiuration file";
    info($fcaller, $msg);
    if(-e $filename) {
        unless(open($fh, "<", $filename)) {
            $msg = "Faild to open confgiuration file\n$filename";
            error($fcaller, $msg);
            return ($Status::Constants::NOT_SUCCESS);
        }
        while(my $line = <$fh>) {
            chomp($line);
            if (!($line =~ /^$/)) {
                my ($field, $value) = split(/\s*=\s*/, $line);
                ${$_[1]}{$field} = $value;
            }
        }
        $msg = "Loaded confgiuration file";
        info($fcaller, $msg);
        return ($Status::Constants::SUCCESS);
    }
    $msg = "Check confgiuration file\n$filename";
    error($fcaller, $msg);
    return ($Status::Constants::NOT_SUCCESS);
}

1;
__END__
