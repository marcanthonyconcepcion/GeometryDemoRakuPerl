use Test;
use Test::Mock;
use GeometricFigures;
use ThreeDimensionalShapes;

class MockTwoDimensionalShape does TwoDimensionalShape
{
    method get-area {...};
    method get-perimeter {...};
}

subtest {
    my $length = 40;
    my $width = 50;
    my $height = 60;

    my $base_rectangle_area = $length * $width;
    my $base_rectangle_perimeter = 2 * ($length + $width);

    my $mock_base_shape = mocked MockTwoDimensionalShape, returning => {
        get-area => $base_rectangle_area,
        get-perimeter => $base_rectangle_perimeter
    };

    my $dut = Prism.new(height=>$height, base_shape=>$mock_base_shape);

    is $height*$base_rectangle_area, $dut.get-volume, "Volume of the Prism";
    is 2*$base_rectangle_area + $height*$base_rectangle_perimeter, $dut.get-surface-area, "Surface Area of the Prism";
}, "Geometric Properties of the Prism";

subtest {
    my $length = 10;
    my $width = 20;
    my $height = 30;

    my $base_rectangle_area = $length * $width;
    my $base_rectangle_perimeter = 2*($length + $width);

    my $dut = RectangularPrism.new($length, $width, $height);

    is $height*$base_rectangle_area, $dut.get-volume, "Volume of the Rectangular Prism";
    is 2*$base_rectangle_area + $height*$base_rectangle_perimeter,
            $dut.get-surface-area, "Surface Area of the Rectangular Prism";
}, "Geometric Properties of the Rectangular Prism";

subtest {
    my $side = 10;
    my $base_square_area = $side ** 2;
    my $base_square_perimeter = 4 * $side;

    my $dut = Cube.new($side);

    is $side * $base_square_area, $dut.get-volume, "Volume of the Cube";
    is 2 * $base_square_area + $side * $base_square_perimeter, $dut.get-surface-area, "Surface Area of the Cube";

    is $side ** 3, $dut.get-volume, "Volume of the Cube";
    is 6 * $side ** 2, $dut.get-surface-area, "Surface Area of the Cube";
}, "Geometric Properties of the Cube";

subtest {
    my $radius = 10;
    my $dut = Sphere.new(radius=>$radius);
    is 4*π*$radius**3/3, $dut.get-volume, "Volume of the Sphere";
    is 4*π*$radius**2, $dut.get-surface-area, "Surface Area of the Sphere";
}, "Geometric Properties of the Sphere";

subtest {
    my $radius = 10;
    my $height = 30;
    my $base_circle_area = π*$radius**2;
    my $base_circle_perimeter = 2*π*$radius;

    my $dut = Cylinder.new($height, $radius);

    is $height * $base_circle_area, $dut.get-volume, "Volume of the Cylinder";
    is 2*$base_circle_area+$height*$base_circle_perimeter, $dut.get-surface-area, "Surface Area of the Cylinder";

    is π*$radius**2*$height, $dut.get-volume, "Volume of the Cylinder";
    is 2*π*$radius*$height+2*π*$radius**2, $dut.get-surface-area, "Surface Area of the Cylinder";
}, "Geometric Properties of the Cylinder";

subtest {
    my $a = 20;
    my $b = 30;
    my $c = 40;
    my $prism_height = 30;
    my $base_triangle_perimeter = $a + $b + $c;
    my $base_triangle_half_perimeter = $base_triangle_perimeter/2;
    my $base_triangle_area = sqrt($base_triangle_half_perimeter * ($base_triangle_half_perimeter-$a) *
            ($base_triangle_half_perimeter-$b) * ($base_triangle_half_perimeter-$c));
    my $dut = TriangularPrism.new($prism_height, $a, $b, $c);

    is $prism_height*$base_triangle_area, $dut.get-volume, "Volume of the Triangular Prism";
    is 2*$base_triangle_area+$prism_height*$base_triangle_perimeter,
            $dut.get-surface-area, "Surface Area of the Triangular Prism";
}, "Geometric Properties of the Triangular Prism";

done-testing;
