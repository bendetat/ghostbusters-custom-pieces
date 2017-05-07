$fn=100;

// Clippard valve spacer for synchrotron
// per http://www.gbfans.com/wiki/File:Stefan%27s_Proton_Pack_Plans_Page_2.jpg

baseDiameter = 88.7;
baseHeight = 3.2;
spacerDiameter = 82.6;
spacerHeight = 12.7;

difference() {
    union() {
        cylinder(d=baseDiameter, h=baseHeight);
        translate([0,0,baseHeight])
        cylinder(d=spacerDiameter, h=spacerHeight);
    }
    
    // screw holes for valve, to suit 3 mm screw, 43mm apart
    translate([43.0/2,0,-1])
    cylinder(d=2.5, h=baseHeight + spacerHeight + 2);
    translate([-43.0/2,0,-1])
    cylinder(d=2.5, h=baseHeight + spacerHeight + 2);
}