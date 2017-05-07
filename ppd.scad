$fn = 100;

// Per http://www.gbfans.com/wiki/File:Stefan%27s_Proton_Pack_Plans_Page_13.jpg
// although the innerDiameter is increased slightly to accommodate the 10 mm split loom
diameter = 34.9;
innerDiameter = 11.0;   //9.5;
height = 81.0;
cutoffAngle = 135.0;

difference() {
    // The core cylinder
    cylinder(d=diameter, h=height);
    
    // Hole
    translate([0,0,height/2])
    cylinder(d=innerDiameter, h=height);
    
    // Cutoff
    translate([-diameter/2,-height/2,height])
    rotate([0,cutoffAngle+270,0])
    cube([height,height,height/3]);
}
