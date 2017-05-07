$fn=50;

wallThickness = 2;

//wand_main_box();
//front_part();
back_part();

module back_part() {
    translate([0,-85,0])
    difference() {
        wand_main_box();
        translate([-5,-0.01,-0.01])
        cube([90,85.02,100]);
    }
}

module front_part() {
    difference() {
        wand_main_box();
        translate([-5,85.01,-0.01]) 
        cube([90,60,60]);
    }
}

module wand_main_box() {
    difference() {
        base_shell();
        
        // bar cutout
        translate([64,5,57])
        rotate([-atan(35/45),0,0])
        cube([10,15,25.42]);
        
        // front screw cutouts
        translate([54,16,62])
        rotate([-atan(35/45)+90,0,0])
        union() {
            cylinder(d=6,h=10);
            translate([0,15,0])
            cylinder(d=6,h=10);
        }
        
        // top tube cutout
        translate([20,-1,70])
        rotate([270,0,0])
        cylinder(d=33.5,h=40);
        
        // bottom tube cutout
        translate([60,80,20])
        rotate([270,0,0])
        cylinder(d=33.5,h=50);
        
        // vent cutouts
        translate([25,49,87])
        vent();
        translate([25,58,87])
        vent();
        translate([25,67,87])
        vent();

        // top led cutouts
        translate([65,44,87])
        cylinder(d=5,h=6);    
        translate([65,59,87])
        cylinder(d=5,h=6);
        
        // top knob screw hole
        translate([12,65,87])
        cylinder(d=3,h=6);
        
        // clippard valve screw holes
        translate([75,87,70])
        rotate([90,0,0])
        cylinder(d=3,h=6);
        translate([75-43,87,70])
        rotate([90,0,0])
        cylinder(d=3,h=6);

        // back knob screw hole
        translate([13,104,77])
        rotate([90,0,0])
        cylinder(d=3,h=26);
    
        // back led cutout
        translate([13,112,46])
        cylinder(d=5,h=6);
    }
    
    // back knob
    //translate([13,103,77]) back_knob();
}

// tODO knurl
module back_knob() {
    difference() {
        rotate([90,0,0])
        cylinder(d=16,h=18);    
        
        translate([0,1,0])
        rotate([90,0,0])
        cylinder(d=3,h=26);
    }
}

module vent() {
    hull() {
        translate([2,0,0])
        cylinder(d=4,h=6);
        translate([25-2,0,0])
        cylinder(d=4,h=6);
    }
}

module fix_poly() {
    translate([80,0,0])
    rotate([0,270,0])
    children();
}

module base_shell() {
    difference() {
        fix_poly() {
            base_box();
        }
        difference() {
            union() {
                // inner shell
                fix_poly() {
                    translate([0,0,wallThickness])
                    linear_extrude(height=80-wallThickness*2)
                    offset(delta=-wallThickness)
                    base_poly();
                }
                
                // cut out the floor
                translate([wallThickness,wallThickness,-1])
                cube([
                    80-wallThickness*2,
                    125-wallThickness*2,
                    wallThickness+2]);
            }
            // leave fill for the top tube
            translate([-40,0,0])
            fix_poly() {
                linear_extrude(height=45)
                polygon([
                    [90,35],
                    [45,0],
                    [45,35]
                ]);
            }
            // leave fill for the bottom tube
            translate()
            fix_poly() {
                linear_extrude(height=40)
                polygon([
                    [50,125],
                    [50,105],
                    [0,105],
                    [0,125]
                ]);
            }
        }
    } 
}

module base_box() {
    linear_extrude(height=80) base_poly();
}

module base_poly() {
    polygon([
        [0,0],
        [0,125],
        [50,125],
        [50,85],
        [90,85],
        [90,35],
        [45,0]
    ]);
}