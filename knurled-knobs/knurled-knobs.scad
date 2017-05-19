$fn = 50;

use <knurledFinishLib_v2.scad>

knurl_help();

//wand_box_top_knob();
wand_box_front_knob();

module wand_box_front_knob() {
    difference() {
        union() {
            cylinder(d=16.5,h=4.0);
            translate([0,0,4])
            cylinder(d=15.5,h=0.5);
            translate([0,0,4.5])
            knurl(
                knurl_dp=0.3,
                k_cyl_od=13.0,
                k_cyl_hg=14.5,
                knurl_wd=1.5,
                knurl_hg=2.0);
        }
        translate([0,0,-1])
        cylinder(d=3.6,h=30);
        translate([0,0,19-2.85])
        cylinder(d=5.5,h=3.0);
    }
}

module wand_box_top_knob() {
    difference() {
        knurl(
            knurl_dp=0.8,
            knurl_od=25.0,
            k_cyl_hg=6.0,
            knurl_wd=1.5,
            knurl_hg=2.0);
        translate([0,0,-1])
        cylinder(d=3.6,h=10);
    }
    difference() {
        translate([0,0,6])
        cylinder(d=18,h=0.8);
        translate([0,0,5.99])
        cylinder(d=6,h=0.9);
    }
}

