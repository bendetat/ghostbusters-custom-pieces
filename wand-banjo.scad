$fn=100;

// Legris banjo elbow, guestimated :-)
// This is used on the tip of the wand
// Eyeballed from http://i961.photobucket.com/albums/ae97/Doug_Solo/2016%20Ghostbusters%20Venkman%20Hero%20Proton%20Pack/thrower_banjo_front_zpslvwurpa0.jpg (http://www.therpf.com/showthread.php?t=259249)

difference() {
    union() {
        core();
        translate([6,6,28])
        cylinder(d=6,h=2.5);
    }
    translate([6,6,14])
    cylinder(d=4,h=30);
    
    translate([6,6,16])
    rotate([90,0,0])
    cylinder(d=4,h=7);
    
    translate([6,12.1,6])
    rotate([90,0,0])
    cylinder(d=3,h=7);
}

module core() {
    difference() {
        cube([12,12,28]);
      
        // top chamfer thing, which is a hollowed out cone
        translate([6,6,25])
        difference() {
            // this cone isn't important, it's the outside shell
            cylinder(h=35/2,r1=45,r2=0);
            // this cone determines the shape of the chamfer
            translate([0,0,-0.01])
            cylinder(h=13/2,r1=19/2,r2=0);
        }
    }
}