unit module ThreeDimensionalShapes;
use GeometricFigures;
use TwoDimensionalShapes;

class Prism does ThreeDimensionalShape is export
{
    has $.height;
    has TwoDimensionalShape $.base_shape;
    method get-surface-area {
        2*$.base_shape.get-area + $.height*$.base_shape.get-perimeter;
    }
    method get-volume {
        $.height*$.base_shape.get-area
    }
}

class RectangularPrism is Prism is export
{
    method new ($length, $width, $height) {
        self.bless(:$height, base_shape=>Rectangle.new(:$length, :$width));
    }
}

class Cube is RectangularPrism is export
{
    method new ($side) {
         RectangularPrism.new($side,$side,$side);
    }
}

class Sphere does ThreeDimensionalShape is export
{
    has $.radius;
    method get-volume {
        4*π*$.radius**3/3;
    }
    method get-surface-area {
        4*π*$.radius**2;
    }
}

class Cylinder is Prism is export
{
    method new($height, $radius) {
        self.bless(:$height, base_shape=>Circle.new(radius=>$radius));
    }
}

class TriangularPrism is Prism is export
{
    method new($height, $a, $b, $c) {
        self.bless(:$height, base_shape=>Triangle.new($a,$b,$c));
    }
}
