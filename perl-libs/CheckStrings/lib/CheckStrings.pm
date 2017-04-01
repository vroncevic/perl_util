package CheckStrings;
#
# @brief    Check strings collected in hash structure
# @version  ver.1.0
# @date     Mon Feb 13 15:36:07 CET 2017
# @company  Free software to use 2017
# @author   Vladimir Roncevic <elektron.ronca@gmail.com>
#
use warnings FATAL => 'all';
use strict;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
$VERSION = '1.0';
@ISA = qw(Exporter);
@EXPORT = qw();
%EXPORT_TAGS = ('all' => [qw(check_strings)]);
@EXPORT_OK = (@{$EXPORT_TAGS{'all'}});

use lib '/usr/local/perl/lib/perl5';
use InfoDebugMessage qw(info_debug_message);
use ErrorMessage qw(error_message);
use Status qw(:all);

#
# @brief   Checking strings [hash structure]
# @param   Value required string hash structure
# @retval  Success 1, else 0
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# use CheckStrings qw(check_strings);
# use Status qw(:all);
#
# ...
#
# if(check_strings(\%strings)) {
#	# true
#	# notify admin | user
# } else {
#	# false
#	# return $NOT_SUCCESS
#	# or
#	# exit 128
# }
#
sub check_strings {
	my %strings = %{$_[0]};
	my $msg = "None";
	if(%strings) {
		$msg = "Checking strings [hash structure]";
		info_debug_message($msg);
		foreach my $key (keys(%strings)) {
			if("$strings{$key}" eq "None") {
				return (NOT_SUCCESS);
			}
		}
		$msg = "Done";
		info_debug_message($msg);
		return (SUCCESS);
	}
	$msg = "Missing argument [STRING_STRUCTURE]";
	error_message($msg);
	return (NOT_SUCCESS);
}

1;
__END__

=head1 NAME

CheckStrings - If one string from hash structure contain None string return 1

=head1 SYNOPSIS

	use CheckStrings qw(check_strings);
	use Status qw(:all);

	...

	if(check_strings(\%struct)) {
		# True
	}

=head1 DESCRIPTION

Status constants for return states, or for condition statemnts.

=head2 EXPORT

check_strings - return 1 if strings are ne to None, else return 0.

=head1 AUTHOR

Vladimir Roncevic, E<lt>elektron.ronca@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by https://github.com/vroncevic/perl_util

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
