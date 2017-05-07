$fn = 100;

// The outerTubeDiameter and outerTubeWallThickness should be customised  to suit your hardware. The values below are measurements taken from a 50 mm PVC pipe (DVW501 - 50 mm is the internal diameter.
// 60.3 and 3.15 is per http://www.gbfans.com/wiki/File:Stefan%27s_Proton_Pack_Plans_Page_5.jpg
// By default, the booster cap will have the same wall thickness as the outer tube to keep it consistent. If this is too thick or thin, customise it to suit.

outerTubeDiameter = 56.0;   //60.3;
outerTubeWallThickness = 2.5;   //3.15;

wallThickness = outerTubeWallThickness;

/***** DO NOT MODIFY BELOW THIS LINE *****/

outerTubeId = outerTubeDiameter - outerTubeWallThickness*2;

difference() {
    cylinder(d=outerTubeId, h=outerTubeId*0.8);
    
    translate([0, 0, wallThickness])
    cylinder(d=outerTubeId - wallThickness*2, h=outerTubeId*0.8);
}

innerCylinderHeightRatio = 1 + 6.4/54.0;
innerCylinderHeight = innerCylinderHeightRatio*outerTubeId*0.8;

innerCylinderIdRatio = 28.6/54.0;
innerCylinderId = innerCylinderIdRatio*outerTubeId;

cylinder(d=innerCylinderId, h=innerCylinderHeight);