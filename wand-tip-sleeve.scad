$fn=100;

// this is tuned for a 34mm OD PVC tube (used as the main wand tubes) and a 21mm by 103mm transparent plastic bottle, used as the clear tube

difference() {
    cylinder(d=34,h=15);
    translate([0,0,-0.1])
    cylinder(d=22,h=15.2);
}
translate([0,0,15]) {
    difference() {
        cylinder(d=29.5,h=68);
        translate([0,0,-0.1])
        cylinder(d=25.5,h=68.2);
        translate([-15,0,-0.1])
        cube([30,2,68.2]);
    }
}