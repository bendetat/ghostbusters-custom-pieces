
$fn = 100;

diameter = 45;
height = 4;

difference() {
    cylinder(d=diameter, h=height);
    translate([0,0,-0.01])
    cylinder(d=diameter/2, h=height+0.02);
}