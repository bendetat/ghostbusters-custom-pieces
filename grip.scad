$fn=50;

// Customise these freely:
core_diam = 34; // outer diameter of the tube you use for the wand
grip_length = 120;

// Be more careful customising these:
grip_inner_width = 5;
grip_outer_width = 15;  // note that I cheat and scale this back by 0.85 below - otherwise it's too steep. 
grip_bulk_width = 3;

grip_inner_width_scale = (core_diam + grip_inner_width * 2) / core_diam;
grip_outer_width_scale = (core_diam + grip_outer_width * 2) / core_diam * 0.85;
grip_bulk_width_scale = (core_diam + grip_bulk_width * 2) / core_diam;
finger_radius = grip_outer_width - grip_inner_width;
finger_gap = (grip_length-finger_radius*3)/5; // note that this isn't the actual gap as the cutouts are scaled by an additional 1.2 in the z axis below

difference() {
    main_outer_shaft();
    translate([0,0,finger_radius*0+finger_gap*1])
    finger_cutout();
    translate([0,0,finger_radius*1+finger_gap*2])
    finger_cutout();
    translate([0,0,finger_radius*2+finger_gap*3])
    finger_cutout();
    translate([0,0,finger_radius*3+finger_gap*4])
    finger_cutout();
}

module main_outer_shaft() {    
    difference() {
        scale([
            grip_bulk_width_scale,
            grip_outer_width_scale, 
            1])
        cylinder(d = core_diam, h = grip_length);
        
        // subtract core
        translate([0,0,-0.1])
        cylinder(d = core_diam, h= grip_length + 0.2);
    
        // divide in twain
        translate([
            -(core_diam*grip_bulk_width_scale/2 + 0.1),
            -(core_diam*grip_outer_width_scale + 0.1),
            -0.1
        ])
        cube([
            core_diam*grip_bulk_width_scale + 0.2,
            core_diam*grip_outer_width_scale + 0.2,
            grip_length + 0.2
        ]);
    }
}

module finger_cutout() {
    scale([1, 1, 1.2])
    rotate_extrude(convexity = 10)
    translate([
        core_diam/2 + grip_bulk_width + grip_outer_width - grip_inner_width, 
        0, 
        0])
    circle(r = grip_outer_width - grip_inner_width);
}

