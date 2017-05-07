$fn = 100;

// Clippard valve body
// This doesn't include the gear because I'm cheating and using a 20 tooth GT2 pulley with a 6 mm bore (found on many reprap 3D printers)

baseHeight=10.0;
firstCylinderHeight = 36.0;
firstCylinderDiameter = 33.0;
secondCylinderHeight = 10;
secondCylinderDiameter=32.5;
gearShaftDiameter = 4.5;    // to accept a 5 mm thread

base();
translate([0,0,baseHeight])
body();

module body() {
    difference() {
        union() {
            cylinder(d=firstCylinderDiameter, h=firstCylinderHeight);
            translate([0,0,firstCylinderHeight])
            cylinder(d=secondCylinderDiameter, h=secondCylinderHeight);
        }
        
        translate([0,0,firstCylinderHeight + secondCylinderHeight - 20])
        cylinder(d=gearShaftDiameter, h=21);
    }
}

module base() {
    difference() {
        // base
        hull() {
            cylinder(d=39.0, h=baseHeight);

            translate([43.0/2,0,0])
            cylinder(d=6.5, h=baseHeight);
            translate([-43.0/2,0,0])
            cylinder(d=6.5, h=baseHeight);
        }

        // screw holes
        translate([43.0/2,0,-1.0])
        cylinder(d=3.5, h=baseHeight+2.0);
        translate([-43.0/2,0,-1.0])
        cylinder(d=3.5, h=baseHeight+2.0);
    }
}