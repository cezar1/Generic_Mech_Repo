include <../configuration/general.scad>;
PART_WIDTH=24;
PART_HEIGHT=14;
PART_WIDTH2=16;
PART_HEIGHT2=NUT_HEIGHT[SCREW_STANDARD_M6]*2;
PART_WIDTH3=12;
PART_HEIGHT3=7;
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
module hex_test3p1()
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
translate([0,2,-PART_HEIGHT3/2-0.1])
rotate([0,0,90])hex_hole(h_trap=NUT_HEIGHT[SCREW_STANDARD_M4],
         h_hole=PART_HEIGHT3-NUT_HEIGHT[SCREW_STANDARD_M4]+0.15,
         r_trap=SCREW_STANDARD_M4,
         rot=0);
force_hole_h=4;         
translate([0,12,-PART_HEIGHT3/2-0.1])
rotate([0,0,90])hex_hole(h_trap=force_hole_h,
         h_hole=PART_HEIGHT3-force_hole_h+0.15,
         r_trap=SCREW_STANDARD_M3,
         rot=0);     
    }
}
}
}
//hex_test2();
//translate([22,0,PART_WIDTH2/2-PART_HEIGHT2/2]) rotate([0,90,0]) hex_test2();

//rotate([0,180,0]) hex_test3p1();
//translate([10,0,PART_WIDTH3/2-PART_HEIGHT3/2]) rotate([0,90,0]) hex_test3p1();

/*
screws=[SCREW_STANDARD_M3,SCREW_STANDARD_M4,SCREW_STANDARD_M5,SCREW_STANDARD_M6];
*/
screws=[SCREW_STANDARD_M3,SCREW_STANDARD_M4];
translate_x=[0,22,22,38];
part_height=[22,23,24,44];
module screws()
{
    for (i=[0:len(screws)-1]){
        translate([translate_x[i],0,0])
        {
            hex_hole(h_trap=NUT_HEIGHT[screws[i]],
                 h_hole=part_height[i]-NUT_HEIGHT[screws[i]],
                 r_trap=screws[i],
                 rot=0,
                 horizontal=0);
            translate([0,0,part_height[i]])
            hex_hole(h_trap=NUT_HEIGHT[screws[i]],
                 h_hole=part_height[i]-NUT_HEIGHT[screws[i]],
                 r_trap=screws[i],
                 rot=180,
                 horizontal=0);
        }
    }
    for (i=[0:len(screws)-1]){
        translate([translate_x[i],part_height[i]/2,part_height[i]/2])
        rotate([90,0,0])
        {
            hex_hole(h_trap=NUT_HEIGHT[screws[i]],
                 h_hole=part_height[i]-NUT_HEIGHT[screws[i]],
                 r_trap=screws[i],
                 rot=0,
                 horizontal=1);
            translate([0,0,part_height[i]])
            hex_hole(h_trap=NUT_HEIGHT[screws[i]],
                 h_hole=part_height[i]-NUT_HEIGHT[screws[i]],
                 r_trap=screws[i],
                 rot=180,
                 horizontal=1);
        }
    }
}
module part_body()
{
    for (i=[0:len(screws)-1]){
        translate([translate_x[i],0,part_height[i]/2])
        {
            cubeX([part_height[i]-0.01,part_height[i]-0.01,part_height[i]-0.01],center=true);
        }
    }
}
module assembly()
{
    color([1,0,0])screws();
    color([0,1,0])part_body();
}
module stl_part()
{   
    difference()
    {
    color([0,1,0])part_body();
    color([1,0,0])screws();
    }
}
//assembly();
stl_part();
        