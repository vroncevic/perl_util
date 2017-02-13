package InfoMessage;
#
# @brief    Print info message in parent function
# @version  ver.1.0
# @date     Sun Jan 22 23:46:31 CET 2017
# @company  None, free software to use 2017
# @author   Vladimir Roncevic <elektron.ronca@gmail.com>
#
use strict;
use warnings;
use Exporter;
use lib '/root/scripts/lib/perl5';
use ErrorMessage qw(error_message);
use Utils qw(def);
use Status;
our @ISA = qw(Exporter);
our %EXPORT_TAGS = ('all' => [qw()]);
our @EXPORT_OK = (@{$EXPORT_TAGS{'all'}});
our @EXPORT = qw(info_message);
our $VERSION = '1.0';
our $TOOL_DBG = "false";

#
# @brief   Print info message in parent function
# @param   Value required info message
# @retval  None
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# use InfoMessage qw(info_message);
# 
# ...
# 
# info_message($message);
#

sub info_message {
	my $message = $_[0];
	if(def($message) == $SUCCESS) {
		print("[Info] " . $message . "\n");
	} else {
		my $msg = "Missing argument [MESSAGE_TEXT]";
		error_message($msg);
	}
}

1;
__END__

=head1 NAME

InfoMessage - Print info message in parent function

=head1 SYNOPSIS

	use InfoMessage qw(info_message);

	...

	info_message($message);

=head1 DESCRIPTION

Print info message in parent function

=head2 EXPORT

info_message - None.

=head1 AUTHOR

Vladimir Roncevic, E<lt>elektron.ronca@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2017 by https://github.com/vroncevic/perl-util

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
