```openscad
//Constants
//Please, do not change
$fs = 0.01;
$fa = 0.01;
fiberRadius = 2.15/2;

//Modular variables
boltRadius = 0.75;

//fiberPresser
translate([fiberRadius, 0, 0])
difference() {
    union() {
        //roundInserter
        translate([0, 10, 0])
        cylinder(h=15, r=fiberRadius);
        translate([0, 10-fiberRadius, 0])
        cube([15, fiberRadius*2, 15]);
        
        //topPlate
        translate([15, 0, 0])
        cube([3, 20, 15]);
    }
    //boltHoles
    for (i = [0:1]) {
        translate([15-0.1, 5+i*10, 7.5])
        rotate([0, 90, 0])
        cylinder(h=3.2, r=boltRadius);
    }
}
