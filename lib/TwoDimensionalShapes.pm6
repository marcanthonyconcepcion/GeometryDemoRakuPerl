unit module TwoDimensionalShapes;
use GeometricFigures;

class Circle does TwoDimensionalShape is export
{
    has $.radius;
    method get-area {
        π*$.radius**2;
    }
    method get-perimeter {
        2*π*$.radius;
    }
}

class Rectangle does TwoDimensionalShape is export
{
    has $.length;
    has $.width;
    method get-area {
        $.length*$.width;
    }
    method get-perimeter {
        2*$.length+2*$.width;
    }
}

class Square is Rectangle is export
{
    method new($side) {
        self.bless(length=>$side, width=>$side);
    }
}

class InvalidTriangleError is Exception is export
{
    method message() {
        "NOT A TRIANGLE. Please provide valid triangle sides.";
    }
}

class Triangle does TwoDimensionalShape is export
{
    has $.a;
    has $.b;
    has $.c;
    method new ($a, $b, $c) {
        if !($a + $b > $c && $a + $c > $b && $b + $c > $a) {
            InvalidTriangleError.new.throw;
        }
        self.bless(:$a, :$b, :$c);
    }
    method get-area {
        my $half_perimeter = self.get-perimeter / 2;
        sqrt($half_perimeter * ($half_perimeter - $.a) * ($half_perimeter - $.b) * ($half_perimeter - $.c));
    }
    method get-perimeter {
        $.a + $.b + $.c;
    }
}
