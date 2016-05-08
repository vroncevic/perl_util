package Status::Error;
#
# @brief    Print error message 
# @version  ver.1.0
# @date     Mon Sep 12 22:48:32 2015
# @company  Frobas IT Department, www.frobas.com 2015
# @author   Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
use strict;
use warnings;
use File::Basename qw(dirname);
use Cwd qw(abs_path);
use lib dirname(dirname(abs_path($0))) . '/../perl-lib';
use Status::Constants;
use Exporter qw(import);
our @EXPORT_OK = qw(error);

#
# @brief   Print error message with function name 
# @params  Values required function caller and error message
# @retval  Success 0, else 1
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# my $msg = "Missing file";
# my $caller = "ToolName::Main";
# my $status = error($caller, $msg);
#
# if ($status == $Status::Constants::SUCCESS) {
#	# true
# } else {
#	# false
# }
#
sub error {
    my $subcaller  = shift();
    my $submessage = shift();
	my $missing_args = " mising argument(s) [SUBCALLER] and [SUBMESSAGE]\n";
    if((defined($subcaller)) && (defined($submessage))) {
        print("[Error] " . $$subcaller . " " . $$submessage . "\n");
		return ($Status::Constants::SUCCESS);
    }
    print("[Error] " . (caller(0))[3] . $missing_args);
	return ($Status::Constants::NOT_SUCCESS);    	
}

1;
__END__
