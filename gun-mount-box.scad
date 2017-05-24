$fn=50;

// Based on http://www.gbfans.com/wiki/File:Stefan%27s_Proton_Pack_Plans_Page_9.jpg
// Commented-out values are from the plan; the ones used below are for my pack

bridge_length = 87.3;
bridge_width = 10; //25.4;
bridge_height = 98.4;
box_length = 98.5;
box_width = 40;//44.4;
box_height = 114.3;
strip_width = 12.7;
strip_thickness = 3.2;

strip_gap_y = (box_length-strip_width*3)/4;

translate([
    -(bridge_width+box_width)/2,
    -box_length/2,
    0
])
gun_mount_box();

module gun_mount_box() {
    union() {
        translate([0,box_length - bridge_length,0]) 
        bridge();
        translate([bridge_width,0,0]) 
        main_box();
    }
}

module main_box() {
    cube([
        box_width,
        box_length,
        box_height
    ]);
    
    // Side strips along y axis
    translate([box_width,strip_gap_y,0])
    side_strip();
    translate([box_width,
        strip_gap_y*2 +strip_width,
        0])
    side_strip();
    translate([box_width,
        strip_gap_y*3 +strip_width*2,
        0])
    side_strip();
    
    // strip on x axis
    translate([box_width-strip_width,-strip_thickness,0])
    rotate([0,0,90])
    side_strip();
    
    // top strips along y axis
    translate([0,strip_gap_y,0]) top_strip();
    translate([0,strip_gap_y*2 + strip_width,0]) top_strip();
    translate([0,strip_gap_y*3 + strip_width*2,0]) top_strip();
    
    // top strip on x axis
    translate([
        box_width-strip_width*2,
        0,
        box_height
    ])
    cube([
        strip_width,
        strip_gap_y+strip_width,
        strip_thickness
    ]);
}

module top_strip() {
    top_strip_width = box_width*0.7882882883;   // trust me
    
    translate([
        box_width - top_strip_width + strip_thickness,
        0,
        box_height
    ])
    cube([
        top_strip_width,
        strip_width,
        strip_thickness
    ]);
}

module side_strip() {
    cube([strip_thickness,strip_width,box_height+strip_thickness]);
}

module bridge() {
    cube([
        bridge_width,
        bridge_length,
        bridge_height
    ]);
}

