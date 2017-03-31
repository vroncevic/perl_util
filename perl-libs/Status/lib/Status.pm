package Status;
#
# @brief    Status constants for checking status
# @version  ver.1.0
# @date     Thu Jun 16 13:17:32 2016
# @company  Frobas IT Department, www.frobas.com 2016
# @author   Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
use strict;
use warnings FATAL => 'all';
use strict;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
$VERSION = '1.0';
@ISA = qw(Exporter);
@EXPORT = qw();
%EXPORT_TAGS = ('all' => [qw(SUCCESS NOT_SUCCESS)]);
@EXPORT_OK = (@{$EXPORT_TAGS{'all'}});

use constant SUCCESS => 1;
use constant NOT_SUCCESS => 0;

1;
__END__

=head1 NAME

Status - Status constants for checking status

=head1 SYNOPSIS

	use Status qw(SUCCESS NOT_SUCCESS);

	...

	my $status = NOT_SUCCESS;

	if($status == NOT_SUCCESS) {
		exit(130);
	}

	if(SUCCESS) {
		# True
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
