include <MCAD/boxes.scad>
include <common.scad>

$fn = $preview ? 15 : 40;

module button(x,y) {
  translate([pcbOX+x, pcbOY+pcbY-y, 0]) {
    roundedBox([buttonX, buttonY, 100], buttonR, true);
}}

module led(x,y) {
  translate([pcbOX+x, pcbOY+pcbY-y, pcbZ+pcbToCeiling-e]) {
    // flare LED hole slightly for better viewing angle if not
    // flush with surface
    cylinder(d=ledD, h=10);
    translate([0,0,0.4]) cylinder(d1=ledD, d2=ledD+14, h=10);
}}


// turn it upside down so it's automatically oriented for 3d printing
rotate([0,180,0])

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

// PCB (uncomment to view)
//translate([0,0,-bottomZ]) pcb();