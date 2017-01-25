package InfoDebugMessage;
#
# @brief    Print info debug message in parent function
# @version  ver.1.0
# @date     Sun Jan 22 23:46:31 CET 2017
# @company  None, free software to use 2017
# @author   Vladimir Roncevic <elektron.ronca@gmail.com>
#
use strict;
use warnings;
use Exporter;
use Cwd qw(abs_path);
use File::Basename qw(dirname);
use lib dirname(dirname(abs_path($0))) . '/../../lib/perl5';
use Status qw($SUCCESS $NOT_SUCCESS check_status);
use ErrorMessage qw(error_message);
use Utils qw(def);
our @ISA = qw(Exporter);
our %EXPORT_TAGS = ('all' => [qw()]);
our @EXPORT_OK = (@{$EXPORT_TAGS{'all'}});
our @EXPORT = qw(info_debug_message);
our $VERSION = '1.0';
our $TOOL_DBG="false";

#
# @brief   Print info debug message in parent function
# @param   Value required info debug message
# @retval  None
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# use InfoDebugMessage qw(info_debug_message);
# 
# ...
# 
# info_debug_message($msg);
#

sub info_debug_message {
	my $message = $_[0];
	if(def($message) == $SUCCESS) {
		my $fCallerParent = (caller(1))[3];
		if("$TOOL_DBG" eq "true") {
			print("[Info] " . $fCallerParent . " " . $message . "\n");
		}
	} else {
		my $msg = "Missing argument [MESSAGE_TEXT]";
		error_message($msg);
	}
}

1;
__END__

=head1 NAME

InfoDebugMessage - Print info debug message in parent function

=head1 SYNOPSIS

	use InfoDebugMessage qw(info_debug_message);

	...

	info_debug_message($msg);

=head1 DESCRIPTION

Print info debug message in parent function

=head2 EXPORT

info_debug_message - None.

=head1 AUTHOR

Vladimir Roncevic, E<lt>elektron.ronca@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2017 by https://github.com/vroncevic/perl-util

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
