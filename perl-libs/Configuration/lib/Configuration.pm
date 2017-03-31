package Configuration;
#
# @brief    Load and parse configuration from file
# @version  ver.1.0
# @date     Mon Sep 12 22:48:32 2015
# @company  Frobas IT Department, www.frobas.com 2015
# @author   Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
use warnings FATAL => 'all';
use strict;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter);
$VERSION = '1.0';
@EXPORT = qw();
%EXPORT_TAGS = ('all' => [qw(read_preference)]);
@EXPORT_OK = (@{$EXPORT_TAGS{'all'}});

use lib '/usr/local/perl/lib/perl5';
use InfoDebugMessage qw(info_debug_message);
use ErrorMessage qw(error_message);
use Utils qw(def);
use Status qw(SUCCESS NOT_SUCCESS);

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
# use Status;
# 
# my %preferences;
# my $cfg = dirname(dirname(abs_path(__FILE__))) . "/conf/toolname.cfg";
#
# if(read_preference($cfg, \%preferences)) {
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
	if(def($cfgPath)) {
		$msg = "Load and parse configuration from CFG file";
		info_debug_message($msg);
		$msg = "Checking CFG file [$cfgPath]";
		info_debug_message($msg);
		if(-e "$cfgPath") {
			my $fh;
			if(not open($fh, "<", $cfgPath)) {
				$msg = "Failed to open file [$cfgPath]";
				error_message($msg);
				return (NOT_SUCCESS);
			}
			my ($line, $key, $value);
			while($line = <$fh>) {
				chomp($line);
				if(!($line =~ /^$/)) {
					($key, $value) = split(/\s*=\s*/, $line);
					$$pref{$key} = $value;
				}
			}
			$msg = "Loaded file [$cfgPath]";
			info_debug_message($msg);
			close($fh);
			return (SUCCESS);
		}
		$msg = "Check file [$cfgPath]";
		error_message($msg);
		return (NOT_SUCCESS);
	}
	$msg = "Missing argument [CONFIGURATION_FILE]";
	error_message($msg);
	return (NOT_SUCCESS);
}

1;
__END__

=head1 NAME

Configuration - Load and parse configuration from file

=head1 SYNOPSIS

	use Configuration qw(read_preference);
	Status;

	my %preferences;
	my $cfg = dirname(dirname(abs_path(__FILE__))) . "/conf/toolname.cfg";

	if(read_preference($cfg, \%preferences)) {
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

read_preference - Success 0, else 1.

=head1 AUTHOR

Vladimir Roncevic, E<lt>vladimir.roncevic@frobas.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by www.frobas.com

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
