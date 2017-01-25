package Configuration;
#
# @brief    Load and parse configuration from CFG file
# @version  ver.1.0
# @date     Mon Sep 12 22:48:32 2015
# @company  Frobas IT Department, www.frobas.com 2015
# @author   Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
use strict;
use warnings;
use Exporter;
use Cwd qw(abs_path);
use File::Basename qw(dirname);
use lib dirname(dirname(abs_path($0))) . '/lib/perl5';
use InfoDebugMessage qw(info_debug_message);
use ErrorMessage qw(error_message);
use Utils qw(def);
use Status;
our @ISA = qw(Exporter);
our %EXPORT_TAGS = ('all' => [qw()]);
our @EXPORT_OK = (@{$EXPORT_TAGS{'all'}});
our @EXPORT = qw(read_preference);
our $VERSION = '1.0';
our $TOOL_DBG="false";

#
# @brief   Load and parse configuration from CFG file
# @params  Values required
# 			cfg file path		  - path to configuration CFG file
# 			preference structure  - configuration hash structure
# @retval  Success 0, else 1
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# use Configuration qw(read_preference);
# Status;
# 
# my %preferences;
# my $cfg = dirname(dirname(abs_path($0))) . "/conf/toolname.cfg";
#
# if(read_preference($cfg, \%preferences) == $SUCCESS) {
#	# true
#	# notify admin | user
# } else {
#	# false
#	# return $NOT_SUCCESS
#	# or
#	# exit 128
# }
#
sub read_preference {
	my ($cfgPath, $pref) = ($_[0], $_[1]);
	my $msg = "None";
	if(def($cfgPath) == $SUCCESS) {
		$msg = "Checking CFG file [$cfgPath]";
		info_debug_message($msg);
		if(-e "$cfgPath") {
			unless(open(CONFIG_FILE, "<", $cfgPath)) {
				$msg = "Failed to open CFG file [$cfgPath]";
				error_message($msg);
				return ($NOT_SUCCESS);
			}
			my ($line, $key, $value);
			while($line = <CONFIG_FILE>) {
				chomp($line);
				if(!($line =~ /^$/)) {
					($key, $value) = split(/\s*=\s*/, $line);
					$$pref{$key} = $value;
				}
			}
			$msg = "Loaded CFG file [$cfgPath]";
			info_debug_message($msg);
			close(CONFIG_FILE);
			return ($SUCCESS);
		}
		$msg = "Check CFG file [$cfgPath]";
		error_message($msg);
		return ($NOT_SUCCESS);
	}
	$msg = "Missing argument [CONFIGURATION_FILE]";
	error_message($msg);
	return ($NOT_SUCCESS);
}

1;
__END__

=head1 NAME

Configuration - Load and parse configuration from CFG file

=head1 SYNOPSIS

	use Configuration qw(read_preference);
	Status;

	my %preferences;
	my $cfg = dirname(dirname(abs_path($0))) . "/conf/toolname.cfg";

	if(read_preference($cfg, \%preferences) == $SUCCESS) {
		# true
		# notify admin | user
	} else {
		# false
		# return $NOT_SUCCESS
		# or
		# exit 128
	}

=head1 DESCRIPTION

Load and parse configuration from CFG file

=head2 EXPORT

read_preference - Success 0, else 1.

=head1 AUTHOR

Vladimir Roncevic, E<lt>vladimir.roncevic@frobas.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by www.frobas.com

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
