# ============================================================================
package Text::Phonetic::Soundex::Length;
# ============================================================================
use utf8;

use Moose;
extends qw(Text::Phonetic);

__PACKAGE__->meta->make_immutable;

our $VERSION = "1.0";

sub _do_encode {
	my ($self,$string) = @_;

	my $code = uc($string);
	$code =~ tr/AaEeHhIiOoUuWwYyBbFfPpVvCcGgJjKkQqSsXxZzDdTtLlMmNnRr//cd;

	if (length($code)){
		my $firstchar = substr($code, 0, 1);
		$code =~ tr[AaEeHhIiOoUuWwYyBbFfPpVvCcGgJjKkQqSsXxZzDdTtLlMmNnRr]
		[0000000000000000111111112222222222222222333344555566]s;
		($code = substr($code, 1)) =~ tr/0//d;
		$code = substr($firstchar . $code . '000', 0, 8);
	}

	return $code;
}

1;

=encoding utf8

=pod

=head1 NAME

Text::Phonetic::Soundex::Length - Soundex algorithm with more length

=head1 SYNOPSIS

	use Text::Phonetic::Soundex::Length;

	my $phonetic = Text::Phonetic::Soundex::Length->new();
	$encoded_string = $phonetic->encode($string);

=head1 DESCRIPTION

The Soundex search algorithm is a phonetic algorithm.

=head1 AUTHOR

    Stefan Gipper <stefanos@cpan.org>, http://www.coder-world.de/

=head1 COPYRIGHT

Text::Phonetic::Soundex::Length is Copyright (c) 2010 Stefan Gipper
All rights reserved.

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

=head1 SEE ALSO



=cut
