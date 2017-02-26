$fs = 1;

// Leg hose connector for a Ghostbusters uniform
// https://github.com/bendetat/ghostbusters-suit-leg-hose-connector

hoseDiameter = 6;
screwDiameter = 3;

difference() {
    solidConnector();
    translate([0,0,-1])
    cylinder(
        d=hoseDiameter,
        h=50
    );
    Radial_Array(
        a=60,
        n=6,
        r=21
    ) {
        translate([0,0,-1])
        cylinder(
            d=screwDiameter,
            h=6
        );
    }
}

module solidConnector() {
    union() {
        cylinder(
            d=50,
            h=5
        );
        translate([0,0,5])
        cylinder(
            d1=35,
            d2=28,
            h=20
        );
        translate([0,0,25])
        cylinder(
            d1=25,
            d2=23,
            h=8
        );
        translate([0,0,33])
        cylinder(
            d=18,
            h=7
        );
    }
}

// http://forum.openscad.org/What-is-happening-here-tp5193p5205.html
//Radial_Array(a,n,r){child object}
// produces a clockwise radial array of child objects rotated around the local z axis   
// a= interval angle 
// n= number of objects 
// r= radius distance 
//
module Radial_Array(a,n,r)
{
    for (k=[0:n-1])
    {
        rotate([0,0,-(a*k)])
        translate([0,r,0])
        child();
    }
}