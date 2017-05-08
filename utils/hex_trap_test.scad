include <../configuration/general.scad>;
PART_WIDTH=24;
PART_HEIGHT=14;
PART_WIDTH2=16;
PART_HEIGHT2=NUT_HEIGHT[SCREW_STANDARD_M6]*2;
PART_WIDTH3=12;
PART_HEIGHT3=NUT_HEIGHT[SCREW_STANDARD_M4]*2;
module hex_test()
{
difference()
{
    union()
    {
        translate([0,-13,0]) cube([PART_WIDTH,72,PART_HEIGHT],center=true);
    }
 
    union()
    {
translate([0,-36,-PART_HEIGHT/2-0.1])
hex_hole(h_trap=NUT_HEIGHT[SCREW_STANDARD_M10],
         h_hole=PART_HEIGHT-NUT_HEIGHT[SCREW_STANDARD_M10]+0.15,
         r_trap=SCREW_STANDARD_M10,
         rot=0);
        
translate([0,-15,-PART_HEIGHT/2-0.1])
hex_hole(h_trap=NUT_HEIGHT[SCREW_STANDARD_M8],
         h_hole=PART_HEIGHT-NUT_HEIGHT[SCREW_STANDARD_M8]+0.15,
         r_trap=SCREW_STANDARD_M8,
         rot=0);

translate([0,1,-PART_HEIGHT/2-0.1])
hex_hole(h_trap=NUT_HEIGHT[SCREW_STANDARD_M6],
         h_hole=PART_HEIGHT-NUT_HEIGHT[SCREW_STANDARD_M6]+0.15,
         r_trap=SCREW_STANDARD_M6,
         rot=0);
         
translate([0,15,-PART_HEIGHT/2-0.1])
hex_hole(h_trap=NUT_HEIGHT[SCREW_STANDARD_M5],
         h_hole=PART_HEIGHT-NUT_HEIGHT[SCREW_STANDARD_M5]+0.15,
         r_trap=SCREW_STANDARD_M5,
         rot=0);     
    }
}
}

module hex_test2()
{
difference()
{
    union()
    {
        translate([0,7,0]) cube([PART_WIDTH2,33,PART_HEIGHT2],center=true);
    }
 
    union()
    {

color ([1,0,0]){
translate([0,1,-NUT_HEIGHT[SCREW_STANDARD_M6]*2/2-0.1])
hex_hole(h_trap=NUT_HEIGHT[SCREW_STANDARD_M6],
         h_hole=PART_HEIGHT2-NUT_HEIGHT[SCREW_STANDARD_M6]+0.15,
         r_trap=SCREW_STANDARD_M6,
         rot=0);
         
translate([0,15,-PART_HEIGHT2/2-0.1])
hex_hole(h_trap=NUT_HEIGHT[SCREW_STANDARD_M5],
         h_hole=PART_HEIGHT2-NUT_HEIGHT[SCREW_STANDARD_M5]+0.15,
         r_trap=SCREW_STANDARD_M5,
         rot=0);     
    }
}
}
}
module hex_test3()
{
difference()
{
    union()
    {
        translate([0,7,0]) cube([PART_WIDTH3,22,PART_HEIGHT3],center=true);
    }
 
    union()
    {

color ([1,0,0]){
translate([0,2,-NUT_HEIGHT[SCREW_STANDARD_M4]*2/2-0.1])
rotate([0,0,90])hex_hole(h_trap=NUT_HEIGHT[SCREW_STANDARD_M4],
         h_hole=PART_HEIGHT3-NUT_HEIGHT[SCREW_STANDARD_M4]+0.15,
         r_trap=SCREW_STANDARD_M4,
         rot=0);
         
translate([0,12,-PART_HEIGHT3/2-0.1])
rotate([0,0,90])hex_hole(h_trap=NUT_HEIGHT[SCREW_STANDARD_M3],
         h_hole=PART_HEIGHT3-NUT_HEIGHT[SCREW_STANDARD_M3]+0.15,
         r_trap=SCREW_STANDARD_M3,
         rot=0);     
    }
}
}
}
//hex_test2();
//translate([22,0,PART_WIDTH2/2-PART_HEIGHT2/2]) rotate([0,90,0]) hex_test2();

hex_test3();
translate([22,0,PART_WIDTH3/2-PART_HEIGHT3/2]) rotate([0,90,0]) hex_test3();
        