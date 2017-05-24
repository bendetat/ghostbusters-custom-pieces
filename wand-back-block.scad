$fn=100;

// This is the block at the back of the barrel, just between the box and the grip. Can be seen on the last photos here: http://www.gbfans.com/equipment/reference/25/0/
// http://www.gbfans.com/images/equipment/reference/25/20.jpg

difference() {
    linear_extrude(12)
    polygon([
        [0,0],
        [40,0],
        [40,32],
        [10,32],
        [0,22]
    ]);
  
    translate([20,0,-0.1])
    cylinder(d=34,h=15.2);
    
    translate([34,35,6])
    rotate([90,0,0])
    cylinder(d=5.2,h=8);
    
    translate([15,25,2])
    cylinder(d=3,h=10.1);
}