unit module GeometricFigures;

role TwoDimensionalShape is export
{
    method get-area {...};
    method get-perimeter {...};
}

role ThreeDimensionalShape is export
{
    method get-surface-area {...};
    method get-volume {...};
}
