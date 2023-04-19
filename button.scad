include <MCAD/boxes.scad>
include <common.scad>

topHeight = 2+thickness;
bottomHeight = pcbToCeiling - switchHeight;

translate([0,0,topHeight/2])
  roundedBox([buttonX-buttonClearance, buttonY-buttonClearance, topHeight], 2, true);
translate([0,0,-bottomHeight/2])
  roundedBox([buttonX+3, buttonY+3, bottomHeight], buttonR, true);