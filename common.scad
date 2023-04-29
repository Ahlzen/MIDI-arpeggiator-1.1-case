caseX = 160;
caseY = 110;
caseZ = 30; // total height
bottomZ = 20; // height of bottom part
topZ = caseZ-bottomZ; // height of top part
caseR = 4; // corner radius
thickness = 2;
innerR = caseR-thickness;

// top right of PCB needs to be up to the edge
// so connectors line up
pcbX = 100; // width
pcbY = 100; // height
pcbZ = 1.6; // thickness
pcbOX = caseX - caseR/2 - pcbX - 10; // offset (bottom right corner)
pcbOY = caseY - caseR/2 - pcbY; // offset (bottom right corner)
pcbOZ = bottomZ; // offset, bottom of pcb
pcbToCeiling = topZ-thickness-pcbZ; // distance from top of PCB to the case above it
switchHeight = 5; // height from PCB to top of tact switch

// alignment/fastening tabs
tabsFromEdge = 5;
tabLength = 20;
tabHeight = 10;
tabScrewHoleD = 2.9; // (for #4 sheet metal screws) little loose, maybe try 2.9 or 2.8

// standoffs
standoffID = 2.9; // screw hole diameter (for #4 sheet metal screws) little loose, maybe try 2.9 or 2.8
standoffOD = 7; // outside diameter

// button, potentiometer and LED hole sizes
buttonX = 11.5;
buttonY = 8.5;
buttonR = 1.5; // corner rounding
buttonClearance = 0.5;
ledD = 3.5;
potD = 7.5; // diameter of threaded "neck"

// hole offsets (from PCB top left)
holeCoords = [
  [5.08, 29.21],
  [67.31, 5.08],
  [93.98, 5.08],
  [17.78, 92.71],
  [57.15, 92.71],
  [83.82, 92.71]];
// Back edge case cutouts [from, to, height, height in top part]
// TODO: check heights
backCutouts = [
  [0, 63, 16],
  [74, 86, 5]];
sideCutouts = [
  [35, 54, 8, 3]];
  
// Front panel holes
buttonCoords = [ // relative to PCB origin
  [7.62, 92.71],
  [29.21, 92.71],
  [46.99, 92.71],
  [73.66, 92.71],
  [93.98, 92.71]];
ledCoords = [ // relative to PCB origin
  [7.62, 72.39],
  [7.62, 82.55],
  [26.67, 82.55],
  [26.67, 76.20],
  [26.67, 69.85],
  [26.67, 63.50],
  [26.67, 57.15],
  [44.45, 82.55],
  [44.45, 76.20],
  [44.45, 69.85],
  [44.45, 63.50],
  [73.66, 82.55],
  [93.98, 82.55],
  [93.98, 72.39]];
potCoords = [ // absolute coordinates
  [24, 70],
  [24, 30]];

e = 0.01;

module case() {
  difference() {
    // outside
    translate([caseX/2, caseY/2, caseZ/2])
      roundedBox([caseX, caseY, caseZ], caseR, false);
    
    // inside
    translate([caseX/2, caseY/2, caseZ/2])
      roundedBox([caseX-2*thickness, caseY-2*thickness, caseZ-2*thickness], innerR, false);
  }
}