package Configuration;
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
use lib dirname(dirname(abs_path($0))) . '/../../lib/perl5';
use Status;
require Exporter;
our @ISA = qw(Exporter);
our %EXPORT_TAGS = ('all' => [qw()]);
our @EXPORT_OK = (@{$EXPORT_TAGS{'all'}});
our @EXPORT = qw(readpref);
our $VERSION = '1.0';
our $TOOL_DBG="false";

#
# @brief   Load and parse configuration from file
# @params  Values required path to file and configuration
# @retval  Success 0, else 1
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# use Configuration;
# use Status;
# 
# my %preferences;
# my $cfg = dirname(dirname(abs_path($0))) . "/conf/toolname.cfg";
#
# if(readpref($cfg, \%preferences) == $SUCCESS) {
#	# true
#	# notify admin | user
# } else {
#	# false
#	# return $NOT_SUCCESS
#	# or
#	# exit 128
# }
#
sub readpref {
	my $filename = $_[0];
	my $pref = $_[1];
	my $fCaller = (caller(0))[3];
	my $msg = "None";
	if(defined($filename)) {
		$msg = "Checking config file [$filename]";
		if("$TOOL_DBG" eq "true") {
			print("[Info] " . $fCaller . " " . $msg . "\n");
		}
		if(-e "$filename") {
			unless(open(CONFIG_FILE, "<", $filename)) {
				$msg = "Failed to open configuration file [$filename]";
				print("[Error] " . $fCaller . " " . $msg . "\n");
				return ($NOT_SUCCESS);
			}
			while(my $line = <CONFIG_FILE>) {
				chomp($line);
				if(!($line =~ /^$/)) {
					my ($field, $value) = split(/\s*=\s*/, $line);
					$$pref{$field} = $value;
				}
			}
			$msg = "Loaded config file [$filename]";
			if("$TOOL_DBG" eq "true") {
				print("[Info] " . $fCaller . " " . $msg . "\n");
			}
			close(CONFIG_FILE);
			return ($SUCCESS);
		}
		$msg = "Check configuration file [$filename]";
		print("[Error] " . $fCaller . " " . $msg . "\n");
		return ($NOT_SUCCESS);
	}
	$msg = "Check argument [CONFIGURATION_FILE]";
	print("[Error] " . $fCaller . " " . $msg . "\n");
	return ($NOT_SUCCESS);
}

1;
__END__

=head1 NAME

Configuration - Perl extension for load and parse configuration from file

=head1 SYNOPSIS

	use Configuration;
	use Status;

	my %preferences;
	my $cfg = dirname(dirname(abs_path($0))) . "/conf/toolname.cfg";

	if(readpref($cfg, \%preferences) == $SUCCESS) {
	# true
	# notify admin | user
	} else {
	# false
	# return $NOT_SUCCESS
	# or
	# exit 128
	}

=head1 DESCRIPTION

Load and parse configuration from file

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
