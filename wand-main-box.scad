$fn=50;

wallThickness = 2;
tubeDiameter = 34.5;
ledHoleDiameter = 6.5;
switchHoleDiameter = 6.5;
screwHole = 3.0;

the_lot();

//wand_main_box();
//front_part();
//back_part();
//front_box();
//front_cylinder();
//back_cylinder();

module the_lot() {
    wand_main_box();
    translate([0,-20,23])
    front_box();
    translate([0,-20,0])
    front_cylinder();
    translate([20,175,20])
    rotate([90,0,0])
    back_cylinder();
}

module back_cylinder() {
    cylinder(d=30,h=50);
}

module front_cylinder() {
    difference() {
        translate([65,20,12])
        rotate([90,0,0])
        cylinder(d=30,h=50);
        translate([0,-1,22])
        cube([100,22,22]);
        translate([0,3,-9])
        cube([100,18,10]);
        translate([65,-20,12])
        rotate([90,0,0])
        cylinder(d=5,h=11);
    }
}

module front_box() {
    difference() {
        cube([100,20,22]);
        // tube fitting
        translate([90,10,10])
        cylinder(d=5,h=25);
        // led
        translate([70,10,20])
        cylinder(d=ledHoleDiameter,h=11);
        //screw holes
        translate([65,35,11])
        rotate([90,0,0])
        cylinder(d=screwHole,h=40);
        translate([10,35,11])
        rotate([90,0,0])
        cylinder(d=screwHole,h=40);
        // shell for wiring
        translate([15,wallThickness,wallThickness])
        cube([63,100,22-wallThickness*2]);
    }
}

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
        cube([11,15,26]);
        
        // front switch cutouts
        translate([54,16,62])
        rotate([-atan(35/45)+90,0,0])
        union() {
            cylinder(d=switchHoleDiameter,h=10);
            translate([0,15,0])
            cylinder(d=switchHoleDiameter,h=10);
        }
        
        // top tube cutout
        translate([20,-1,70])
        rotate([270,0,0])
        cylinder(d=tubeDiameter,h=40);
        
        // bottom tube cutout
        translate([60,80,20])
        rotate([270,0,0])
        cylinder(d=tubeDiameter,h=50);
        
        // vent cutouts
        translate([25,49,87])
        vent();
        translate([25,58,87])
        vent();
        translate([25,67,87])
        vent();

        // top led cutouts
        translate([65,44,87])
        cylinder(d=ledHoleDiameter,h=6);    
        translate([65,59,87])
        cylinder(d=ledHoleDiameter,h=6);
        
        // top knob screw hole
        translate([12,65,87])
        cylinder(d=screwHole,h=6);
        
        // clippard valve screw holes
        translate([75,87,70])
        rotate([90,0,0])
        cylinder(d=screwHole,h=6);
        translate([75-43,87,70])
        rotate([90,0,0])
        cylinder(d=screwHole,h=6);

        // back knob screw hole
        translate([13,104,77])
        rotate([90,0,0])
        cylinder(d=screwHole,h=26);
    
        // back led cutout
        translate([13,112,46])
        cylinder(d=ledHoleDiameter,h=6);
        
        // screw cutouts for front box
        translate([0,0,23]) {
            translate([65,35,11])
            rotate([90,0,0])
            cylinder(d=screwHole,h=40);
            translate([10,35,11])
            rotate([90,0,0])
            cylinder(d=screwHole,h=40);
        }
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