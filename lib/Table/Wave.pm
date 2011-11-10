package Table::Wave;

use warnings;
use strict;
use Carp;

use version;
our $VERSION = qv('0.01');

sub new {
	my $class = shift;
	my $self = {};
	bless $self, $class;
	return $self;
}

sub wave {
	my $self = shift;
	@{$self->{last}} = (('') x $#_) unless defined $self->{last};

        my @this = @_;
        my @last = @{$self->{last}};

        $this[0]='' if $this[0] eq $last[0];
	for ( 1..$#_ ) {
		$this[$_] ||= '';
		$last[$_] ||= '';
	        $this[$_]='' if $this[$_] eq $last[$_] && !$this[$_-1];
	}
	
	@{$self->{last}} = @_;

        return @this;
}

1;

__END__

=head1 NAME

Table::Wave - Make a table "wave" horizontally by removing repeating N-left
cells


=head1 SYNOPSIS

  use Table::Wave;
  my $tw = new Table::Wave;
  print join("\t", $tw->wave(1,2,3,4)), "\n";
  print join("\t", $tw->wave(1,2,3,5)), "\n";
  print join("\t", $tw->wave(1,6,3,4)), "\n";
  print join("\t", $tw->wave(1,6,7,4)), "\n";
  print join("\t", $tw->wave(8,6,3,4)), "\n";
  print join("\t", $tw->wave(8,6,9,1)), "\n";
  

=head1 DESCRIPTION

Make a table "wave" horizontally by removing repeating N-left cells


=head1 METHODS

=over 4

=item new()

  Constructor.  No arguments

=item wave(@array)

  B<wave> remembers the previous array passed to it and returns the current
  array with the repeating-of-previous left cells blanked.

=back

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-table-wave@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.


=head1 AUTHOR

Stefan Adams  C<< <stefan@cogentinnovators.com> >>


=head1 LICENCE AND COPYRIGHT

Copyright (c) 2011, Stefan Adams C<< <stefan@cogentinnovators.com> >>. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.


=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.
