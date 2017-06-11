$fn=100;

wall_thickness = 3;

nfilter();
//cap();

module cap() {
    cylinder(d=70,h=3);
    translate([0,0,3])
    difference() {
        cylinder(d=70-wall_thickness*2,h=3);
        translate([0,0,-0.1]) cylinder(d=60,h=3.2);
    }
}

module nfilter() {
    translate([-120,0,100])
    rotate([180,0,0])
    difference() {
        translate([120,0,0])
        difference() {
            cylinder(d=70,h=100);
            translate([0,0,-0.1]) cylinder(d=70-wall_thickness*2,h=101);
            for (i=[0:8]) {
                translate([0,0,85])
                rotate([90,0,360/9*i])
                cylinder(d=12,h=40);
            }
        }
        microwave_lid();
    }
}

// Yes we found some microwave spray lids that are about the right size ;-)
// I really should rebuilt it with wood rings though...
module microwave_lid() {
    translate([0,0,-0.1]) cylinder(d=263.1,h=6.1);
    translate([0,0,6]) {
        translate([0,0,-0.1]) cylinder(d=253,h=6.1);
        translate([0,0,6]) {
            translate([0,0,-0.1]) cylinder(d1=245,d2=239,h=27.6);
            translate([0,0,27.5]) {
                translate([0,0,-0.1]) cylinder(d1=237,d2=235,h=12.1);
                translate([0,0,12]) {
                    torus(163, 235);
                    cylinder(d=199,h=18-0.8);
                }
            }
        }
    }
}



module torus(id, od) {
    rotate_extrude(convexity=10)
    translate([id/2+(od - id)/4, 0, 0])
    circle(d = (od-id)/2);
}

