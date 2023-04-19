include <MCAD/boxes.scad>
include <common.scad>

$fn = $preview ? 15 : 40;

module button(x,y) {
  translate([pcbOX+x, pcbOY+pcbY-y, 0]) {
    roundedBox([buttonX, buttonY, 100], buttonR, true);
}}

module led(x,y) {
  translate([pcbOX+x, pcbOY+pcbY-y, 0]) {
    cylinder(d=ledD, h=100);
}}

difference() {
  translate([0,0,-bottomZ])
    case();
  // Cut off flat bottom
  translate([0,0,-caseZ])
    cube([caseX, caseY, caseZ]);
  // Right side cutouts
  for (i = [0:len(sideCutouts)-1]) {
    cutout = sideCutouts[i];
    y = pcbOY+pcbY-cutout[1];
    w = cutout[1]-cutout[0];
    h = cutout[3];
    translate([pcbOX+pcbX, y, 0])
      cube([100, w, h]);
  }
  // Holes for buttons and LEDs
  for (i = [0:len(buttonCoords)-1])
    button(buttonCoords[i].x, buttonCoords[i].y);
  for (i = [0:len(ledCoords)-1])
    led(ledCoords[i].x, ledCoords[i].y);
  // Holes for potentiometers
  for (i = [0:len(potCoords)-1])
    translate([potCoords[i].x, potCoords[i].y, 0])
      cylinder(d=potD, h=100);
}

// alignment/fastening tabs
difference() {
  union() {
    translate([tabsFromEdge, thickness, -tabHeight])
      cube([tabLength, thickness, topZ-innerR+tabHeight]);
    translate([caseX-tabLength-tabsFromEdge, thickness, -tabHeight])
      cube([tabLength, thickness, topZ-innerR+tabHeight]);
    translate([tabsFromEdge, caseY-2*thickness, -tabHeight])
      cube([tabLength, thickness, topZ-innerR+tabHeight]);
    translate([caseX-tabLength-tabsFromEdge, caseY-2*thickness, -tabHeight])
      cube([tabLength, thickness, topZ-innerR+tabHeight]);
  };
  translate([tabsFromEdge+tabLength/2, 0, -tabHeight/2])
    rotate([-90,0,0])
      cylinder(h=1000, d=tabScrewHoleD);
  translate([caseX-tabsFromEdge-tabLength/2, 0, -tabHeight/2])
    rotate([-90,0,0])
      cylinder(h=1000, d=tabScrewHoleD);
}