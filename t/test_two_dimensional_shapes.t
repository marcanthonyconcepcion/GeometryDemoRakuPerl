use Test;
use TwoDimensionalShapes;

subtest {
    my $radius = 10;

    my $dut = Circle.new(:$radius);
    is π*$radius**2,    $dut.get-area,      "Area of the Circle";
    is 2*π*$radius,     $dut.get-perimeter, "Perimeter of the Circle";
}, "Geometric Properties of the Circle";

subtest {
    my $length = 10;
    my $width = 20;

    my $dut = Rectangle.new(:$length,:$width);
    is $length*$width,      $dut.get-area,      "Area of the Rectangle";
    is 2*($length+$width),  $dut.get-perimeter, "Perimeter of the Rectangle";
}, "Geometric Properties of the Rectangle";

subtest {
    my $side = 10;

    my $dut = Square.new($side);
    is $side**2,    $dut.get-area,      "Area of the Square";
    is 4*$side,     $dut.get-perimeter, "Perimeter of the Square";
}, "Geometric Properties of the Square";

subtest {
    my $first_side = 70;
    my $second_side = 100;
    my $third_side = 50;
    my $half_perimeter = ($first_side + $second_side + $third_side)/2;

    my $dut = Triangle.new($first_side, $second_side, $third_side);
    is sqrt($half_perimeter*($half_perimeter-$first_side)*($half_perimeter-$second_side)*($half_perimeter-$third_side)),
        $dut.get-area;
    is $first_side + $second_side + $third_side, $dut.get-perimeter;
}, "Geometric Properties of the Triangle";

subtest {
    my $first_side  = 10;
    my $second_side = 20;
    my $third_side  = 30;

    throws-like {
        Triangle.new($first_side, $second_side, $third_side);
    }, InvalidTriangleError;
}, "Error handling Invalid Triangle";

done-testing;
