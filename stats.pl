#!/usr/bin/perl
# -*- encoding: utf-8; tab-width: 8 -*-
use strict;
use warnings;
use utf8;
use Carp;
use English '-no_match_vars';
use Data::Printer;
use List::Util qw/sum/;
use 5.14.0;

use version; our $VERSION = qv('1.0.0');

open my $fh, q{<}, "result.log" or die "result.log: $OS_ERROR";

my %measurements;

while (<$fh>) {
    chomp;
    my ($params, $speed) = split /\s+/;
    push @{$measurements{$params}}, $speed;
}

my %sizes;
while (my($params, $speeds) = each %measurements) {
    my @speeds = sort @$speeds;
    pop @speeds;
    shift @speeds;

    my %params = map { split /=/ } split /,/, $params;
    $params{avg} = int(sum(@speeds) / scalar(@speeds));
    push @{$sizes{delete $params{MESSAGE_SIZE}}}, \%params;
}

open my $out_fh, q{>}, "report.md" or die "report.md: $OS_ERROR";
print $out_fh "Benchmark results\n============================\n";
print $out_fh <<EOF;
'stock' erlang is the version from ubuntu trusty.

Tunings:
- 'HA' is about enabling 'ha-policy: all'
- 'fhc' is about disabling fhc read cache
- 'hipe' is about enabling HiPE compilation
- 'stats' is about tuning stats collection in management plugin
EOF


for my $size (sort { $a <=> $b } keys %sizes) {
    my $data = $sizes{$size};
    print $out_fh "\n\nMessage size $size\n----------------------\n\n";

    my @headers = ("erlang", "rabbit", "tuning", "throughput");
    print $out_fh join("|", @headers), "\n";
    print $out_fh join("|", ('--------') x @headers), "\n";

    my @data = sort { $a->{avg} <=> $b->{avg} } @$data;
    for my $row (@data) {
        my @tuning;
        push @tuning, 'HA' if $row->{RABBIT_HA} eq 'true';
        push @tuning, 'fhc' if $row->{FHC_READ_BUFFERING} eq 'false';
        push @tuning, 'hipe' if $row->{HIPE_COMPILE} eq 'true';
        push @tuning, 'stats' if $row->{STATS} ne 'default';
        my $tuning = join (", ", @tuning);
        say $out_fh "$row->{ERLANG}|$row->{RABBIT}|$tuning|$row->{avg}";
    }
}
