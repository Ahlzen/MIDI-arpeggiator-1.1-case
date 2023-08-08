include <MCAD/boxes.scad>
include <common.scad>

$fn = $preview ? 15 : 40;

topHeight = 2+thickness;
minBottomHeight = 2;
bottomHeight = max(2, pcbToCeiling - switchHeight);
totalHeight = topHeight + bottomHeight;
cutoutDepth = - (pcbToCeiling - switchHeight - 0.8); // last term compensates for sagging in bridging

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

module zigZagString(length, segmentLength, width, thickness)
  linear_extrude(thickness)
    for (n = [0 : length/segmentLength])
      translate([(n+.5)*segmentLength,0])
        rotate([0,0,n % 2 == 0 ? 45 : -45])
          square([segmentLength*sqrt(2)+width, width], center=true);

//zigZagString(100, 5, 1, 0.2);


difference() {
  
  union() {
    // string (to keep spacing)    
    translate([0,2,-bottomHeight])
      //cube([buttonCoords[len(buttonCoords)-1].x, 1, 0.2]);
      zigZagString(buttonCoords[len(buttonCoords)-1].x, 2, 1.2, 0.2);
    translate([0,-3,-bottomHeight])
      //cube([buttonCoords[len(buttonCoords)-1].x, 1, 0.2]);
    zigZagString(buttonCoords[len(buttonCoords)-1].x, 2, 1.2, 0.2);
    

    // buttons
    for (buttonCoord = buttonCoords)
      translate([buttonCoord.x, 0, 0])
        button();
  };
  // Cutouts to allow enough clearance for pushbuttons on PCB,
  // if needed
  for (buttonCoord = buttonCoords)
    translate([buttonCoord.x, 0, -bottomHeight+cutoutDepth/2-e])
      roundedBox([pcbSwitchX, pcbSwitchY, cutoutDepth], 1, true);  
}
