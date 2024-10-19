
include<rack_renamed.scad>


//include <holder_half.scad>

sled_cap();


/*translate([27,20,30+1])rotate([0,180,0])
difference(){
import("pinion.stl");
translate([7,0,-5])cylinder(r=3.2/2,h=30,$fn=30);
translate([-7,0,-5])cylinder(r=3.2/2,h=30,$fn=30);
}
*/

/*
include <sled_bottom.scad>
include <holder_half.scad>
include <rack_renamed.scad>
include <holder_half.scad>
*/
//translate([50,0,0]){include <sled_cap.scad>}

//holder_half_mod_toolchanger_combo();
//servo_linear_assy();
//servo_linear_assy();

/*
difference(){
import("sled_bottom.stl");
#translate([50,-20,0])cube([25,20,20]);
}
*/
//include <sled_bottom.scad>

module holder_half_mod(){
difference(){
union(){
import("/Users/richard/Documents/dr.robot/dr.robotlab_library/MG995_Servo_Linear_Actuator/files/holder_half.stl");
//color("pink")translate([-66.8-7.8,13.5,44])cube([6+1.5,30,10]);
//color("pink")translate([-66.8-7.8,13.5,44+10-2])cube([6+1.5,40,12]);
}

translate([-30-70+25,2-5,71])rotate([0,90,0]){
translate([7-4,35,-2])cylinder(r=3.8/2,h=200,$fn=30);
translate([7-4,35,-0])cylinder(r=8/2,h=3,$fn=30);
translate([7+7,41+11.25,-2])cylinder(r=3.8/2,h=200,$fn=30);
translate([7+7,41+11.25,-0])cylinder(r=8/2,h=3,$fn=30);
translate([7+18,35,-2])cylinder(r=3.8/2,h=200,$fn=30);
translate([7+18,35,-0])cylinder(r=8/2,h=3,$fn=30);
}
}
}


module holder_half_toolchanger(){
difference(){
union(){
import("/Users/richard/Documents/dr.robot/dr.robotlab_library/MG995_Servo_Linear_Actuator/files/holder_half.stl");
//color("pink")translate([-66.8-7.8,13.5,44])cube([6+1.5,30,10]);
//color("pink")translate([-66.8-7.8,13.5,44+10-2])cube([6+1.5,40,12]);
}

translate([-30-70+25,2-5,71])rotate([0,90,0]){
translate([7-4,35,-2])cylinder(r=3.8/2,h=200,$fn=30);
translate([7-4,35,-0])cylinder(r=8/2,h=3,$fn=30);
translate([7+7,41+11.25,-2])cylinder(r=3.8/2,h=200,$fn=30);
translate([7+7,41+11.25,-0])cylinder(r=8/2,h=3,$fn=30);
translate([7+18,35,-2])cylinder(r=3.8/2,h=200,$fn=30);
translate([7+18,35,-0])cylinder(r=8/2,h=3,$fn=30);
}
}
}


module holder_half_mod_toolchanger(){
difference(){
union(){
import("/Users/richard/Documents/dr.robot/dr.robotlab_library/MG995_Servo_Linear_Actuator/files/holder_half.stl");
//color("pink")translate([-66.8-7.8,13.5,44])cube([6+1.5,30,10]);
//color("pink")translate([-66.8-7.8,13.5,44+10-2])cube([6+1.5,40,12]);
}

translate([-30-70+25,2-5,71])rotate([0,90,0]){
translate([7-4,35,-2])cylinder(r=3.8/2,h=200,$fn=30);
translate([7-4,35,-0])cylinder(r=8/2,h=3,$fn=30);
translate([7+7,41+11.25,-2])cylinder(r=3.8/2,h=200,$fn=30);
translate([7+7,41+11.25,-0])cylinder(r=8/2,h=3,$fn=30);
translate([7+18,35,-2])cylinder(r=3.8/2,h=200,$fn=30);
translate([7+18,35,-0])cylinder(r=8/2,h=3,$fn=30);
}
}
}






module sled_cap(){

translate([45,0,0]) cube(size = [25.5,7.5,1.2]);

difference() {
    union(){
    translate([0,0,-3]) cube(size = [70.5,10.5,3]);
    //translate([0,0+7.7,-3]) cube(size = [70.5,2.75,3.2]);
    translate([0,0+7.7,-3]) cube(size = [70.5,2.75,3.5]);
    }
    translate([3.75,3.75,-8]) cylinder(h = 20, r = 1.75, $fn=20);
    translate([41.25,3.75,-8]) cylinder(h = 20, r = 1.75, $fn=20);
}

difference() {
    cube(size = [45,7.5,0.2]);
    translate([3.75,3.75,-8]) cylinder(h = 20, r = 1.75, $fn=20);
    translate([41.25,3.75,-8]) cylinder(h = 20, r = 1.75, $fn=20);
}

}

module holder_half_mod_toolchanger_combo(){

difference(){
union(){
translate([34.5,109.5,63])rotate([0,180,-90])holder_half_mod_toolchanger();
//translate([34.5-14,109.5-149,63])rotate([0,180,90])holder_half_mod_toolchanger();
}
//.translate([34.5-14,109.5-149,63])rotate([0,180,90])
//translate([41,-10+20-20,-20])cube([50,200,80]);
#translate([41.5,-10+30,-20])cube([50,35,80]);
translate([41-77,-10+20-20,-20])cube([50,200,80]);
#translate([41-77+60-1.5,-10+20-20+14+6.5,-20])cylinder(r=3.5/2,h=200,$fn=300);
#translate([41-77+60+8+0.5,-10+20-20+14+6.5,-20])cylinder(r=3.5/2,h=200,$fn=300);
/*
translate([41-77+60+8,-10+20-20+14,0+3])cylinder(r=8/2,h=200,$fn=300);
translate([41-77+60-1,-10+20-20+14,0+3])cylinder(r=8/2,h=200,$fn=300);
translate([41-77+60+8,-10+20-20+14+62,0+3])cylinder(r=8/2,h=200,$fn=300);
translate([41-77+60-1,-10+20-20+14+62,0+3])cylinder(r=8/2,h=200,$fn=300);
*/
translate([41-77+60-1-.5,-10+20-20+14+62-6.5,-20])cylinder(r=3.5/2,h=200,$fn=300);
translate([41-77+60+8.5,-10+20-20+14+62-6.5,-20])cylinder(r=3.5/2,h=200,$fn=300);
}
}


module servo_linear_assy(){
//translate([54,100-30+0.5,0])rotate([0,0,0])import("/Users/richard/Documents/dr.robot/dr.robotlab_library/MG995_Servo_Linear_Actuator/files/holder_half.stl");
//translate([34.5,109.5,63])rotate([0,180,-90])import("/Users/richard/Documents/dr.robot/dr.robotlab_library/MG995_Servo_Linear_Actuator/files/holder_half.stl");

//translate([34.5,109.5,63])rotate([0,180,-90])holder_half_mod();
//translate([70-8.5,70.7,34.5])rotate([0,180,90])sled_cap();
translate([70-8.5-68,70.7,34.5])rotate([0,180,90])mirror([0,1,0])sled_cap();

//translate([34.5-14,109.5-149,63])rotate([0,180,90])import("holder_half.stl");
//translate([34.5-14,109.5-149,63])rotate([0,180,90])holder_half_mod();
holder_half_mod_toolchanger_combo();
/*
difference(){
translate([54,100-30+0.5,0])rotate([0,0,180])import("/Users/richard/Documents/dr.robot/dr.robotlab_library/MG995_Servo_Linear_Actuator/files/holder_half.stl");
translate([36,100-30+0.5+50,0+11])rotate([90,0,0])cylinder(r=2.8/2,h=120,$fn=30);
translate([36-18,100-30+0.5+50,0+11])rotate([90,0,0])cylinder(r=2.8/2,h=120,$fn=30);
}
*/
//translate([54-54,-0,0])rotate([0,0,0])import("/Users/richard/Documents/dr.robot/dr.robotlab_library/MG995_Servo_Linear_Actuator/files/holder_half.stl");

//translate([50+4,-50+120+0.5,27.5])color("lime")rotate([0,180,90])import("sled_bottom_no_limit_switch_protrusion.stl");

translate([50+4-53.5,-50+120+0,27.5])color("lime")rotate([0,180,90])mirror([0,1,0])import("sled_bottom_no_limit_switch_protrusion.stl");


//translate([10-1,-10-15+20,30])rotate([0,0,90])color("pink")import("/Users/richard/Documents/dr.robot/dr.robotlab_library/MG995_Servo_Linear_Actuator/files/rack.stl");
//translate([10-1,-10-15+20,30])rotate([0,0,90])color("")rack();

//translate([10-1+37,-10-15+20,30])rotate([0,0,90])mirror([0,1,0])color("pink")import("/Users/richard/Documents/dr.robot/dr.robotlab_library/MG995_Servo_Linear_Actuator/files/rack.stl");
translate([10-1+37,-10-15+20-3,30])rotate([0,0,90])mirror([0,1,0])color("")rack();
translate([0,4,-0])rotate([0,0,0])

translate([1,0,0]){difference(){
//color("peru")import("pinion.stl");
}
translate([37-1,14-0-4,-13])rotate([0,0,90])servo();
}

}

module servo(){
 bcl = 0.4;
 color([bcl,bcl,bcl])
 cube([40.75,19.85,35]);
 difference(){
 color([bcl,bcl,bcl])translate([-(55.5-40.74)/2,0,35-8])cube([55.5,19.85,2.5]);
 translate([-(55.5-40.74)/2+3.8,0+4.5,35-8-10])cylinder(r=3.7/2,h=20);
 translate([-(55.5-40.74)/2+3.8,0+4.5+10,35-8-10])cylinder(r=3.7/2,h=20);
 translate([-(55.5-40.74)/2+3.8+49,0+4.5,35-8-10])cylinder(r=3.7/2,h=20);
 translate([-(55.5-40.74)/2+3.8+49,0+4.5+10,35-8-10])cylinder(r=3.7/2,h=20);
 }
/*
*/ 
 cl = 0.9;
 color([cl,cl,cl]){
 translate([10,10,30])cylinder(r=8/2,h=14);
 translate([10,10,41-6+8])difference(){
  cylinder(r=21/2,h=2);
  translate([0,7,-4])cylinder(r=2.6/2,h=20,$fn=30);
  translate([0,-7,-4])cylinder(r=2.6/2,h=20,$fn=30);
 }
 }
}




