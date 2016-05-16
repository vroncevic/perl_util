package Configuration;
#
# @brief    Load and parse configuration from file
# @version  ver.1.0
# @date     Mon Sep 12 22:48:32 2015
# @company  Frobas IT Department, www.frobas.com 2015
# @author   Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
use 5.018002;
use strict;
use warnings;
use Sys::Hostname;
require Exporter;
our @ISA = qw(Exporter);
our %EXPORT_TAGS = ('all' => [qw()]);
our @EXPORT_OK = (@{$EXPORT_TAGS{'all'}});
our @EXPORT = qw(readpref);
our $VERSION = '1.0';
our $SUCCESS = 0;
our $NOT_SUCCESS = 1;

#
# @brief   Load and parse configuration from file
# @params  Values required path to file and configuration
# @retval  Success 0, else 1
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# my %preferences;
# my $preferences_ref = \%preferences;
# my $cfg = dirname(dirname(abs_path($0))) . "/conf/toolname.cfg";
# my $status = readpref($cfg, $preferences_ref);
#
# if ($status == $SUCCESS) {
#	# true
# } else {
#	# false
# }
#
sub readpref {
    my $filename = $_[0];
    my $fh;
    my $fcaller = (caller(0))[3];
    my $msg = "Checking confgiuration file";
    print("[Info] " . $fcaller . " " . $msg . "\n");
    if(-e $filename) {
        unless(open($fh, "<", $filename)) {
            $msg = "Faild to open confgiuration file\n$filename";
            print("[Error] " . $fcaller . " " . $msg . "\n");
            return ($NOT_SUCCESS);
        }
        while(my $line = <$fh>) {
            chomp($line);
            if (!($line =~ /^$/)) {
                my ($field, $value) = split(/\s*=\s*/, $line);
                ${$_[1]}{$field} = $value;
            }
        }
        $msg = "Loaded confgiuration file";
        print("[Info] " . $fcaller . " " . $msg . "\n");
        return ($SUCCESS);
    }
    $msg = "Check confgiuration file\n$filename";
    print("[Error] " . $fcaller . " " . $msg . "\n");
    return ($NOT_SUCCESS);
}

1;
__END__

=head1 NAME

Configuration - Perl extension for load and parse configuration from file

=head1 SYNOPSIS

  use Configuration;

  my %preferences;
  my $preferences_ref = \%preferences;
  my $cfg = dirname(dirname(abs_path($0))) . "/conf/toolname.cfg";
  my $status = readpref($cfg, $preferences_ref);

  if ($status == $SUCCESS) {
	# true
  } else {
	# false
  }

=head1 DESCRIPTION

Load and parse configuration from file

=head2 EXPORT

None by default.

=head1 AUTHOR

Vladimir Roncevic, E<lt>vladimir.roncevic@frobas.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by www.frobas.com 

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
