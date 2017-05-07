$fn=100;

// Loom receiver for synchrotron
// per http://www.gbfans.com/wiki/File:Stefan%27s_Proton_Pack_Plans_Page_2.jpg

baseDiameter = 58.7;
baseHeight = 12.7;
spacerDiameter = 57.2;
spacerHeight = 15.9 - baseHeight;
tubeDiameter = 31.8;
tubeHeight = 63.5;
tubeId = 20.1;  // to suit 20 mm conduit

cylinder(d=baseDiameter, h=baseHeight);

translate([0,0,baseHeight])
cylinder(d=spacerDiameter, h=spacerHeight);

difference() {
    translate([0,0,baseHeight + spacerHeight])
    cylinder(d=tubeDiameter, h=tubeHeight);

    translate([0,0,baseHeight + spacerHeight])
    cylinder(d=tubeId, h=tubeHeight + 1);
}