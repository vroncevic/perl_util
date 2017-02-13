package Status;
#
# @brief    Status constants for checking status
# @version  ver.1.0
# @date     Thu Jun 16 13:17:32 2016
# @company  Frobas IT Department, www.frobas.com 2016
# @author   Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
use strict;
use warnings;
use Exporter;
our @ISA = qw(Exporter);
our %EXPORT_TAGS = ('all' => [qw()]);
our @EXPORT_OK = (@{$EXPORT_TAGS{'all'}});
our @EXPORT = qw($SUCCESS $NOT_SUCCESS);
our $VERSION = '1.0';
our $TOOL_DBG = "false";

our $SUCCESS = 0;
our $NOT_SUCCESS = 1;

1;
__END__

=head1 NAME

Status - Status constants for checking status

=head1 SYNOPSIS

	use Status;

	...

	if($status == $NOT_SUCCESS) {
		exit(130);
	}

=head1 DESCRIPTION

Status constants for return states, or for condition statemnts.

=head2 EXPORT

SUCCESS and NOT_SUCCESS constants.

=head1 AUTHOR

Vladimir Roncevic, E<lt>vladimir.roncevic@frobas.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by www.frobas.com

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
