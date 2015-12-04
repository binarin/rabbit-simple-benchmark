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
    $params{avg} = sum(@speeds) / scalar(@speeds);
    push @{$sizes{delete $params{MESSAGE_SIZE}}}, \%params;
}

open my $out_fh, q{>}, "report.md" or die "report.md: $OS_ERROR";
print $out_fh "Benchmark results\n============================\n";
for my $size (sort { $a <=> $b } keys %sizes) {
    my $data = $sizes{$size};
    print $out_fh "Message size $size\n----------------------\n";

    my @headers = ((sort grep { $_ ne 'avg' } keys %{$data->[0]}), 'avg');
    print $out_fh join("|", @headers), "\n";
    print $out_fh join("|", ('--------') x @headers), "\n";

    my @data = sort { $a->{avg} <=> $b->{avg} } @$data;
    say $out_fh join("|", @{$_}{@headers}) for @data;
}
