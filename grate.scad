BIG_DIA=50;
THICK1=2;
THICK2=20;
SMALL_DIA=10;
for(i=[-2.5,0,2.5]) translate([i,0,0])cube([1,BIG_DIA,THICK1],center=true);
for(i=[-2.5,0,2.5]) translate([0,i,0])cube([BIG_DIA,1,THICK1],center=true);    
difference(){
    union(){
cylinder(r=BIG_DIA/2,h=THICK1,center=true);
translate([0,0,-THICK2/2])cylinder(r=SMALL_DIA/2+THICK1,h=THICK2,center=true);
        
    }
    union()
    {
translate([0,0,-THICK2/2])cylinder(r=SMALL_DIA/2,h=THICK2+THICK1+0.1,center=true);
        for(i=[-BIG_DIA/4,BIG_DIA/4])
            for(j=[-BIG_DIA/4,BIG_DIA/4])
                translate([i,j]) cylinder(r=3,h=THICK2,center=true,$fn=16);
    }
}