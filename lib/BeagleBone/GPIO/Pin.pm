package BeagleBone::GPIO::Pin;
my $base='/sys/class/gpio/';

use 5.006;
use strict;
use warnings FATAL => 'all';
use Carp;

=head1 NAME

BeagleBone::GPIO::Pin - The great new BeagleBone::GPIO::Pin!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use BeagleBone::GPIO::Pin;

    my $foo = BeagleBone::GPIO::Pin->new();
    ...

=head1 SUBROUTINES/METHODS

=head2 new

=cut

sub new {
    my($proto, $name, $index) = @_;
    my $me = {
	      name=>$name, 
	      index=>$index,
	      path=>$base.'gpio'.$index,
    };
    if(! -d $base.'gpio'.$index){
        open(my $eh, '>', $base.'export') || croak "Could not write to export device: $!\n";
        print $eh $index."\n";
        close($eh);
    }
    return bless($me, $proto);
}

=head2 setMode

=cut

sub setMode {
    my $me = shift;
    my $mode = shift;
    open(my $dh, '>', $me->{path}.'/direction') || croak "Could not write to device direction controll handle: $!\n";
    print $dh $mode."\n";
    close($dh);
    return 1;
}

=head2 setValue

=cut

sub setValue{
    my $me = shift;
    my $value = shift;
    open(my $vh, '>', $me->{path}.'/value') || croak "Could not write to device value handle: $!\n";
    print $vh $value."\n";
    close($vh);
    return 1;
}

=head2 getValue

=cut

sub getValue{
    my $me = shift;
    open(my $vh, '<', $me->{path}.'/value') || croak "Could not read from device value handle: $!\n";
    my $value = <$vh>;
    close($vh);
    return $value;
}

DESTROY{
    my $me = shift;
    open(my $uh, '>', $base.'unexport') || die "Could not un export used pin: $!\n";
    print $uh $me->{index}."\n";
    close($uh);
}

=head1 AUTHOR

Dave Mueller, C<< <dave at perljedi.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-perlbeaglebonegpio at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=PerlBeagleBoneGPIO>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc BeagleBone::GPIO::Pin


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=PerlBeagleBoneGPIO>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/PerlBeagleBoneGPIO>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/PerlBeagleBoneGPIO>

=item * Search CPAN

L<http://search.cpan.org/dist/PerlBeagleBoneGPIO/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2014 Dave Mueller.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of BeagleBone::GPIO::Pin
