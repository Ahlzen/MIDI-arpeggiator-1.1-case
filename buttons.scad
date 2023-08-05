include <MCAD/boxes.scad>
include <common.scad>

$fn = $preview ? 15 : 40;

topHeight = 2+thickness;
minBottomHeight = 2;
bottomHeight = max(2, pcbToCeiling - switchHeight);
totalHeight = topHeight + bottomHeight;
cutoutDepth = - (pcbToCeiling - switchHeight);

module button() {
  hull() {
    translate([0,0,topHeight/2-0.5])
      roundedBox([buttonX-buttonClearance, buttonY-buttonClearance, topHeight-1], 2, true);
    translate([0,0,topHeight/2])
      roundedBox([buttonX-buttonClearance-1, buttonY-buttonClearance-1, topHeight], 2, true);
  }
  translate([0,0,-bottomHeight/2])
    roundedBox([buttonX+3, buttonY+3, bottomHeight], buttonR, true);
}

difference() {
  
  union() {
    // string (to keep spacing)
    translate([0,2,-bottomHeight])
      cube([buttonCoords[len(buttonCoords)-1].x, 1, 0.2]);
    translate([0,-3,-bottomHeight])
      cube([buttonCoords[len(buttonCoords)-1].x, 1, 0.2]);

    // buttons
    for (buttonCoord = buttonCoords)
      translate([buttonCoord.x, 0, 0])
        button();
  };
  // Cutouts to allow enough clearance for pushbuttons on PCB,
  // if needed
  for (buttonCoord = buttonCoords)
    //translate([buttonCoord.x, 0, -50-bottomHeight+cutoutDepth])
    //    roundedBox([pcbSwitchX, pcbSwitchY, 100], 1, true);  
    translate([buttonCoord.x, 0, -bottomHeight+cutoutDepth/2-e])
      roundedBox([pcbSwitchX, pcbSwitchY, cutoutDepth], 1, true);  
}

