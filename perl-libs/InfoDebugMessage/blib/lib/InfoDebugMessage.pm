package InfoDebugMessage;
#
# @brief    Print info debug message in parent function
# @version  ver.1.0
# @date     Sun Jan 22 23:46:31 CET 2017
# @company  None, free software to use 2017
# @author   Vladimir Roncevic <elektron.ronca@gmail.com>
#
use warnings FATAL => 'all';
use strict;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
$VERSION = '1.0';
@ISA = qw(Exporter);
@EXPORT = qw();
%EXPORT_TAGS = ('all' => [qw(info_debug_message)]);
@EXPORT_OK = (@{$EXPORT_TAGS{'all'}});

use lib '/usr/local/perl/lib/perl5';
use ErrorMessage qw(error_message);
use Utils qw(def);
use Status qw(:all);
our $TOOL_DBG = "false";

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
# my $msg = "Some message";
# info_debug_message($msg);
#

sub info_debug_message {
	my $message = $_[0];
	if(def($message)) {
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

InfoDebugMessage - Print info debug message in parent function.

=head1 SYNOPSIS

	use InfoDebugMessage qw(info_debug_message);

	...

	my $msg = "Some message";
	info_debug_message($msg);

=head1 DESCRIPTION

Print info debug message in parent function.

=head2 EXPORT

info_debug_message - Print info debug message in parent function.

=head1 AUTHOR

Vladimir Roncevic, E<lt>elektron.ronca@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2017 by https://github.com/vroncevic/perl_util

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
