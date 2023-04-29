include <MCAD/boxes.scad>
include <common.scad>

$fn = $preview ? 15 : 40;

topHeight = 2+thickness;
bottomHeight = pcbToCeiling - switchHeight;

module button() {
  hull() {
    translate([0,0,topHeight/2])
      roundedBox([buttonX-buttonClearance, buttonY-buttonClearance, topHeight-1], 2, true);
    translate([0,0,topHeight/2])
      roundedBox([buttonX-buttonClearance-1, buttonY-buttonClearance-1, topHeight], 2, true);
  }
  translate([0,0,-bottomHeight/2])
    roundedBox([buttonX+3, buttonY+3, bottomHeight], buttonR, true);
}

// string (to keep spacing)
translate([0,2,-bottomHeight])
  cube([buttonCoords[len(buttonCoords)-1].x, 1, 0.2]);
translate([0,-3,-bottomHeight])
  cube([buttonCoords[len(buttonCoords)-1].x, 1, 0.2]);


// buttons
for (buttonCoord = buttonCoords)
  translate([buttonCoord.x, 0, 0])
    button();