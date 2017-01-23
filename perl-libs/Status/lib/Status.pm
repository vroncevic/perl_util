package Status;
#
# @brief    Status constants
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
our @EXPORT_OK = ($EXPORT_TAGS{all} );
our @EXPORT = qw( $SUCCESS $NOT_SUCCESS );
our $VERSION = '1.0';

our $SUCCESS = 0;
our $NOT_SUCCESS = 1;

1;
__END__

=head1 NAME

Status - Perl extension for status constants

=head1 SYNOPSIS

	use Status;
	...
	if($status == $NOT_SUCCESS) {
		exit(130);
	}

=head1 DESCRIPTION

Status constants for return states, or for condition statemnts

=head2 EXPORT

None by default.

=head1 AUTHOR

Vladimir Roncevic, E<lt>vladimir.roncevic@frobas.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by Vladimir Roncevic

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
