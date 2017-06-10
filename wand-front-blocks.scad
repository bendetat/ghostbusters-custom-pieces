$fn=100;

// http://www.gbfans.com/wiki/File:Sean%27s_Proton_Gun_Plans_Page_9.jpg

function inches(in) = in * 25.4;

//left_block();
right_block();

module right_block() {
    difference() {
        linear_extrude(16)
        polygon([
            [0,                 -inches(13/32)],
            [15+inches(1+1/3),   -inches(13/32)],
            [15+inches(1+1/3),   inches(13/32)],
            [0,                 inches(13/32)]
        ]);
      
        translate([0,0,-0.1])
        cylinder(d=34,h=17.2);
        
        translate([20,-inches(11.5/32),2])
        cube([inches(1),inches(23/32),16]);
        
        translate([12,0,8])
        rotate([0,90,0])
        cylinder(d=10,h=10);
        
        translate([25,-5,8])
        rotate([90,0,0])
        cylinder(d=6.5,h=10);
        
        translate([40,-5,8])
        rotate([90,0,0])
        cylinder(d=6.5,h=10);
    }
}

module left_block() {
    difference() {
        linear_extrude(16)
        polygon([
            [3,                             0],
            [3,                             -20],
            [-inches(1.5)+3,                -20],
            [-inches(1.5)+3,                -20+inches(10/16)],
            [-inches(1.5)+3+inches(6/12),   inches(13/32)],
            [0,                             inches(13/32)]
        ]);
      
        translate([0,0,-0.1])
        cylinder(d=34,h=17.2);
      
        translate([-inches(1.5)+3-0.1,-20+inches(5/16),8])
        rotate([0,90,0])
        cylinder(d=3,h=5.1);
    }
}