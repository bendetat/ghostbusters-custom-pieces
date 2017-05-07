$fn=100;

// PVC cap

od = 33.4;
tubeThickness = 1.75;
capInnerThickness = 1.0;
capTopThickness = 2.0;
capHeight = 15.0;

id = od - tubeThickness*2;

cylinder(d=od, h=capTopThickness);
translate([0,0,capTopThickness]) {
    difference() {
        cylinder(d=id, h=capHeight - capTopThickness);
        
        translate([0,0,2])
        cylinder(d=id - capInnerThickness*2, h=capHeight - capTopThickness + 1);
    }
}
    