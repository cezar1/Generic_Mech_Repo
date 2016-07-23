include <configuration/general.scad>;
module bracket_ring()
{
    INNER_RADIUS=15.5;
    THICKNESS=5;
    THICKNESS_ARM=10;
    HEIGHT=9;
    ARM_LENGTH1=10;
    ARM_LENGTH2=10;
    ARM_LENGTH3=90;//Protrusion
    difference(){
        union(){
            difference(){
                cylinder(r=INNER_RADIUS+THICKNESS/2,h=HEIGHT,center=true);
                cylinder(r=INNER_RADIUS,h=HEIGHT+0.1,center=true);
            }
            translate([0,INNER_RADIUS+ARM_LENGTH1/2,0])cube([THICKNESS_ARM,ARM_LENGTH1,HEIGHT],center=true);
            translate([0,-INNER_RADIUS-ARM_LENGTH2/2,0])cube([THICKNESS_ARM,ARM_LENGTH2,HEIGHT],center=true);
            difference(){
            translate([0,INNER_RADIUS+ARM_LENGTH1+ARM_LENGTH3/2,0])cube([THICKNESS,ARM_LENGTH3,HEIGHT],center=true);
            translate([0,INNER_RADIUS+ARM_LENGTH1+ARM_LENGTH3-THICKNESS*2,HEIGHT/4])cube([THICKNESS+0.1,THICKNESS+0.1,HEIGHT/2+0.1],center=true);
            }
        }
        union(){
            translate([THICKNESS_ARM/2+0.1,INNER_RADIUS+ARM_LENGTH1/2,0]) rotate([0,90,0]) rotate([0,0,90]) color ([1,0,0]) hex_hole(h_trap=NUT_HEIGHT_M3+0.2,h_hole=THICKNESS_ARM-NUT_HEIGHT_M3,r_trap=SCREW_STANDARD_M3,rot=180);
            translate([THICKNESS_ARM/2+0.1,-INNER_RADIUS-ARM_LENGTH2/2,0]) rotate([0,90,0]) rotate([0,0,90]) color ([1,0,0]) hex_hole(h_trap=NUT_HEIGHT_M3+0.2,h_hole=THICKNESS_ARM-NUT_HEIGHT_M3,r_trap=SCREW_STANDARD_M3,rot=180);
        }
    }
    
}
module half1()
{
    intersection()
    {
        bracket_ring();
        translate([50,0,0])#cube([100,300,100],center=true);
    }
}
module half2()
{
    intersection()
    {
        bracket_ring();
        translate([-50,0,0])#cube([100,300,100],center=true);
    }
}
half1();
translate([-10,0,0]) half2();