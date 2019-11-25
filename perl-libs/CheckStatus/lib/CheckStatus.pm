package CheckStatus;
#
# @brief    Checking status hash structure
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
%EXPORT_TAGS = ('all' => [qw(check_status)]);
@EXPORT_OK = (@{$EXPORT_TAGS{'all'}});

use lib '/usr/local/perl/lib/perl5';
use InfoDebugMessage qw(info_debug_message);
use ErrorMessage qw(error_message);
use Status qw(:all);

#
# @brief   Checking status [hash structure]
# @param   Value required status hash structure
# @retval  Success 1, else 0
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#
# use CheckStatus qw(check_status);
# use Status qw(:all);
#
# ...
#
# if(check_status(\%status)) {
#    # true
#    # notify admin | user
# } else {
#    # false
#    # return NOT_SUCCESS
#    # or
#    # exit 128
# }
#
sub check_status {
    my %status = %{$_[0]};
    my $msg = "None";
    if(%status) {
        $msg = "Checking status [hash structure]";
        info_debug_message($msg);
        foreach my $key (keys(%status)) {
            if($status{$key} == NOT_SUCCESS) {
                return (NOT_SUCCESS);
            }
        }
        $msg = "Done";
        info_debug_message($msg);
        return (SUCCESS);
    }
    $msg = "Missing argument [STATUS_STRUCTURE]";
    error_message($msg);
    return (NOT_SUCCESS);
}

1;
__END__

=head1 NAME

CheckStatus - Checking statuses collected in hash structure.

=head1 SYNOPSIS

    use CheckStatus qw(check_status);
    use Status qw(:all);

    ...

    if(check_status(\%status)) {
        # true
        # notify admin | user
    } else {
        # false
        # return NOT_SUCCESS
        # or
        # exit 128
    }

=head1 DESCRIPTION

check_status - check elements of hash structure.

=head2 EXPORT

check_status - for success return 1, else 0.

=head1 AUTHOR

Vladimir Roncevic, E<lt>elektron.ronca@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by https://github.com/vroncevic/perl_util

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
