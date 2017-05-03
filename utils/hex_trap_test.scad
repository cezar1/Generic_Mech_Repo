include <../configuration/general.scad>;
PART_WIDTH=24;
PART_HEIGHT=14;

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
hex_test();
translate([22,0,PART_WIDTH/2-PART_HEIGHT/2]) rotate([0,90,0]) hex_test();
        