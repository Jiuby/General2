#!/usr/bin/perl

use strict;
use warnings;

sub xor_decrypt {
    my ($encrypted, $key) = @_;
    my $decrypted = '';
    
    for my $i (0..$#$encrypted) {
        my $byte = $encrypted->[$i] ^ $key->[$i % @$key];
        $decrypted .= chr($byte);
    }
    
    return $decrypted;
}

sub main {
    print "Ingrese el número de cadenas encriptadas:\n";
    my $num_strings = <STDIN>;
    chomp $num_strings;

    print "Ingrese las cadenas encriptadas en formato hexadecimal (separado por espacios):\n";
    my $encrypted_input = <STDIN>;
    chomp $encrypted_input;
    my @encrypted_strings = map { hex } split ' ', $encrypted_input;

    print "Ingrese la clave en formato hexadecimal:\n";
    my $key_input = <STDIN>;
    chomp $key_input;
    my @key = map { hex } split ' ', $key_input;

    my $decrypted = xor_decrypt(\@encrypted_strings, \@key);

    print "Mensajes desencriptados:\n";
    print "$decrypted\n";
}

main();
