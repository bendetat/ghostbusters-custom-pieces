// Based on http://www.gbfans.com/wiki/File:Stefan%27s_Proton_Pack_Plans_Page_6.jpg

$fn = 50;

rod_diam = 5.0; //~5mm knitting needle ;-)
screw_diam = 3.0;

translate([-50.8/2,68.3/2,0])
rotate([90,0,0])
difference() {
    linear_extrude(height=68.3)
    polygon([
        [0,     0],
        [50.8,  0],
        [50.8,  158.7],
        [25.4,  158.7],
        [25.4,  106.4],
        [0,     88.9]
    ]);
    
    // hole for long rod
    translate([
        25.4+((50.8-25.4)/4*3),
        158.7-(50.8-25.4)/4,
        48.3])
    cylinder(d=rod_diam,h=20.1);
    // hole for short rod
    translate([
        25.4+((50.8-25.4)/4),
        158.7-(50.8-25.4)/4,
        -0.1])
    cylinder(d=rod_diam,h=20.1);
    
    // reference hole for Dale PH 25 resistor
    translate([-0.1,88.9/2,68.3/2])
    rotate([0,90,0])
    cylinder(d=screw_diam, h=20);

    //reference hole for Dale RH 25
    translate([35.3,125.1,68.3/2])
    rotate([0,-90,0])
    cylinder(d=screw_diam,h=10);

    // reference hole for Dale RH 50
    translate([50.9,88.9,68.3/2])
    rotate([0,-90,0])
    cylinder(d=screw_diam,h=10);

    // reference hole for legris elbow
    translate([19,57.2,58.4])
    cylinder(d=screw_diam,h=10);

    // reference hole for tube fitting
    translate([
        25.4+((50.8-25.4)/4*3),
        158.7-(50.8-25.4)/4,
        -0.1])
    cylinder(d=screw_diam,h=10);

    //screw holes for top plate
    translate([38.1,158.8,15.9])
    rotate([90,0,0])
    cylinder(d=screw_diam,h=10);
    translate([38.1,158.8,15.9+36.5])
    rotate([90,0,0])
    cylinder(d=screw_diam,h=10);
}


