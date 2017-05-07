$fn = 50;

difference() {
    linear_extrude(height=32)
    polygon([
        [0,0],
        [58,0],
        [58,20],
        [15,20]
    ]);
    
    translate([44,10,12])
    cylinder(d=10,h=34);
    
    translate([26,10,12])
    cylinder(d=10,h=34);
}