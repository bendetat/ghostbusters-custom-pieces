$fn = 100;

// Based on http://www.gbfans.com/equipment/reference/38/

function inches(in) = in * 25.4;

fin_height = inches(3/8);
fin_ridge_diam = inches(1.5/16);
heatsink_length = inches(2+1/4);
heatsink_width = inches(2+1/4);
heatsink_base_height = inches(3/16);

translate([
    -heatsink_length/2,
    -heatsink_width/2
])
difference() {
    heatsink();
    
    translate([fin_offset(8)-fin_offset(1)/2+fin_ridge_diam/4,fin_offset(1)/2,-0.1])
    cylinder(d=3,h=heatsink_base_height+0.2);
    
    translate([fin_offset(1)-fin_offset(1)/2+fin_ridge_diam/4,fin_offset(1)/2,-0.1])
    cylinder(d=3,h=heatsink_base_height+0.2);
    
    translate([fin_offset(8)-fin_offset(1)/2+fin_ridge_diam/4,heatsink_length-fin_offset(1)/2,-0.1])
    cylinder(d=3,h=heatsink_base_height+0.2);
    
    translate([fin_offset(1)-fin_offset(1)/2+fin_ridge_diam/4,heatsink_length-fin_offset(1)/2,-0.1])
    cylinder(d=3,h=heatsink_base_height+0.2);
}

module heatsink() {
    finn(0);
    finn(1);
    finn(2);
    finn(3);
    finn(4);
    finn(5);
    finn(6);
    finn(7);
    finn(8);
    cube([
        heatsink_length,
        heatsink_width,
        heatsink_base_height
    ]);
}

function fin_offset(x) = fin_ridge_diam/2+((heatsink_width-fin_ridge_diam)/8)*x;

module finn(x) {
    translate([fin_offset(x),0,0])
    fin();
}

module fin() {
    fin_ridge();
    translate([0,0,inches(1/16)])
    fin_ridge();
    translate([0,0,inches(2/16)])
    fin_ridge();
    translate([0,0,inches(3/16)])
    fin_ridge();
    translate([0,0,inches(4/16)])
    fin_ridge();
    translate([0,0,inches(5/16)])
    fin_ridge();
}

module fin_ridge() {
    translate([0,0,heatsink_base_height])
    rotate([-90,0,0])
    cylinder(d=fin_ridge_diam,h=heatsink_length);
}