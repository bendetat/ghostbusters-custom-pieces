$fn = 100;

length = 70.0;
width = 27.0;
depth = 21.0;

translate([-length/2, -width/2 - 15, 0]) { 
    translate([0,30,0])
    trigger_box();
    trigger_lid();
}

module trigger_lid() {
    difference() {
        union() {
            linear_extrude(height=1.4)
            flat_box();
            
            translate([0,0,1.4])
            difference() {
                linear_extrude(height=1)
                offset(delta=-1.65)
                flat_box();        

                translate([0,0,-0.01])
                linear_extrude(height=1.1)
                offset(delta=-4.25)
                flat_box();        
            }
        }
        
        translate([6,width/2,0])
        screw_hole();
        translate([length-4,4,0])
        screw_hole();
        translate([length-4,width-4,0])
        screw_hole();
        
        // hole for wiring
        translate([length/2+ 10,width/2,-0.5])
        cylinder(d=10,h=3);
    }
}

module screw_hole() {
    translate([0,0,-1])
    cylinder(d=3, h=4);
}

module trigger_box(){
    difference() {
        linear_extrude(height=depth)
        flat_box();
        
        translate([0,0,1.4])
        linear_extrude(height=depth)
        offset(delta=-1.4)
        flat_box();
            
        // top switch (push button)
        translate([30,5,depth/2+0.5])
        rotate([90,0,0])
        cylinder(d=7,h=10);
            
        // bottom switch (toggle)
        translate([50,5,depth/2+0.5])
        rotate([90,0,0])
        cylinder(d=6,h=10);
    }
    
    translate([6,width/2,0])
    screw_shaft();
    translate([length-4,4,0])
    screw_shaft();
    translate([length-4,width-4,0])
    screw_shaft();
}

module screw_shaft() {
    difference() {
        cylinder(d=5,h=depth-1.5);
        translate([0,0,1])
        cylinder(d=2.7,h=depth);
    }
}

module flat_box() {
    polygon([
        [0, width/2],
        [15, 0],
        [length, 0],
        [length, width],
        [15, width]
    ]);
}

