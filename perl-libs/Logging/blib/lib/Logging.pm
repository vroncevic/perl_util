package Logging;
#
# @brief    Write log message to App/Tool/Script log file
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
our @EXPORT = qw(logging);
our $VERSION = '1.0';
our $SUCCESS = 0;
our $NOT_SUCCESS = 1;

#
# @brief   Write log message to App/Tool/Script log file
# @params  Values required log-hash structure
# @retval  Success 0, else 1
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 
# my %log;
# my $log_ref=\%log;
# $log{LOG_FILE_PATH}="/opt/toolname/toolname.log"
# $log{LOG_MESSAGE}="Started toolname";
# my $status = logging($log_ref);
#
# if ($status == $SUCCESS) {
#	# true
# } else {
#	# false
# }
#
sub logging {
    if($_[0]) {
        my $time = localtime(); 
        my $host = hostname();
        my $fcaller = (caller(0))[3];
        my $msg = "Checking log file";
        print("[Info] " . $fcaller . " " . $msg . "\n");
        unless(open(LOG_FILE, ">>${$_[0]}{LOG_FILE_PATH}")) {
            $msg = "Faild to open log file\n${$_[0]}{LOG_FILE_PATH}";
            print("[Error] " . $fcaller . " " . $msg . "\n");
            return ($NOT_SUCCESS);
        }
        print(LOG_FILE "[$time] ${$_[0]}{LOG_MESSAGE} [host: $host]\n");
        close(LOG_FILE);
        return ($SUCCESS);
    }
    my $fcaller = (caller(0))[3];
    my $msg = "Check log-hash structure";
    print("[Error] " . $fcaller . " " . $msg . "\n");
    return ($NOT_SUCCESS);
}

1;
__END__

=head1 NAME

Logging - Perl extension for write log message to App/Tool/Script log file

=head1 SYNOPSIS

  use Logging;

  my %log;
  my $log_ref=\%log;
  $log{LOG_FILE_PATH}="/opt/toolname/toolname.log"
  $log{LOG_MESSAGE}="Started toolname";
  my $status = logging($log_ref);
 
  if ($status == $Status::Constants::SUCCESS) {
 	# true
  } else {
 	# false
  }

=head1 DESCRIPTION

Write log message to App/Tool/Script log file

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
