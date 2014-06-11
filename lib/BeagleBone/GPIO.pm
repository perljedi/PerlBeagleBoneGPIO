package BeagleBone::GPIO;

use 5.006;
use strict;
use warnings FATAL => 'all';
use base qw(Exporter);
use vars qw(@EXPORT @EXPORT_OK %EXPORT_TAGS %PinNameMap @PinIndexToNameList);

=head1 NAME

BeagleBone::GPIO - The great new BeagleBone::GPIO!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use BeagleBone::GPIO;

    my $pin = BeagleBone::GPIO::getPinByName("P8_13");
    $pin->setMode("out");
    $pin->setValue(1);

=head1 EXPORT

Note: None of the following are exported by default.  They are all available for export, and all of them can be imported at once through the convience export tag "all"

=head2 Variables

=head3 %PinNameMap

This is a map from pin name (i.e. P8_13) to pin index in the device tree overlay.

=head3 @PinIndexToNameList

This is essentially the revers of the PinNameMap, entries at each index in the array map to the 
pin header names.

=head2 Methods

=item L<&init|/init1>

=item L<&getPinByName|/getPinByName1>

=item L<&getPinByIndex|/getPinByIndex1>

=cut

BEGIN{
    @EXPORT = qw();
    @EXPORT_OK = qw(&init %PinNameMap @PinIndexToNameList);
    %EXPORT_TAGS = (
        all=>\@EXPORT_OK,
    );
}


=head1 SUBROUTINES/METHODS

=head2 init

Initialize pin name to index and index to pin name maps

=cut

sub init{
    if(scalar(keys %PinNameMap) < 1){
        while(<DATA>){
            chomp;
            my($name, $index) = split(/\s/);
            $PinNameMap{$name}=$index;
            $PinIndexToNameList[$index]=$name;
        }
    }
}

=head2 getPinByName

=cut

sub getPinByName {
    &init();
    return new BeagleBone::GPIO::Pin(@_);
}

=head2 getPinByIndex

=cut

sub getPinByIndex {
    &init();
    return new BeagleBone::GPIO::Pin($PinIndexToNameList[$_[0]]);
}

=head1 AUTHOR

Dave Mueller, C<< <dave at perljedi.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-perlbeaglebonegpio at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=PerlBeagleBoneGPIO>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc BeagleBone::GPIO


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

return 42; # End of BeagleBone::GPIO
__data__
P8_03 38
P8_04 39
P8_05 34
P8_06 35
P8_07 66
P8_08 67
P8_09 69
P8_10 68
P8_11 45
P8_12 44
P8_13 23
P8_14 26
P8_15 47
P8_16 46
P8_17 27
P8_18 65
P8_19 22
P8_20 63
P8_21 62
P8_22 37
P8_23 36
P8_24 33
P8_25 32
P8_26 61
P8_27 86
P8_28 88
P8_29 87
P8_30 89
P8_31 10
P8_32 11
P8_33 9
P8_34 81
P8_35 8
P8_36 80
P8_37 78
P8_38 79
P8_39 76
P8_40 77
P8_41 74
P8_42 75
P8_43 72
P8_44 73
P8_45 70
P8_46 71
P9_11 30
P9_12 60
P9_13 31
P9_14 50
P9_15 48
P9_16 51
P9_17 5
P9_18 4
P9_19 13
P9_20 12
P9_21 3
P9_22 2
P9_23 49
P9_24 15
P9_25 117
P9_26 14
P9_27 115
P9_28 113
P9_29 111
P9_30 112
P9_31 110
