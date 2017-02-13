package ErrorMessage;
#
# @brief    Print error message in parent function
# @version  ver.1.0
# @date     Sun Jan 22 23:46:31 CET 2017
# @company  None, free software to use 2017
# @author   Vladimir Roncevic <elektron.ronca@gmail.com>
#
use strict;
use warnings;
use Exporter;
use lib '/root/scripts/lib/perl5';
use Utils qw(def);
use Status;
our @ISA = qw(Exporter);
our %EXPORT_TAGS = ('all' => [qw()]);
our @EXPORT_OK = (@{$EXPORT_TAGS{'all'}});
our @EXPORT = qw(error_message);
our $VERSION = '1.0';
our $TOOL_DBG = "false";

#
# @brief   Print error message in parent function
# @param   Value required error message
# @retval  None
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# use ErrorMessage qw(error_message);
# 
# ...
# 
# error_message($msg);
#

sub error_message {
	my $message = $_[0];
	if(def($message) == $SUCCESS) {
		my $fCallerParent = (caller(1))[3];
		print("[Error] " . $fCallerParent . " " . $message . "\n");
	} else {
		my $fCaller = (caller(0))[3];
		my $msg = "Missing argument [MESSAGE_TEXT]";
		print("[Error] " . $fCaller . " " . $msg . "\n");
	}
}

1;
__END__

=head1 NAME

ErrorMessage - Print error message in parent function

=head1 SYNOPSIS

	use ErrorMessage qw(error_message);

	...

	error_message($msg);

=head1 DESCRIPTION

Print error message in parent function

=head2 EXPORT

error_message - print error message in parent function.

=head1 AUTHOR

Vladimir Roncevic, E<lt>elektron.ronca@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2017 by https://github.com/vroncevic/perl_util

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
