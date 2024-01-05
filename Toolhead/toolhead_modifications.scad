include<printable_lm3uu.scad>

hotend_mount_scadfix();

//ebb36_mount_scadfix();
//maxwell_coupling();
//toolhead_bottom_scadfix();
//mechanical_switch_x_endstop_arm_connector();
//toolhead_top_1_scadfix();


module maxwell_coupling(){
dowel_pin();
translate([0,0,-2])m5nut();
}

module toolhead_bottom_scadfix(){
difference(){ 
union(){
translate([0,-0.2,0])color("lime")import("toolhead-bottom.stl");
translate([47.5-0.21,-12.2-0.125,100-5])color("peru")cylinder(r=4.25,h=2.56,$fn=300);
translate([47.5-0.21,-12.2-0.2-26.525,100-5])color("peru")cylinder(r=4.25,h=2.56,$fn=300);

translate([47.5-0.21+9.72,-12.2-0.2+1+0.02,100-5-10+8])color("peru")cylinder(r=6.8/2,h=4.5,$fn=300);
translate([47.5-0.21+9.72,-12.2-0.2+1-28+0.17,100-5-10+8])color("peru")cylinder(r=6.8/2,h=4.5,$fn=300);

translate([47.5-0.21-2.85,-12.2-0.2-26.558+5-1.892,100-5-10+8-30-0.4])color("")rotate([90,0,0])cylinder(r=3.4/2,h=4.47,$fn=300);
translate([47.5-0.21-2.85+24,-12.2-0.2-26.558+5-1.892+0.16-1.287,100-5-10+8-30-0.4])color("")rotate([90,0,0])cylinder(r=3.4/2,h=4.47-1.28,$fn=300);
translate([47.5-0.21-2.85+24,-12.2-0.2-26.558+5-1.892+0.16,100-5-10+8-30-0.4+24])color("")rotate([90,0,0])cylinder(r=3.4/2,h=4.47,$fn=300);

translate([47.5-0.21-2.85-5+2.15,-12.2-0.2-26.558+5-1.892-12,100-5-10+8-30-0.4-8])color("")rotate([0,90,0])cylinder(r=3.4/2,h=4.47,$fn=300);
translate([47.5-0.21-2.85-5+2.15,-12.2-0.2-26.558+5-1.892-12+35.5,100-5-10+8-30-0.4-8+35.5])color("")rotate([0,90,0])cylinder(r=3.4/2,h=4.47,$fn=300);


difference(){
union(){
translate([74.8-5.25-0.25,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=5.5/2,h=6.78,$fn=300);
}
translate([74.8-5.25-0.25,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=3.95/2,h=18.3,$fn=300);
}
translate([0,-28.5,0])difference(){
union(){
translate([74.8-5.25-0.25+2.5,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=5.5/2,h=6.78-2.5,$fn=300);
}
translate([74.8-5.25-0.25,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=3.95/2,h=18.3,$fn=300);
}
difference(){
translate([70-5.25-0.25,-25.48-0.2,82.778])color("lightblue")cylinder(r=9.25/2,h=19.922-14.8,$fn=300);
translate([70-5.25-0.25,-25.48,80+3.3-2])cylinder(r=4.9/2,h=30,$fn=300);
translate([70-5.25-0.25+5-4,-25.48-5,80+3.3+1.5])cube([10,6.3-0,2.2]);
}
}
translate([70-5.25-0.25-5,-25.48-8.75,80+3.3+4.60-0.2])rotate([0,0,0])cube([11.2,17,3]);
translate([47.5-0.21+9.72,-12.2-0.2+1+0.1+0.02,100-5-10+8-1.5])color("peru")cylinder(r=6.15/2,h=27-8,$fn=300);
translate([47.5-0.21+9.72,-12.2-0.2+1-28+0.17,100-5-10+8-1.5])color("peru")cylinder(r=6.15/2,h=27-8,$fn=300);


translate([47.5-0.21,-12.2-0.2,100-5-10+8])color("peru")cylinder(r=3/2,h=27-8,$fn=300);
//#translate([47.5-0.21,-12.2-0.2-26.558,100-5-10])color("peru")cylinder(r=2.8/2,h=27,$fn=300);
translate([47.5-0.21,-12.2-0.2-26.558,100-5-10+8])color("peru")cylinder(r=3/2,h=27-8,$fn=300);

translate([47.5-0.21-2.85,-12.2-0.2-26.558+5-1.892,100-5-10+8-30-0.4])color("")rotate([90,0,0])cylinder(r=2.95/2,h=4.47,$fn=300);
translate([47.5-0.21-2.85+24,-12.2-0.2-26.558+5-1.892+0.16-1.287,100-5-10+8-30-0.4])color("")rotate([90,0,0])cylinder(r=2.95/2,h=4.47-1.28,$fn=300);
translate([47.5-0.21-2.85+24,-12.2-0.2-26.558+5-1.892+0.16,100-5-10+8-30-0.4+24])color("")rotate([90,0,0])cylinder(r=2.95/2,h=4.47,$fn=300);

translate([47.5-0.21-2.85-5+2.15,-12.2-0.2-26.558+5-1.892-12,100-5-10+8-30-0.4-8])color("")rotate([0,90,0])cylinder(r=2.95/2,h=4.47,$fn=300);
translate([47.5-0.21-2.85-5+2.15,-12.2-0.2-26.558+5-1.892-12+35.5,100-5-10+8-30-0.4-8+35.5])#color("")rotate([0,90,0])cylinder(r=2.95/2,h=4.47,$fn=300);


}
}



module hotend_mount_scadfix(){


translate([0,-28,0])difference(){
translate([47.5-0.21+10-0.2,-12.2-0.2+1,100.61])color("lime")cylinder(r=7/2,h=4.85,$fn=300);
translate([47.5-0.21+10-0.2,-12.2-0.2+1,100.61-2])color("lime")cylinder(r=6.15/2,h=15.85,$fn=300);
}


difference(){
translate([47.5-0.21+10-0.2,-12.2-0.2+1,100.61])color("lime")cylinder(r=7/2,h=4.85,$fn=300);
translate([47.5-0.21+10-0.2,-12.2-0.2+1,100.61-2])color("lime")cylinder(r=6.15/2,h=15.85,$fn=300);
}


difference(){
translate([47.5-0.21,-12.2-0.2,100.61])color("lime")cylinder(r=7/2,h=4.85,$fn=300);
translate([47.5-0.21,-12.2-0.2,100.61-1])color("lime")cylinder(r=6/2,h=14.85,$fn=300);
}
translate([0+0.05,-26.6,0])difference(){
translate([47.5-0.21,-12.2-0.2,100.61])color("lime")cylinder(r=7/2,h=4.85,$fn=300);
translate([47.5-0.21,-12.2-0.2,100.61-1])color("lime")cylinder(r=6/2,h=14.85,$fn=300);
}
//translate([47.5-0.21,-12.2-0.2,100.61])color("pink")lm8uu_pla(6.3,4.85,2.8);
//translate([47.5-0.21,-12.2-0.2-26.58,100.61])color("pink")lm8uu_pla(6.3,4.85,2.8);
translate([60-0.25,0-0.2,2.8])import("hotend-mount.stl");
}




module toolhead_top_1_scadfix(){
translate([0,-0.19,0])import("toolhead-top-1.stl");


//translate([70-5.25-0.25,-25.48,80+3.3-1])color("silver")cylinder(r=4.9/2,h=25,$fn=300);
difference(){
union(){
translate([47.5-0.21,-12.2-0.2,100-5+10.44])color("peru")cylinder(r=5.2/2,h=7.52,$fn=300);
translate([47.5-0.21,-12.2-0.2-26.558,100-5+10.44+4.9-4.9])color("peru")cylinder(r=5.2/2,h=7.52,$fn=300);
}
translate([47.5-0.21,-12.2-0.2,100-5+10.44-1])color("peru")cylinder(r=3.0/2,h=10.52,$fn=300);
translate([47.5-0.21-0.65,-12.2-0.2-3.3,100-5+10.44-1+5.15])color("peru")cylinder(r=3/2,h=10.52,$fn=300);
translate([47.5-0.21,-12.2-0.2-26.558,100-5+10.44-1])rotate([0,0,0])cylinder(r=3/2,h=50.52,$fn=300);
translate([47.5-0.21-20,-12.2-0.2-26.558-3,100-5+10.44-1+4])rotate([0,90,0])cylinder(r=4/2,h=50.52,$fn=300);
}
difference(){
translate([70-5.25-0.25,-25.48,80+3.3-1+23.34])color("lime")cylinder(r=9/2,h=5.9,$fn=300);
translate([70-5.25-0.25,-25.48,80+3.3-1+23.34-1])color("lime")cylinder(r=5.0/2,h=8.9,$fn=300);
}
}




module mechanical_switch_x_endstop_arm_connector(){
difference(){
union(){
translate([7,0+68,0])#cube([20,30,4]);
translate([10+13,0+68,0])#cube([65,12,4]);
}
translate([15,5+70,-3])#cylinder(r=5.8/2,h=30,$fn=300);
translate([15,5+70+16,-3])#cylinder(r=5.8/2,h=30,$fn=300);

translate([42,0,0]){
translate([33,5+72,-3])#cylinder(r=1.8/2,h=30,$fn=300);
translate([33+6.5,5+72,-3])#cylinder(r=1.8/2,h=30,$fn=300);
}
}
}


module ebb36_mount_scadfix(){
difference(){
union(){
translate([0,0,-1.8])import("ebb36-mount.stl");
translate([10.1,-40,182.74])color("purple")cube([10,3.1,4.9]);
#translate([10.1-1,-40-1.2,182.74-1.3])color("purple")cube([10+1,2.5,4.9+1.5]);

translate([-45,0,0]){
translate([10.1,-40,182.74])color("purple")cube([10,3.1,4.9]);
translate([10.1,-40-1.2,182.74-1])color("purple")cube([10,2.5,4.9]);
}
}
translate([-2.2,2,0.1]){
translate([10.1+4.5,-40+3+3,182.74+2])rotate([90,0,0])#cylinder(r=2.8/2,h=30,$fn=300);
translate([10.1+4.5-43.8,-40+3,182.74+2])rotate([90,0,0])#cylinder(r=2.8/2,h=30,$fn=300);
}
}
}


module m5nut(){
difference(){
cylinder(r=9.17/2,h=3.5,$fn=6);
translate([0,0,-1.1])#cylinder(r=3.95/2,h=7.5,$fn=300);
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
#translate([0,0,-10-4+3.2])#cylinder(r=3.95/2,h=17,$fn=300);
}
}





