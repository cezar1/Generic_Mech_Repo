BIG_DIA=70;
THICK1=3;
THICK2=20;
SMALL_DIA=15;
//echo(BIG_DIA/4);
HOLES_SPACING=17;
module grate()
{
    for(i=[0]) translate([i,0,0])cube([2,BIG_DIA,THICK1],center=true);
    for(i=[0]) translate([0,i,0])cube([BIG_DIA,2,THICK1],center=true);    
    difference(){
        union(){
    cylinder(r=BIG_DIA/2,h=THICK1,center=true);
    translate([0,0,-THICK2/2])cylinder(r=SMALL_DIA/2+THICK1,h=THICK2,center=true);
            
        }
        union()
        {
    translate([0,0,-THICK2/2])cylinder(r=SMALL_DIA/2,h=THICK2+THICK1+0.1,center=true);
            for(i=[-HOLES_SPACING,HOLES_SPACING])
                for(j=[-HOLES_SPACING,HOLES_SPACING])
                    translate([i,j]) cylinder(r=3,h=THICK2,center=true,$fn=16);
        }
    }
}
rotate([180,0,0]) grate();