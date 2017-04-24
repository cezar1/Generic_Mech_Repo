include <../configuration/general.scad>;
PART_HEIGHT=10;

difference()
{
#cube([20,50,PART_HEIGHT],center=true);
    union()
    {
translate([0,-15,-PART_HEIGHT/2-0.1])
hex_hole(h_trap=NUT_HEIGHT[SCREW_STANDARD_M8],
         h_hole=PART_HEIGHT-NUT_HEIGHT[SCREW_STANDARD_M8]+0.15,
         r_trap=SCREW_STANDARD_M8,
         rot=0);
echo(SCREW_CORE_DIA[SCREW_STANDARD_M8]);
echo(SCREW_HEAD_DIA[SCREW_STANDARD_M8]);

translate([0,0,-PART_HEIGHT/2-0.1])
hex_hole(h_trap=NUT_HEIGHT[SCREW_STANDARD_M6],
         h_hole=PART_HEIGHT-NUT_HEIGHT[SCREW_STANDARD_M6]+0.15,
         r_trap=SCREW_STANDARD_M6,
         rot=0);
         
translate([0,14,-PART_HEIGHT/2-0.1])
hex_hole(h_trap=NUT_HEIGHT[SCREW_STANDARD_M5],
         h_hole=PART_HEIGHT-NUT_HEIGHT[SCREW_STANDARD_M5]+0.15,
         r_trap=SCREW_STANDARD_M5,
         rot=0);     
    }
}

        