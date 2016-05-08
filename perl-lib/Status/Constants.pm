package Status::Constants;
#
# @brief    Return statuses (constants)
# @version  ver.1.0
# @date     Mon Sep 12 22:48:32 2015
# @company  Frobas IT Department, www.frobas.com 2015
# @author   Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
use strict;
use warnings;
use File::Basename qw(dirname);
use Cwd qw(abs_path);
use lib dirname(dirname(abs_path($0))) . '/../perl-lib';
use Exporter qw(import);

our $SUCCESS    = 0;
our $NOT_SUCCES = 1;

1;
__END__
