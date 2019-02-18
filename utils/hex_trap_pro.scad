include <../configuration/general.scad>;


//screws=[SCREW_STANDARD_M3];translate_x=[0];part_height=[15];
//screws=[SCREW_STANDARD_M4];translate_x=[0];part_height=[18];
screws=[SCREW_STANDARD_M4];
translate_x=[0,20,22,38];
part_height=[18,23,24,44];
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
            /*
            translate([0,0,part_height[i]])
            hex_hole(h_trap=NUT_HEIGHT[screws[i]],
                 h_hole=part_height[i]-NUT_HEIGHT[screws[i]],
                 r_trap=screws[i],
                 rot=180,
                 horizontal=0);*/
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
            /*
            translate([0,0,part_height[i]])
            hex_hole(h_trap=NUT_HEIGHT[screws[i]],
                 h_hole=part_height[i]-NUT_HEIGHT[screws[i]],
                 r_trap=screws[i],
                 rot=180,
                 horizontal=1);*/
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
        