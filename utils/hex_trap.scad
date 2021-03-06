//Screw standards
SCREW_STANDARD_M1=0;
SCREW_STANDARD_M1p5=1;
SCREW_STANDARD_M2=2;
SCREW_STANDARD_M2p5=3;
SCREW_STANDARD_M3=4;
SCREW_STANDARD_M3p5=5;
SCREW_STANDARD_M4=6;
SCREW_STANDARD_M4p5=7;
SCREW_STANDARD_M5=8;
SCREW_STANDARD_M5p5=9;
SCREW_STANDARD_M6=10;
SCREW_STANDARD_M6p5=11;
SCREW_STANDARD_M7=12;
SCREW_STANDARD_M7p5=13;
SCREW_STANDARD_M8=14;
SCREW_STANDARD_M8p5=15;
SCREW_STANDARD_M9=16;
SCREW_STANDARD_M9p5=17;
SCREW_STANDARD_M10=18;
SCREW_STANDARD_M10p5=19;
SCREW_STANDARD_M11=20;
SCREW_STANDARD_M11p5=21;
SCREW_STANDARD_M12=22;
SCREW_STANDARD_M12p5=23;

SCREW_HEAD_DIA=
//[   M1,   M1p5,   M2,    M2p5
[1,2,3,4.3,
//[   M3,   M3p5,   M4,    M4p5
6.7,7.35,8.25,8,
//[   M5,   M5p5,   M6,    M6p5
9.5,6,12,8,
//[   M7,   M7p5,   M8,    M8p5
5,6,15.3,8,
//[   M9,   M9p5,   M10,   M10p5
5,6,20.5,21,
//[   M11,  M11p5,  M12,   M12p5
21.5,21.5,22.5,24];

SCREW_CORE_DIA=
//[   M1,   M1p5,   M2,    M2p5
[1,2,3,2.4,
//[   M3,   M3p5,   M4,    M4p5
3.7,4.2,4.6,8,
//[   M5,   M5p5,   M6,    M6p5
5.9,6,6.50,8,
//[   M7,   M7p5,   M8,    M8p5
5,6,8.2,8,
//[   M9,   M9p5,   M10,   M10p5
5,6,11,11.5,
//[   M11,  M11p5,  M12,   M12p5
12,12.5,12.5,13];

SCREW_HEAD_DIA_HORIZONTAL=
//[   M1,   M1p5,   M2,    M2p5
[1,2,3,4.3,
//[   M3,   M3p5,   M4,    M4p5
6.75,7.35,8.20,8,
//[   M5,   M5p5,   M6,    M6p5
9.5,6,12,8,
//[   M7,   M7p5,   M8,    M8p5
5,6,15.3,8,
//[   M9,   M9p5,   M10,   M10p5
5,6,20.5,8,
//[   M11,  M11p5,  M12,   M12p5
21.5,21.5,22.5,24];

SCREW_CORE_DIA_HORIZONTAL=
//[   M1,   M1p5,   M2,    M2p5
[1,2,3,2.4,
//[   M3,   M3p5,   M4,    M4p5
3.7,4.2,4.6,8,
//[   M5,   M5p5,   M6,    M6p5
5.9,6,6.50,8,
//[   M7,   M7p5,   M8,    M8p5
5,6,8,8,
//[   M9,   M9p5,   M10,   M10p5
5,6,11,8,
//[   M11,  M11p5,  M12,   M12p5
12,12.5,12.5,13];

NUT_HEIGHT=
//[   M1,   M1p5,   M2,    M2p5
[1,2,3,1.8,
//[   M3,   M3p5,   M4,    M4p5
2,6,2.8,8,
//[   M5,   M5p5,   M6,    M6p5
4.5,6,5,8,
//[   M7,   M7p5,   M8,    M8p5
5,6,5,8,
//[   M9,   M9p5,   M10,   M10p5
5,6,8.6,9,
//[   M11,  M11p5,  M12,   M12p5
10,10.5,10,10.5];

module low_level_hex_hole(h_trap,h_hole,local_r_trap,local_r_hole,rot)
{
    rotate([rot,0,0]) {
        translate([0,0,h_hole])
            {
                cylinder(h = h_trap, r = local_r_trap, $fn = 6);
            }
        cylinder(h = h_hole, r = local_r_hole, $fn = 20);
    }
}
module low_level_sunk_hole(h_trap,h_hole,local_r_trap,local_r_hole,rot)
{
    rotate([rot,0,0]) {
        translate([0,0,h_hole])
            {
                hull()
                {
                translate([0,0,h_trap-1]) cylinder(h = 1, r = local_r_trap, $fn = 18);
                cylinder(h = 1, r = local_r_hole, $fn = 18);    
                }
            }
        cylinder(h = h_hole, r = local_r_hole, $fn = 20);
    }
}
module hex_hole(h_trap,h_hole,r_trap,rot,horizontal)
{
    low_level_hex_hole
    (h_trap=h_trap,
     h_hole=h_hole,
     local_r_trap=(horizontal==0)?SCREW_HEAD_DIA[r_trap]/2:SCREW_HEAD_DIA_HORIZONTAL[r_trap]/2,
     local_r_hole=(horizontal==0)?SCREW_CORE_DIA[r_trap]/2:SCREW_CORE_DIA_HORIZONTAL[r_trap]/2,
     rot=rot);
}
module sunk_hole(h_trap,h_hole,r_trap,rot,horizontal)
{
    low_level_sunk_hole
    (h_trap=h_trap,
     h_hole=h_hole,
     local_r_trap=(horizontal==0)?SCREW_HEAD_DIA[r_trap]/2:SCREW_HEAD_DIA_HORIZONTAL[r_trap]/2,
     local_r_hole=(horizontal==0)?SCREW_CORE_DIA[r_trap]/2:SCREW_CORE_DIA_HORIZONTAL[r_trap]/2,
     rot=rot);
}
module hex_hole_exit(h_trap,h_hole,r_trap,rot,l_exit,rot_exit)
{
    low_level_hex_hole(h_trap=h_trap,h_hole=h_hole,local_r_trap=make_r_for_screw_standard(r_trap),local_r_hole=make_r_hole_for_screw_standard(r_trap),rot=rot);
    rotate([rot,0,0]) translate([0,make_r_for_screw_standard(r_trap),h_hole]) rotate([0,0,rot_exit]) cube([l_exit,make_r_for_screw_standard(r_trap)*2,h_trap]);
    
}
module hex_hole_exit_tunnel(h_trap,h_hole,r_trap,rot,l_exit,rot_exit,l_tunnel)
{
    rotate([rot,0,0]) {
        translate([0,0,h_trap+h_hole-1])
        {
            cylinder(h = l_tunnel, r = make_r_hole_for_screw_standard(r_trap), $fn = 20);
        }
    }
    low_level_hex_hole(h_trap=h_trap,h_hole=h_hole,local_r_trap=make_r_for_screw_standard(r_trap),local_r_hole=make_r_hole_for_screw_standard(r_trap),rot=rot);
    rotate([rot,0,0]) translate([0,(r_trap),h_hole]) rotate([0,0,rot_exit]) cube([l_exit,(r_trap)*2,h_trap]);
    
}
module hex_hole_fill_bottom(h_trap,h_hole,r_trap,r_hole,rot)
{
    
    
    local_r_trap=make_r_for_screw_standard(r_trap);
    
    
    
    rotate([rot,0,0]) {
translate([0,0,h_hole-0.3])
{
	cylinder(h = 0.3, r = local_r_trap, $fn = 6);
}

	

}
}
module hex_hole_fill_top(h_trap,h_hole,r_trap,r_hole,rot)
{
    
    
    local_r_trap=make_r_for_screw_standard(r_trap);
    rotate([rot,0,0]) {


	cylinder(h = 0.3, r = r_hole, $fn = 20);

}
}
