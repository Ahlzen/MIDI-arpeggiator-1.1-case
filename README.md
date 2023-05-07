# MIDI-arpeggiator-1.1-case
Case and panel artwork for MIDI Arpeggiator v1.1

## Case parts

These parts are created with OpenSCAD (source included) and are designed to be 3D-printed.

Adjust parameters in *common.scad* to adjust size, positions, case thickness, rounding, etc.

* *case-bottom.scad* and *case-top.scad* are meant to be printed face down.
* *button.scad* creates a complete set of panel buttons connected by thin flexible strings (so they stay aligned)
* *knob.scad* TODO.

## Print

Print the top, bottom and button strip face down. No supports required.

Inside holes have a tendency to shrink on FDM prints. If the holes (for screws or buttons) are too small, diameters and clearances can be adjusted in common.scad.

Knob (cap) for the potentiometers is not included (yet) but you can use something like this (also my designs!):

https://www.thingiverse.com/thing:4807288

or

https://www.thingiverse.com/thing:4828448

Both of the above can be customized, and will work with knurled or D-shaft potentiometers.


## Assembly

A total of 10 self tapping screws are required - 6 for the PCB standoffs, and 4 on the sides of the case. [#4 x 3/8 sheet metal screws](https://www.boltdepot.com/Product-Details.aspx?product=5436) work well.

If using other screws, adjust the hole diameter in *common.scad*. Rule of thumb is to make the hole size about the same diameter
as the major diameter of the screw (outside of the thread) - then the pull/shrinkage during print is usually enough for the thread to grab into.


## License

TODO
