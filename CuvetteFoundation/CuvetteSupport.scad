```openscad
//Constants
//Please, do not change
$fs = 0.01;
$fa = 0.01;
fiberRadius = 2.15/2;

//Modular variables
boltLenght = 20;
boltRadius = 0.75;

flatNutRadius = 2.00;
sharpNutRadius = 1.51;
nutThickness = 1;

cuvetteTransparentSize = 12.75;
cuvetteOpaqueSize = 12.65;

baseHoleRadius = 1;


//mainBase
difference() {
    //foundation
    cube([50, 32, 5]);
    
    //hole
    translate([
        15+10-cuvetteOpaqueSize/2,
        6+10-cuvetteTransparentSize/2,
        2.5])
        cube([
            cuvetteOpaqueSize,
            cuvetteTransparentSize,
            2.6
        ]);
    for (i=[0:1]) {
        translate([25, 3+i*26, -0.01])
        cylinder(h=5.1, r=baseHoleRadius);
    }
}

for (i=[0:1]) {
    translate([35*i,6,5])
    //fiberPlace
    difference() {
        //Main cube
        cube([15, 20, 40]);

        //fiberHole
        translate([-0.1, 10, 25])
            rotate([0, 90, 0])
            cylinder(h=15.2, r=fiberRadius, center = false);
        translate([-0.1, 10-fiberRadius, 25.1])
            cube([15.2, fiberRadius*2 , 15]);

        //boltHoles
        for (j = [0:1]) {
            translate([7.5, 5+j*10, 40+0.1])
                rotate([0, 180, 0])
                cylinder(h=boltLenght+0.1, r=boltRadius, center = false);
        }
        //nutHoles
        translate([7.5-flatNutRadius, -0.1, 32-nutThickness])
            cube([2*flatNutRadius, 5.1+sharpNutRadius, nutThickness]);
        translate([7.5-flatNutRadius, 15-sharpNutRadius, 32-nutThickness])
            cube([2*flatNutRadius, 5.1+sharpNutRadius, nutThickness]);
    }
}
