include <MCAD/boxes.scad>
include <common.scad>

$fn = $preview ? 15 : 40;

module standoff(x, y) {
  translate([pcbOX+x, pcbOY+pcbY-y, thickness-e]) {
    cylinder(h=1.5, d1=standoffOD+3, d2=standoffOD); // fillet
    difference() {
      cylinder(h=bottomZ-thickness, d=standoffOD);
      cylinder(h=bottomZ, d=standoffID); // hole
}}}

difference() {
  case();
  // Cut off flat top
  translate([0,0,bottomZ])
    cube([caseX, caseY, caseZ]);  
  
  // Back cutouts
  for (i = [0:len(backCutouts)-1]) {
    cutout = backCutouts[i];
    x = pcbOX+cutout[0];
    w = cutout[1]-cutout[0];
    h = cutout[2];
    translate([x, pcbOY+pcbY-caseR, pcbOZ-h])
      cube([w, 100, h]);
  }
  
  // Right side cutouts
  for (i = [0:len(sideCutouts)-1]) {
    cutout = sideCutouts[i];
    y = pcbOY+pcbY-cutout[1];
    w = cutout[1]-cutout[0];
    h = cutout[2];
    translate([pcbOX+pcbX, y, pcbOZ-h])
      cube([100, w, h]);
  }
}

// Standoffs
// NOTE: y-coordinate is inverted since KiCAD uses top left as origin
for (i = [0:len(holeCoords)-1])
  standoff(holeCoords[i].x, holeCoords[i].y);

// PCB (uncomment to view)
//pcb();
