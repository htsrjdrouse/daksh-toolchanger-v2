

dowel_pin();
translate([0,0,-2])m5nut();



module m5nut(){
difference(){
cylinder(r=9.17/2,h=3.5,$fn=6);
//translate([0,0,-1.1])cylinder(r=4.15/2,h=7.5,$fn=300);
translate([0,0,-1.1])#cylinder(r=3.9/2,h=7.5,$fn=300);
}
}


module dowel_pin(){
difference(){
union(){
cylinder(r=6/2,h=4,$fn=300);
translate([0,0,3])cylinder(r2=6/2,r1=6/2,h=4.3,$fn=300);
translate([0,0,3+4.4])cylinder(r2=5.9/2,r1=6/2,h=0.1,$fn=300);
}
//translate([0,0,-10-4-2+4])#cylinder(r=4.8/2,h=16,$fn=300);
translate([0,0,-10-4+3.2])#cylinder(r=3.9/2,h=17,$fn=300);
}
}



