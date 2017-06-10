$fn = 100;

// A very roughly designed trigger for the wand tip.
// Eyeballed from http://i961.photobucket.com/albums/ae97/Doug_Solo/2016%20Ghostbusters%20Venkman%20Hero%20Proton%20Pack/thrower_tip_compressed_banjo_zpslgass7nw.jpg (http://www.therpf.com/showthread.php?t=259249)

trigger_depth = 10;

difference() {
    trigger();
    
    // screw hole
    translate([-0.1,-25.5+6,trigger_depth/2])
    rotate([0,90,0])
    cylinder(d=3,h=12.2);
}
//translate([0,-25.5,0])
//color("blue") cube([8,12,trigger_depth]);
module trigger() {
    difference() {
        translate([26*0.25,0,0])
        difference() {
            translate([2,6,0])
            cylinder(d=26*1.5,h=trigger_depth);
            translate([7,8,-0.1])
            cylinder(d=30, h=trigger_depth+0.2);
        }
        translate([-15,-30,-0.1])
        cube([15,60,trigger_depth+0.2]);
        translate([-0.1,0,-0.1])
        cube([40,40,trigger_depth+0.2]);
    }

    translate([0,-25.5,0])
    cube([8,18,trigger_depth]);
}