//include<../ToolLock/printable_lm3uu.scad>
//include<../ToolLock/printmgn12.scad>
include<../gantry/tslot.inc.scad>

include<../Dock/Dock_main.scad>

include <rack_renamed.scad>
include <microfluidics/multichannel_cameramount.scad>
include <holder_half.scad>


//toolhead_bottom_fix_improved_bambu_coolingfan_attach();
//bambulab_extruder();


translate([20,20,0]){
dowel_pin(4.2);
translate([0,0-0.0,-2.])m5nut(9.45);
//translate([0,0,-2])m5nut(9); //good for bottom
//translate([0,0,-2])m5nut(9.12); //good for top
}


/*
translate([80,-54.5+14.5,155.9-86.17])rotate([0,90,0])rotate([0,0,30]){
translate([20,20,0]){
dowel_pin(4.2);
//translate([0,0,-2])m5nut(9.38);
//translate([0,0,-2])m5nut(9); //good for bottom
translate([0,0,-2])m5nut(9.12); //good for top
}
}

*/

//mgn12_block();


//toolchange_openscad();
//translate([0,0,-1])toolhead_top_1_clone_openscad();
//parts_cooling_fan_screwattach_ring();
///color("lime")import("toolhead_bottom_fix_improved_bambu_coolingfan_attach.stl");
//toolhead_bottom_fix_improved_bambu_coolingfan_attach();
//translate([-20+1.8-1,1.539,-6.6])translate([200,0,225.5])rotate([0,180,0])mgn12_hole();
//import("toolhead_top_1_fix_nom3fittings_endstop_mechanicalwire.stl");

//translate([59.8,-0.15,0])toolheadtop2_fixed_nom3fittings_endstop();

//translate([12,0,0])toolchanger_linearactuator();
//ebb36_mount();
//translate([32,-22-2,45-1.25])scale([0.5,0.5,1])rotate([0,0,180])import("DuctIVSingle_base.stl");
//parts_cooling_fan_screwattach();

/*
difference(){
rotate([0,0,-20])import("DuctIVSingle.stl");
translate([-15,-30,-4])cube([50,80,20]);
}
*/
//ebb_mount();

/*
difference(){
import("servo_linear_assy_servo_holder_bottom.stl");
translate([24.5,0,-2])cube([6,100,5]);
}
*/

//translate([60+5-2+0-20,-2+2-46.5,8.8])rotate([0,0,180])import("parts-cooling-fan.stl");
//translate([60+5-2+0-20,-2+2-46.5,45])cube([20,20,5]);
//parts_cooling_fan_screwattach();
//color("lime")import("toolhead_bottom_fix_improved_bambu_coolingfan_attach.stl");
//import("toolhead_top_1_fix_nom3fittings_endstop_mechanicalwire.stl");
//translate([59.8,-0.15,0])toolheadtop2_fixed_nom3fittings_endstop();
//translate([0,0+5,-2+2.5])color("pink")import("../Dock/Dock_main_exp_2in1.stl");

//translate([60,0+5,-2+2.5])dock_main_mod_openscad();
//translate([60,0+5,-2+2.5])dock_main_mod();
//import("/Users/richard/Documents/voron/Trident/daksh_clean/Dock/Dock_main_exp_2in1.stl");


//dock_main_mod_openscad();
//translate([60,0+5,-2+2.5])dock_main_mod_openscad_servo_linearactuator();
//translate([5,200,90])rotate([90,0,0])tslot20(500);
//translate([12,0,0])toolchanger_linearactuator();

//holder_half_top();
//holder_half_bottom();


//color("lime")translate([64-1.5,-20,70-5])rotate([-90,0,90])import("servo_linear_assy_servo_holder_top.stl");
//color("")translate([64-1.5-61.5+1.5,-20+20,0])rotate([-0,0,0])holder_half_bottom();
//color("")translate([64-1.5-61.5+1.5,-20+20,0])rotate([-0,0,0])holder_half_top();

module bottom_filament_switch(){

translate([0.25,0,0]){
translate([60-2,-40+2,118.5-10])color("red")sphere(r=6.1/2, $fn=300);
translate([60-2,-40+2-0,118.5-10])color("red")rotate([-90,0,0])cylinder(r=6.1/2,h=6+0,$fn=300);
//translate([60-2-2.8-0,-40+2+4.2,118.5-4.8-20])color("red")cube([6+0,15+0,13.08+10]);
translate([60-2-2.8-0,-40+2+4.2,118.5-4.8-10-1.5])color("red")cube([6+0+6+5,15+0-2+0.5,13.08+3]);

translate([0,0.8,0]){
translate([60-2-30,-40+2+9,118.5-1.5-10])color("")rotate([0,90,0])cylinder(r=2.1/2,h=30,$fn=300);
translate([60-2-30,-40+2+9,118.5-1.5+6.5-10])color("")rotate([0,90,0])cylinder(r=2.1/2,h=30,$fn=300);
translate([60-2,-40+2+9,118.5-1.5+6.5-10])color("")rotate([0,90,0])cylinder(r=4/2,h=60,$fn=300);
translate([60-2,-40+2+9,118.5-1.5-10])color("")rotate([0,90,0])cylinder(r=4/2,h=60,$fn=300);
}
}


}





module holder_half_top(){
color("pink")translate([64-1.5,-19.5,70-5])rotate([-90,0,90])difference(){
holder_half();
translate([-18+1+41.5,0,-5])cube([5,30+100,10]);
translate([-18+1,0,-5])cube([30,30+100,60]);
translate([-18+1+58,10,-5])cube([30,30+100,60]);
}
}

module holder_half_bottom(){
color("lightblue")translate([64-1.5,-19.5+54,70-5-70])rotate([90,0,-90])difference(){
holder_half();
translate([-18+1+41.5,0,-5])cube([5,30+100,10]);
translate([-18+1,0+20,-5])cube([30,30+100,60]);
translate([-18+1+58,10-30,-5])cube([30,30+100,60]);
}
}


//toolchanger_linearactuator();


//color("lime")translate([64-1.5,-20,70-5])rotate([-90,0,90])import("servo_linear_assy_servo_holder_top.stl");

module toolchanger_linearactuator(){

servo_linear_actuator_rack_toolchanger();
ebb_mount();

toolchange_openscad();
translate([0,-55+4,63]){
color("lime")translate([64-1.5,-20,70-5])rotate([-90,0,90])import("servo_linear_assy_servo_holder_top.stl");
//color("lime")translate([64-1.5,-20,70-5])rotate([-90,0,90])holder_half_bottom();
color("")translate([64-1.5-61.5+1.5,-20+20,0])rotate([-0,0,0])holder_half_bottom();
color("")translate([64-1.5-61.5+1.5,-20+20,0])rotate([-0,0,0])holder_half_top();


color("black")translate([64,-20,70-5])rotate([-90,0,90])translate([37,14-0,-12])rotate([0,0,90])servo();
//color("lime")translate([64,-20,70-5])rotate([-90,0,90])import("servo_linear_assy.stl");
//translate([70-8.5,70.7,34.5])rotate([0,180,90])
color("pink")translate([60+6,-7.5-5,-6+20])rotate([0,-90,0])import("pinion.stl");
translate([37-1.0,35,65])rotate([0,90,0])mirror([0,1,0]){
translate([0,0,-0.0])color("lightblue")import("sled_bottom_no_limit_switch_protrusion.stl");
//color("peru")translate([0,-7.5,-6])import("sled_cap.stl");
}
}
}


module servo_linear_actuator_rack_toolchanger(){
translate([0,0,20]){
translate([35,-65+4,40])mirror([0,1,0])rotate([0,-90,0])rack();
translate([25,-35,37.5+27])rotate([0,180,0])pipette_p1000_noextrusion(8.3,0,"y",10);
}
}
//multichannel_cameramount_tipholder();
//translate([60,0,-2])dock_main_mod();


/*
translate([45+7,-32,160-20]){
rotate([90,0,90])color("grey")import("orbiter/orbiter_mockup.stl");
rotate([90,0,90])color("blue")import("orbiter/filament.stl");
}
*/
/*
translate([-82.5,422.3,-160-3]){
color("grey")import("sherpa_mini/sherpa_mini.stl");
color("peru")import("sherpa_mini/bowden_adapter.stl");
color("blue")import("sherpa_mini/filament.stl");
}
*/

/*
translate([52.7,-25.7-0.3,45.5])rotate([90,0,180]){
color("black")import("hotend_parts/hotend_grill.stl");
color("silver")import("hotend_parts/hotend.stl");
}

*/

//toolhead_bottom_fix_improved_bambu_coolingfan_attach();


//toolhead_bottom_fix_m4acorn();
//toolhead_top_1_fix_nom3fittings_endstop();

//import("../ToolLock/MGN12_Linear_Guide_centtocent_shorter.stl");
//mgn12_block();
//toolchange_openscad();

//import("Mk4ImprovedFanDuctV3.2.stl");
/*
union(){
import("toolhead_top_1_fix_nom3fittings_endstop_mechanicalwire.stl");
color("pink")import("toolhead_bottom_fix_improved_bambu_coolingfan_attach.stl");
toolhead_top_1_fix();
//color("lime")import("toolhead-top-2_fixed_nom3fittings_endstop_deeper.stl");
//translate([59.8,-0.15,0])toolheadtop2_fixed_nom3fittings_endstop();
//toolhead_bottom_fix_improved_bambu_coolingfan_attach();
//import("../ToolLock/MGN12_Linear_Guide_centtocent_shorter.stl");
}
*/

//translate([60+5-30,-2+2-60+12,8.8+35])translate([11,5,0])cylinder(r=2.9/2,h=30,$fn=300);


module ebb_mount(){

difference(){union(){
color("pink")translate([-20+5+0-2,1.539-2+4-11,-6.6+111])translate([80,-50,60])cube([20-5,25,20]);
color("pink")translate([-20-30+6+5,1.539+45-8-25-5,-6.6+111])translate([80,-50,60])cube([23.5,38.5,20]);
color("pink")translate([-20-30,1.539+45-8-46,-6.6+111])translate([80,-50,60])cube([15,23,20]);

translate([57.5,-8.75-10,0]){
difference(){
import("EBB36_Mount_mod.stl");
color("pink")translate([-20+5+0-2,1.539-2+4-11,-6.6+110])translate([-20,-25,75])cube([70,20,20]);
}


}
translate([47.5-0.21+26.25,-12.2-0.2-15-15-10,100-5-10+8-50+8.495+132])color("peru")cylinder(r=(6)/2,h=(9)/2,$fn=300);

}

translate([47.5-0.21+26-1.2,-12.2-0.2-15-15+40-47,100-5-10+8-50+8.495+90+43])color("")rotate([90,0,0])cylinder(r=(2.9)/2,h=(50)/2,$fn=300);


translate([47.5-0.21+26,-12.2-0.2-15-15,100-5-10+8-50+8.495+90])color("peru")cylinder(r=(3.7)/2,h=(167-15.79)/2,$fn=300);
translate([47.5-0.21+26-28,-12.2-0.2-15-15+36,100-5-10+8-50+8.495+90])color("peru")cylinder(r=(3.7)/2,h=(200)/2,$fn=300);
translate([0,0,27]){
translate([47.5-0.21+26,-12.2-0.2-15-15,100-5-10+8-50+8.495+90])color("peru")cylinder(r=(8.7)/2,h=(167-15.79)/2,$fn=300);
translate([47.5-0.21+26-28,-12.2-0.2-15-15+36,100-5-10+8-50+8.495+90])color("peru")cylinder(r=(11)/2,h=(200)/2,$fn=300);
}
//translate([47.5-0.21+26.25,-12.2-0.2-15-15-10,100-5-10+8-50+8.495+90])color("peru")cylinder(r=(2.9)/2,h=(167-15.79)/2,$fn=300);
//translate([47.5-0.21+26-28-11.9,-12.2-0.2-15-15+36-29.,100-5-10+8-50+8.495+90])color("peru")cylinder(r=(2.9)/2,h=(200)/2,$fn=300);

}

}





module toolhead_top_1_clone_openscad(){
translate([-0.0,0,0])difference(){
translate([0,0,10])union(){
translate([-20+5+0-22.57,1.539-2+0,-6.6+49.35+0-10])translate([80,-50,60])cube([20-5+0+22.5375,45+2,110-0-49.35+1.5-48+48+0]);
translate([-20+5,1.539+45-15,-6.6+49.35-10])translate([80,-50,60])cube([20-5-0.05,15,110+24-0-49.35-72+72]);
//translate([-20-30,1.539+45-8,-6.6+49.35])translate([80,-50,60])cube([20+20,8,111-0-49.35]);
}

translate([40,-48.5,85.4])cube([23,43.3,20]);
translate([40+23,-48.5+8.25,85.4])cube([8.5,27.3,20]);
translate([40+23,-48.5+8.25,85.4])cube([8.5,27.3,20]);
translate([40+23+8-6.4,-48.5+8.25+7.38,85.4])cube([8.6,27.3-12.4,20]);
translate([40+23+8-6.4+9,-48.5+8.25+7.38+5.6,45.6])cylinder(r=5.2/2,h=60,$fn=300);



translate([24-9+77,-63+146,5+175-8])rotate([0,90,-90])rotate([0,0,0])bottom_filament_switch();
//translate([66,-11,160])cylinder(r=2/2,h=30,$fn=300);

translate([0-5.15+16,14.75+15,0+43.5-4+70])translate([60-1.95,-40,59])color("lightblue")cylinder(r=2.0/2,h=150,$fn=300);
translate([0-5.15+23,14.75-8.7,0+43.5-4+30])translate([60-1.95,-40,59])color("lightblue")cylinder(r=2.9/2,h=150,$fn=300);
translate([0,0,-10]){
translate([0-5.15,14.75,0+43.5-4])translate([60-1.95,-40,59])color("lightblue")cylinder(r=2.6/2,h=150,$fn=300);
translate([0-5.15,14.75,0+43.5-4-6+2.1])translate([60-1.95,-40,59+14-5])color("lightblue")cylinder(r=(6.6-0)/2,h=11.2,$fn=300);
translate([0-5.15,14.75,0+43.5-4])translate([60-1.95,-40,59+14-5])color("lightblue")cylinder(r=(4.4-0)/2,h=11.2,$fn=300);
translate([0-5.15,14.75,0+43.5-4-3])translate([60-1.95,-40,59+14-5])color("lightblue")cylinder(r=(6.6-0)/2,h=3.2,$fn=300);
}


translate([60-1.95-10.7,-40+27.6,59+43.5-4])color("lightblue")cylinder(r=2.9/2,h=22,$fn=300);
translate([60-1.95-10.7+18.9,-40+27.6+2.6,59+43.5-4])color("lightblue")cylinder(r=2.9/2,h=22,$fn=300);
translate([60-1.95-10.7,-40+27.6-26.58,59+43.5-4])color("lightblue")cylinder(r=2.9/2,h=22,$fn=300);
translate([60-1.95-10.7+18.9,-40+27.6-26.58-4.7,59+43.5-4])color("lightblue")cylinder(r=2.9/2,h=22,$fn=300);
hull(){
translate([58-1.95-10.7+18.9-12,-40+27.6-26.58-4.7+3,135])rotate([90,0,0])cylinder(r=6/2,h=32,$fn=300);
translate([58-1.95-10.7+18.9-12,-40+27.6-26.58-4.7+3,119])rotate([90,0,0])cylinder(r=6/2,h=32,$fn=300);
}
hull(){
translate([60-1.95-10.7+18.9-12,-40+27.6-26.58-4.7+3,59+43.5-4])color("lightblue")cylinder(r=4/2,h=32,$fn=300);
translate([60-1.95-10.7+18.9-12,-44+27.6-26.58-4.7+3,59+43.5-4])color("lightblue")cylinder(r=4/2,h=32,$fn=300);
translate([60-1.95-10.7+18.9-6,-40+27.6-26.58-4.7+3,59+43.5-4])color("lightblue")cylinder(r=4/2,h=32,$fn=300);
translate([60-1.95-10.7+18.9+1,-40+27.6-26.58-4.7+6.5,59+43.5-4])color("lightblue")cylinder(r=5/2,h=32,$fn=300);
}
translate([0,0,0]){
translate([0-5.15+4-20,14.75-4.1-0,0+43.5-4-3.2])translate([60-1.95,-40,59+14-5+44.5])rotate([0,90,0])color("lightblue")cylinder(r=(6.6-1.25)/2,h=30.2,$fn=300);
translate([0-5.15+4-20,14.75-4.1-0,0+43.5-4-3.2])translate([60-1.95,-40,59+14-5+44.5])rotate([0,90,0])color("lightblue")cylinder(r=(8.3)/2,h=21.5,$fn=300);
translate([0-5.15+4-20,14.75-4.1-0+1,0+43.5-4-3.2])translate([60-1.95+12,-40+10,59+14-5+56.5])rotate([-90,0,0])cylinder(r=(5)/2,h=19.,$fn=300);
translate([0-5.15+4-20,14.75-4.1-0,0+43.5-4-3.2])translate([60-1.95,-40,59+14-5+44.5])rotate([0,90,0])color("lightblue")cylinder(r=(8.3)/2,h=19.,$fn=300);
}
translate([0,0,0]){
translate([0-5.15+4-20-8.5,14.75-4.1-0,0+43.5-4-3.2])translate([60-1.95,-40+8,59+14-5+44.5+2.5])rotate([0,90,0])color("lightblue")rotate([0,0,45])cylinder(r=(10.3)/2,h=19.,$fn=4);
translate([0-5.15+4-20-8.5,14.75-4.1-0,0+43.5-4-3.2])translate([60-1.95,-40+5,59+14-5+44.5+2.5])rotate([0,90,0])color("lightblue")rotate([0,0,45])cylinder(r=(10.3)/2,h=19.,$fn=4);
translate([0-5.15+4-20-8.5,14.75-4.1-0,0+43.5-4-3.2])translate([60-1.95-1.3,-40+13.1,59+14-5+44.5+12])rotate([0,90,0])rotate([0,0,45])cylinder(r=(4.5)/2,h=19.,$fn=300);
}
hull(){
translate([0-5.15+4-20,14.75-4.1-0,0+43.5-4-3.2+0.5])translate([60-1.95,-40,59+14-5+44.5])rotate([0,90,0])color("lightblue")cylinder(r=(8.3)/2,h=19.,$fn=300);
translate([0-5.15+4-20,14.75-4.1-1.5,0+43.5-4-3.2])translate([60-1.95,-40,59+14-5+44.5])rotate([0,90,0])color("lightblue")cylinder(r=(8.3)/2,h=19.,$fn=300);
}
translate([0-0.2,0,0]){
translate([0-5.15+4-9.3,14.75-4.1-1.5,0+43.5-4-3.2])translate([60-1.95,-40,59+14-5+44.5])rotate([0,90,0])color("lightblue")cylinder(r2=(8.3)/2,r1=12/2,h=3.3,$fn=300);
translate([0-5.15+4-9.3,14.75-4.1-1.5+1,0+43.5-4-3.2])translate([60-1.95,-40,59+14-5+44.5])rotate([0,90,0])color("lightblue")cylinder(r2=(8.3)/2,r1=12/2,h=3.3,$fn=300);
translate([0-5.15+4-9.3,14.75-4.1-1.5+1,0+43.5-4-3.2-0.5])translate([60-1.95,-40,59+14-5+44.5])rotate([0,90,0])color("lightblue")cylinder(r2=(8.3)/2,r1=12/2,h=3.3,$fn=300);
translate([0-5.15+4-9.3-6,14.75-4.1-1.5+1,0+43.5-4-3.2-0.5])translate([60-1.95,-40,59+14-5+44.5])rotate([0,90,0])color("lightblue")cylinder(r2=(12)/2,r1=12/2,h=6.3,$fn=300);
}
translate([0,0,0]){
hull(){
translate([0-5.15+4-20,14.75-4.1-1.5+9,0+43.5-4-3.2])translate([60-1.95,-40,59+14-5+44.5])rotate([0,90,0])color("lightblue")cylinder(r=(8.3)/2,h=22.5,$fn=300);
translate([0-5.15+4-20,14.75-4.1-1.5+12.5,0+43.5-4-3.2])translate([60-1.95,-40,59+14-5+44.5])rotate([0,90,0])color("lightblue")cylinder(r=(11.3)/2,h=22.5,$fn=300);
translate([0-5.15+4-20,14.75-4.1-1.5+15,0+43.5-4-3.2])translate([60-1.95,-40,59+14-5+44.5])rotate([0,90,0])color("lightblue")cylinder(r=(13.3)/2,h=22.5,$fn=300);
translate([0-5.15+4-20,14.75-4.1-1.5+15,0+43.5-4-3.2])translate([60-1.95,-40,59+14-5+43])rotate([0,90,0])color("lightblue")cylinder(r=(13.3)/2,h=22.5,$fn=300);
translate([0-5.15+4-20,14.75-4.1-1.5+17.6,0+43.5-4-5.3])translate([60-1.95,-40,59+14-5+43])rotate([0,90,0])color("lightblue")cylinder(r=(13.3)/2,h=22.5,$fn=300);
}
}
translate([0-5.15+4-20,14.75-4.1-1.5+19.6,0+43.5-4-6.4])translate([60-1.95,-40,59+14-5+43])rotate([0,90,0])color("lightblue")cylinder(r=(13.3)/2,h=22.5,$fn=300);
translate([0-5.15+4-20,14.75-4.1-1.5+21,0+43.5-4-8.3])translate([60-1.95,-40,59+14-5+43])rotate([0,90,0])color("lightblue")cylinder(r=(8.3)/2,h=22.5,$fn=300);
translate([0,0,0]){
translate([0,1,-2])hull(){
translate([0-5.15+4-20,14.75-4.1-1.5+23+5-0.4,0+43.5-4-11.8])translate([60-1.95,-45,59+14-5+39.3])rotate([0,90,0])color("lightblue")cylinder(r=(5.3)/2,h=22.5,$fn=300);
translate([0-5.15+4-20,14.75-4.1-1.5+23+5-3.3,0+43.5-4-19.5])translate([60-1.95,-45,59+14-5+39.3])rotate([0,90,0])color("lightblue")cylinder(r=(5.3)/2,h=22.5,$fn=300);
}
}
hull(){
translate([0-5.15+4-20,14.75-4.1-1.5+15,0+43.5-4-3.2])translate([60-1.95,-40,59+14-5+38])rotate([0,90,0])color("lightblue")cylinder(r=(5.3)/2,h=22.5,$fn=300);
translate([0-5.15+4-20,14.75-4.1-1.5+23+5-0.4,0+43.5-4-10.2])translate([60-1.95,-45,59+14-5+40.4])rotate([0,90,0])color("lightblue")cylinder(r=(5.3)/2,h=22.5,$fn=300);
}

translate([0-5.15+4-20,14.75-4.1-1.5+23+5-0.4,0+43.5-4-11.2])translate([60-1.95,-45,59+14-5+40.4])rotate([0,90,0])color("lightblue")cylinder(r=(5.3)/2,h=22.5,$fn=300);
translate([0-5.15+4-20,14.75-4.1-1.5+23+5-0.,0+43.5-4-12.2])translate([60-1.95,-45,59+14-5+40.4])rotate([0,90,0])color("lightblue")cylinder(r=(5.3)/2,h=22.5,$fn=300);
translate([0,0,0]){
hull(){
translate([0-5.15+4-20,14.75-4.1-1.5+25,0+43.5-4-15.3])translate([60-1.95,-40.9,59+14-5+38])rotate([0,90,0])color("lightblue")cylinder(r=(8.3)/2,h=22.5,$fn=300);
translate([0-5.15+4-20,14.75-4.1-1.5+25,0+43.5-4-15.3])translate([60-1.95,-41,59+14-5+36])rotate([0,90,0])color("lightblue")cylinder(r=(8.8)/2,h=22.5,$fn=300);
translate([0-5.15+4-20,14.75-4.1-1.5+25,0+43.5-4-15.3])translate([60-1.95,-42,59+14-5+34])rotate([0,90,0])color("lightblue")cylinder(r=(8.3)/2,h=22.5,$fn=300);
}

translate([0-5.15+4-20,14.75-4.1-1.5+25,0+43.5-4-15.3])translate([60-1.95,-42,59+14-5+32])rotate([0,90,0])color("lightblue")cylinder(r=(8.3)/2,h=22.5,$fn=4);
translate([0-5.15+4-20,14.75-4.1-1.5+24.5,0+43.5-4-14.7])translate([60-1.95,-42,59+14-5+32])rotate([0,90,0])color("lightblue")cylinder(r=(8.3)/2,h=22.5,$fn=4);
translate([0-5.15+4-20,14.75-4.1-1.5+22,0+43.5-4-7.8+25])translate([60-1.95,-40,59+14-5+43])rotate([0,90,0])color("lightblue")cube([47.5,30,22.5]);
translate([0-5.15+4-20,14.75-4.1-1.5+19,0+43.5-4-7.8+45])translate([60-1.95,-40,59+14-5+43])rotate([0,90,0])color("lightblue")cube([47.5,30,22.5]);
translate([0-5.15+4-20,14.75-4.1-1.5+16,0+43.5-4-7.8+13])translate([60-1.95,-40,59+14-5+43])rotate([0,90,0])color("lightblue")cube([12.5,30,22.5]);
}


hull(){
translate([0-5.15+4-20-10,14.75-4.1-1.5+25-8,0+43.5-4-15.3+2])translate([60-1.95,-40,59+14-5+40])rotate([0,90,0])color("lightblue")cylinder(r=(9.3)/2,h=22.5,$fn=300);
translate([0-5.15+4-20-10,14.75-4.1-1.5+25-8,0+43.5-4-15.3])translate([60-1.95,-40,59+14-5+40])rotate([0,90,0])color("lightblue")cylinder(r=(8.3)/2,h=22.5,$fn=300);
translate([0-5.15+4-20-10,14.75-4.1-1.5+25-9,0+43.5-4-9.3])translate([60-1.95,-40-0.5,59+14-5+40])rotate([0,90,0])rotate([0,0,55])color("lightblue")cylinder(r=(8.3)/2,h=22.5,$fn=4);
translate([0-5.15+4-20-10,14.75-4.1-1.5+25-6,0+43.5-4-18])translate([60-1.95,-40-0.5,59+14-5+40])rotate([0,90,0])rotate([0,0,90])color("lightblue")cylinder(r=(10.3)/2,h=22.5,$fn=4);
}
translate([0,0,0]){
translate([28.8,0,0]){
hull(){
hh = 4;
translate([0-5.15+4-20-10,14.75-4.1-1.5+25-8,0+43.5-4-15.3+2])translate([60-1.95,-40,59+14-5+40])rotate([0,90,0])color("lightblue")cylinder(r=(9.3)/2,h=hh,$fn=300);
translate([0-5.15+4-20-10,14.75-4.1-1.5+25-8,0+43.5-4-15.3])translate([60-1.95,-40,59+14-5+40])rotate([0,90,0])color("lightblue")cylinder(r=(8.3)/2,h=hh,$fn=300);
translate([0-5.15+4-20-10,14.75-4.1-1.5+25-9,0+43.5-4-9.3])translate([60-1.95,-40-0.5,59+14-5+40])rotate([0,90,0])rotate([0,0,55])color("lightblue")cylinder(r=(8.3)/2,h=hh,$fn=4);
translate([0-5.15+4-20-10,14.75-4.1-1.5+25-6,0+43.5-4-18])translate([60-1.95,-40-0.5,59+14-5+40])rotate([0,90,0])rotate([0,0,90])color("lightblue")cylinder(r=(10.3)/2,h=hh,$fn=4);
}
}
translate([0-5.15+4-20-10,14.75-4.1-1.5+25-9,0+43.5-4-14.3])translate([60-1.95,-40+0.7,59+14-5+40.3])rotate([0,90,0])color("lightblue")cylinder(r=(4.2)/2,h=122.5,$fn=300);
translate([0-5.15+4-20-10,14.75-4.1-1.5+25-9,0+43.5-4-14.3])translate([60-1.95+44,-40+0.7,59+14-5+40.3])rotate([0,90,0])color("lightblue")cylinder(r=(8.2)/2,h=22.5,$fn=300);
translate([0,-31,26.8]){
translate([0-5.15+4-20-10,14.75-4.1-1.5+25-9,0+43.5-4-14.3])translate([60-1.95,-40+0.7,59+14-5+40.3])rotate([0,90,0])color("lightblue")cylinder(r=(4.2)/2,h=122.5,$fn=300);
translate([0-5.15+4-20-10,14.75-4.1-1.5+25-9,0+43.5-4-14.3])translate([60-1.95+44,-40+0.7,59+14-5+40.3])rotate([0,90,0])color("lightblue")cylinder(r=(8.2)/2,h=22.5,$fn=300);
}

translate([0,-31+3.2,26.8-51.8]){
translate([0-5.15+4-20-10,14.75-4.1-1.5+25-9,0+43.5-4-14.3])translate([60-1.95,-40+0.7,59+14-5+40.3])rotate([0,90,0])color("lightblue")cylinder(r=(4.2)/2,h=122.5,$fn=300);
translate([0-5.15+4-20-10,14.75-4.1-1.5+25-9,0+43.5-4-14.3])translate([60-1.95+44,-40+0.7,59+14-5+40.3])rotate([0,90,0])color("lightblue")cylinder(r=(8.2)/2,h=22.5,$fn=300);
}

translate([90-5-5-0.231-45,-47.9+0.5,150-14-9-5])cube([30,9,13]);

translate([90-5-5-0.231-45-17,-47.9+0.5,150-14-9-5+12])cube([30,9+4,20]);



}

translate([-20+17-2.1-1,1.539,-6.6])mgn12_hole();
//translate([-20+17+200-5-10,1.539-57.78,-6.6])rotate([0,0,180])mgn12_hole();
translate([-20+1.8-1,1.539,-6.6])translate([200,0,225.5])rotate([0,180,0])mgn12_hole();

translate([0,0,0]){
translate([20-0.3+60-3.4+1.8-2,-27-0-0.2+16.8,150-0.3+24.2])color("pink")rotate([0,90,0])rotate([0,0,0])cylinder(r=9.5/2,h=21,$fn=300);
translate([20-0.3+60-3.4+1.8-2-5+0.35,-27-0-0.2+16.8-15,150-0.3+24.2-5.8])color("pink")cube([7-0.35,21.04,4+5.8+4]);
translate([20-0.3+60-3.4+1.8-2-5+0.35,-27-0-0.2+16.8-15,150-0.3+24.2-5.8-4])color("pink")cube([3,21.04,4+5.8+4-1]);
}
translate([59.8,-0.15,0]){
translate([90-5-5-0.231-120+16.5-2+1.5,-47.9+48-3.75-0.005+0.6,150-14+29])rotate([0,90,180])endstop_mod_top_2_fix_cut();
translate([47.5-0.21-70-3.2+0.05,-12.2-0.125+10-3-5.6+6.5-2.1,100-5+45-0.1+0.05])rotate([-90,0,0])color("pink")cylinder(r=6.2/2,h=3.1+10,$fn=300);
translate([47.5-0.21-70-3.2-0.48+0.32,-7-12.2-0.125+10-3-5.6+6.5-2.1+3-1,100-5+45-0.1+8.05-31])rotate([-90,0,0])color("pink")cylinder(r=4.1/2,h=20.1,$fn=300);
//magnet to make connection more secure
translate([47.5-0.21-70-3.2+0.05,-12.2-0.125+10-3-5.6+6.5-2.1,100-5+45-0.1+0.05-32])rotate([-90,0,0])color("pink")cylinder(r=6.2/2,h=3.5+10,$fn=300);
translate([47.5-0.21-70-3.2+0.05,-12.2-0.125+10-3-5.6+6.5-2.1,100-5+45-0.1+0.05-32+23])rotate([-90,0,0])color("pink")cylinder(r=6.2/2,h=3.5+10,$fn=300);
translate([47.5-0.21-70-3.2+0.05,-12.2-0.125+10-3-5.6+6.5-2.1,100-5+45-0.1+0.05-32+23+17])rotate([-90,0,0])color("pink")cylinder(r=6.2/2,h=3.5+10,$fn=300);
}
translate([47.5-0.21+26,-12.2-0.2-15,100-5-10+8-50+8.495])color("peru")cylinder(r=(6.7)/2,h=(67-15.79)/2,$fn=300);
translate([47.5-0.21+26,-12.2-0.2-15,100-5-10+8-50+8.495])color("peru")cylinder(r=(2.9)/2,h=(150),$fn=300);
translate([47.5-0.21+26,-12.2-0.2-15,100-5-10+8-50+8.495+90])color("peru")cylinder(r=(6.7)/2,h=(67-15.79)/2,$fn=300);
translate([47.5-0.21+26,-12.2-0.2-15-15,100-5-10+8-50+8.495+90])color("peru")cylinder(r=(2.9)/2,h=(167-15.79)/2,$fn=300);
translate([47.5-0.21+26-28,-12.2-0.2-15-15+36,100-5-10+8-50+8.495+90])color("peru")cylinder(r=(2.9)/2,h=(200)/2,$fn=300);
translate([34-0.075,0-4+0.45-3.1,70-1.35])rotate([-90,0,0])cylinder(r=6.1/2,h=10,$fn=300);
translate([34-0.075+38.5,0-4+0.45-3.1,70-1.35-8.8])rotate([-90,0,0])cylinder(r=6.1/2,h=10,$fn=300);
translate([34-0.075+38.7,0-4+0.45-3.1,70-1.35-8.8+78.6])rotate([-90,0,0])cylinder(r=6.1/2,h=10,$fn=300);
translate([34-0.075-0.2,0-4+0.45-3.1-9,70-1.35-7.7+30])rotate([-90,0,0])cylinder(r=4.1/2,h=20,$fn=300);
translate([0.1,0,0]){
translate([74.8-5.25-0.25+6.689,-25.48+12.85,62.4])rotate([0,90,0])color("pink")rotate([0,0,90])cylinder(r=9.5/2,h=14,$fn=6);
translate([0,-28.5/2-0.32,87.2])translate([74.8-5.25-0.25+6.689,-25.48+12.85,62.4])rotate([0,90,0])color("pink")rotate([0,0,90])cylinder(r=9.5/2,h=14,$fn=6);
translate([0,-28.5,0])translate([74.8-5.25-0.25+6.689,-25.48+12.85,62.4])rotate([0,90,0])color("pink")rotate([0,0,90])cylinder(r=9.5/2,h=14,$fn=6);
translate([90-5-5-0.231,-47.9,150-14])rotate([0,90,90])endstop_mod_cut();
translate([90-5-5-0.231-20,-47.9+0.5,150-14-9])cube([30,5,8]);
}
}
}




































module toolchange_openscad(){
translate([-0.0,0,0])difference(){
union(){
translate([-20+5+0,1.539-2+0,-6.6])translate([80,-50,60])cube([20-5,45-0-0,110-0]);
translate([-20+5,1.539+45-15,-6.6])translate([80,-50,60])cube([20-5,15,110+24-0]);
translate([-20-30,1.539+45-8,-6.6])translate([80,-50,60])cube([20+20,8,111-0]);
}
translate([66,-11,160])cylinder(r=2/2,h=30,$fn=300);
translate([-20-30,1.539+45-8-4,-6.6])translate([80,-50,60+4])cube([18,8,111-40]);
translate([0,0,3]){
translate([0,-48.5,120-5.4])rotate([0,90,0])cylinder(r=2.8/2,h=100,$fn=300);
translate([65,-48.5+5,120-5.4-3.5])rotate([0,0,0])cylinder(r=9/2,h=10,$fn=300);
translate([65+1,-48.5+5,120-5.4-3.5])rotate([0,0,0])cylinder(r=9/2,h=10,$fn=300);
translate([65+2,-48.5+5,120-5.4-3.5])rotate([0,0,0])cylinder(r=9/2,h=10,$fn=300);
translate([65+3,-48.5+5,120-5.4-3.5])rotate([0,0,0])cylinder(r=9/2,h=10,$fn=300);
translate([0,-48.5+10,120-5.4])rotate([0,90,0])cylinder(r=2.8/2,h=100,$fn=300);
translate([0,0,-49]){
translate([0,-48.5,120-5.4])rotate([0,90,0])cylinder(r=2.8/2,h=100,$fn=300);
translate([0,-48.5+10,120-5.4])rotate([0,90,0])cylinder(r=2.8/2,h=100,$fn=300);
}
translate([0,-55+4,60]){
//color("black")translate([64,-20,70-5])rotate([-90,0,90])translate([37,14-0,-12])rotate([0,0,90])servo();
//color("black")translate([64,-20+0.2,70-5])rotate([-90,0,90])translate([37,14-0,-12])rotate([0,0,90])servo();
color("black")translate([64+0.2,-20+0.2,70-5+0.2])rotate([-90,0,90])translate([37,14-0,-12])rotate([0,0,90])servo();
color("black")translate([64+0.2,-20+0.2,70-5-0.2])rotate([-90,0,90])translate([37,14-0,-12])rotate([0,0,90])servo();
}
}
translate([-20-30,1.539+45-8,-6.6])translate([91,-50,60+20])cube([20+20-16,8+1,111-40]);
translate([-20+17-2.1-1,1.539,-6.6])mgn12_hole();
//translate([-20+17+200-5-10,1.539-57.78,-6.6])rotate([0,0,180])mgn12_hole();
translate([-20+1.8-1,1.539,-6.6])translate([200,0,225.5])rotate([0,180,0])mgn12_hole();
translate([20-0.3+60-3.4+1.8-2,-27-0-0.2+16.8,150-0.3+24.2])color("pink")rotate([0,90,0])rotate([0,0,0])cylinder(r=9.5/2,h=21,$fn=300);
translate([20-0.3+60-3.4+1.8-2-5+0.35,-27-0-0.2+16.8-15,150-0.3+24.2-5.8])color("pink")cube([7-0.35,21.04,4+5.8+4]);
translate([20-0.3+60-3.4+1.8-2-5+0.35,-27-0-0.2+16.8-15,150-0.3+24.2-5.8-4])color("pink")cube([3,21.04,4+5.8+4-1]);
translate([59.8,-0.15,0]){
translate([90-5-5-0.231-120+16.5-2+1.5,-47.9+48-3.75-0.005+0.6,150-14+29])rotate([0,90,180])endstop_mod_top_2_fix_cut();
translate([47.5-0.21-70-3.2+0.05,-12.2-0.125+10-3-5.6+6.5-2.1,100-5+45-0.1+0.05])rotate([-90,0,0])color("pink")cylinder(r=6.2/2,h=3.1+10,$fn=300);
translate([47.5-0.21-70-3.2-0.48+0.32,-7-12.2-0.125+10-3-5.6+6.5-2.1+3-1,100-5+45-0.1+8.05-31])rotate([-90,0,0])color("pink")cylinder(r=4.1/2,h=20.1,$fn=300);
//magnet to make connection more secure
translate([47.5-0.21-70-3.2+0.05,-12.2-0.125+10-3-5.6+6.5-2.1,100-5+45-0.1+0.05-32])rotate([-90,0,0])color("pink")cylinder(r=6.2/2,h=3.5+10,$fn=300);
translate([47.5-0.21-70-3.2+0.05,-12.2-0.125+10-3-5.6+6.5-2.1,100-5+45-0.1+0.05-32+23])rotate([-90,0,0])color("pink")cylinder(r=6.2/2,h=3.5+10,$fn=300);
translate([47.5-0.21-70-3.2+0.05,-12.2-0.125+10-3-5.6+6.5-2.1,100-5+45-0.1+0.05-32+23+17])rotate([-90,0,0])color("pink")cylinder(r=6.2/2,h=3.5+10,$fn=300);
}
translate([47.5-0.21+26,-12.2-0.2-15,100-5-10+8-50+8.495])color("peru")cylinder(r=(6.7)/2,h=(67-15.79)/2,$fn=300);
translate([47.5-0.21+26,-12.2-0.2-15,100-5-10+8-50+8.495])color("peru")cylinder(r=(2.9)/2,h=(150),$fn=300);
translate([47.5-0.21+26,-12.2-0.2-15,100-5-10+8-50+8.495+90])color("peru")cylinder(r=(6.7)/2,h=(67-15.79)/2,$fn=300);
translate([47.5-0.21+26,-12.2-0.2-15-15,100-5-10+8-50+8.495+90])color("peru")cylinder(r=(2.9)/2,h=(167-15.79)/2,$fn=300);
translate([47.5-0.21+26-28,-12.2-0.2-15-15+36,100-5-10+8-50+8.495+90])color("peru")cylinder(r=(2.9)/2,h=(200)/2,$fn=300);
translate([34-0.075,0-4+0.45-3.1,70-1.35])rotate([-90,0,0])cylinder(r=6.1/2,h=10,$fn=300);
translate([34-0.075+38.5,0-4+0.45-3.1,70-1.35-8.8])rotate([-90,0,0])cylinder(r=6.1/2,h=10,$fn=300);
translate([34-0.075+38.7,0-4+0.45-3.1,70-1.35-8.8+78.6])rotate([-90,0,0])cylinder(r=6.1/2,h=10,$fn=300);
translate([34-0.075-0.2,0-4+0.45-3.1-9,70-1.35-7.7+30])rotate([-90,0,0])cylinder(r=4.1/2,h=20,$fn=300);
translate([0.1,0,0]){
translate([74.8-5.25-0.25+6.689,-25.48+12.85,62.4])rotate([0,90,0])color("pink")rotate([0,0,90])cylinder(r=9.5/2,h=14,$fn=6);
translate([0,-28.5/2-0.32,87.2])translate([74.8-5.25-0.25+6.689,-25.48+12.85,62.4])rotate([0,90,0])color("pink")rotate([0,0,90])cylinder(r=9.5/2,h=14,$fn=6);
translate([0,-28.5,0])translate([74.8-5.25-0.25+6.689,-25.48+12.85,62.4])rotate([0,90,0])color("pink")rotate([0,0,90])cylinder(r=9.5/2,h=14,$fn=6);
translate([90-5-5-0.231,-47.9,150-14])rotate([0,90,90])endstop_mod_cut();
translate([90-5-5-0.231-20,-47.9+0.5,150-14-9])cube([30,5,8]);
}
}
}


module mgn12_block(){
difference(){
translate([69,-33.5-0.2-0.025+0.025+0.025,129.5-0.2])cube([39.85,12+0.4+0.05-0.05-0.05,8+0.3+0.05-0.05-0.05]);
//translate([69,-33.5,129.5])cube([39.85,12,8]);
translate([-1.5+75-2+1+1.5+1-1.8+0.5,-27.5,100])color("pink")cylinder(r=3.1/2,h=100,$fn=300);
translate([-1.5+75+25+5,-27.5,100])color("pink")cylinder(r=3./2,h=100,$fn=300);
}
}



module mgn12_hole(){
//scale([1.0505,1.0505,1.05])import("../ToolLock/MGN12_Linear_Guide_centtocent_shorter.stl");
/*
translate([4,-1.5+0.15,0+6.5+0.16])scale([1.0,1.0,1.])import("../ToolLock/MGN12_Linear_Guide_centtocent_shorter.stl");
translate([4,-1.5+0.15,0+6.5+0.16+0.025])scale([1.0,1.0,1.])import("../ToolLock/MGN12_Linear_Guide_centtocent_shorter.stl");
translate([4,-1.5+0.15,0+6.5+0.16-0.025])scale([1.0,1.0,1.])import("../ToolLock/MGN12_Linear_Guide_centtocent_shorter.stl");
translate([4,-1.5+0.15+0.0-0.15,0+6.5+0.16+0.025])scale([1.0,1.0,1.])import("../ToolLock/MGN12_Linear_Guide_centtocent_shorter.stl");
translate([4,-1.5+0.15+0.0+0.15,0+6.5+0.16+0.025])scale([1.0,1.0,1.])import("../ToolLock/MGN12_Linear_Guide_centtocent_shorter.stl");
translate([4,-1.5+0.15+0.15,0+6.5+0.16-0.025])scale([1.0,1.0,1.])import("../ToolLock/MGN12_Linear_Guide_centtocent_shorter.stl");
translate([4,-1.5+0.15-0.15,0+6.5+0.16-0.025])scale([1.0,1.0,1.])import("../ToolLock/MGN12_Linear_Guide_centtocent_shorter.stl");
*/
translate([4,-1.5+0.15,0+6.5+0.16])mgn12_block();

//translate([75-2,-34.73,135.97])cube([54.3-13,11.604,8.4]);
//translate([75-2,-34.73+0.7,135.97+0.2])cube([54.3-13,11.604-5,8.4-.7]);
//translate([75-2,-34.73+0.75+3.8,135.97+0.2])cube([54.3-13,11.604-5,8.4-.7]);
}



//cube([20,20,20]);

//color("grey")import("toolhead_top_1_fix_nom3fittings_endstop_mechanicalwire.stl");


/*
translate([20,20,0]){
dowel_pin(4.4);
translate([0,0,-2])m5nut(9.35);
}
*/


/*
translate([0,20,0]){
dowel_pin(4);
translate([0,0,-2])m5nut(8.95);
}

translate([20,20,0]){
dowel_pin(4);
translate([0,0,-2])m5nut(8.95);
}



translate([20,0,0]){
dowel_pin(4.2);
translate([0,0,-2])m5nut(8.95);
}

translate([70,0,0]){
dowel_pin(4.2);
translate([0,0,-2])m5nut(8.95);
}
*/
/*

dowel_pin(3);
translate([0,0,-2])m5nut(8.85);

translate([50,0,0]){
dowel_pin(4);
translate([0,0,-2])m5nut(8.85);
}
*/

//led_diffuser();
//led_diffuser_back();

module led_diffuser(){
//translate([0,0,-3])import("bambulab_extruder.stl");
translate([80-4,-10.5,174])rotate([0,90,0])color("white")difference(){
cylinder(r=9.4/2,h=4,$fn=300);
translate([-2.5-4,-2.525,-1])cube([5.05+10,5.05,1.5+2]);
//translate([-2.5,-2.5-3,0])cube([5,5,1.5]);
}
}

module led_diffuser_back(){
//translate([0,0,-3])import("bambulab_extruder.stl");
//translate([80-4-4.6,-10.5-5,174+4.1+3.9])rotate([0,90,0])
color("pink")difference(){
//cylinder(r=9.5/2,h=4,$fn=300);
translate([80-4-4.2,-10.5-5,174+4.1+3.9+0])rotate([0,90,0])cube([13.8+0,10.2,4-1]);
translate([80-4-1-1.2,-10.5-1.25,174+6])rotate([0,90,0])translate([-2.5,-2.525,0])cube([5.05+10,5.05+2.5,1.5+2]);
translate([80-4-1-1.2,-10.5-1.25-2-0,174+6-5])rotate([0,90,0])translate([-2.5,-2.525,0])cube([5.05+2,5.05+2.5,1.5+2]);
}
}



//color("grey")import("toolhead_top_1_fix_nom3fittings_endstop_mechanicalwire.stl");
//import("filament-encoder.stl");

/*
color("white")translate([200,-30,290])rotate([-90,90,0])import("../filamentsensor/FilamentRunoutSensorcase.stl");
color("pink")translate([54,-22.5,-0])cylinder(r=1.75/2,h=300,$fn=300);
import("toolhead-top-2_fixed_nom3fittings_endstop.stl");
translate([60,0,0]){
import("EBB36_Mount_mod.stl");
import("filament-encoder.stl");
}
*/
//import("toolhead_top_1_fix_nom3fittings_endstop.stl");
//toolhead_top_1_fix_nom3fittings_endstop();
//toolhead_bottom_fix_improved_bambu_coolingfan_attach();

module toolhead_bottom_fix_improved_bambu_coolingfan_attach(){
difference(){
//import("toolhead_bottom_fix_improved.stl");
toolhead_bottom_fix_improved();
translate([60+5-30,-2+2-60+12,8.8+35])translate([11,5,0])cylinder(r=2.9/2,h=30,$fn=300);
translate([60+5-30+25,-0+2-60+12,8.8+35])translate([11,5,0])cylinder(r=2.9/2,h=30,$fn=300);
translate([60+5-30+26,30+-0+2-60+12,8.8+35])translate([11,5,0])cylinder(r=2.9/2,h=30,$fn=300);

translate([-20+1.8-1,1.539,-6.6])translate([200,0,225.5])rotate([0,180,0])mgn12_hole();

}
translate([0,0,-3])bambulab_extruder();

/*
translate([60+5-2,-2+2,8.8])import("parts-cooling-fan.stl");
translate([60+5-30,-2+2-60+12,8.8+35])difference(){
cube([16,10,8]);
translate([11,5,0])cylinder(r=8/2,h=3,$fn=300);
translate([11,5,0])cylinder(r=4/2,h=30,$fn=300);
}
*/
}




module parts_cooling_fan_screwattach_ring(){
//translate([60+5-30,-2+2-60+12,8.8+35])
difference(){
union(){
translate([32,-22-2,45-1.1])scale([0.5,0.5,1])rotate([0,0,180])import("DuctIVSingle_base.stl");
difference(){
union(){
hull(){
translate([60+5-2,-2+2,8.8+1.1])import("parts-cooling-fan.stl");
translate([60+5-2,-2+2,8.8])import("parts-cooling-fan.stl");
}
}
translate([60+5-30+10.5-5,-2+2-60+12+15-2-4,8.8+35])cube([15+2,15+14,20]);
translate([60+5-30+10.5-5-13,-2+2-60+12+15-2-4+5,8.8+38])cube([11,15+14-6,20]);
translate([60+5-30+10.5-5-13,-2+2-60+12+15-2-4+8,8.8+38])cube([13,15+14-16,20]);
}
//translate([60+5-2+0-20+3,-2+2-46.5,8.8])rotate([0,0,180])import("parts-cooling-fan.stl");
translate([60+5-30,-2+2-60+12,8.8+35])translate([0,0,0.10]){
translate([5,2+17-2,5.8])cube([10,13,3]);
//translate([5,2+17-2-12,5.8-5.8])cube([10,38,8.8]);
hull(){
translate([5,2+17-2-12,5.8-5.8])cube([2,9,8.8]);
translate([2,2,0])cube([7,10,7.7+1.1]);
}
translate([0,2,0])cube([19+18,6,7.7+1.1]);
hull(){
translate([5-8,1+28+11,0])cube([19+18-10-2+18,14.3-10,7.7+1.1]);
translate([5-8+35,1+28+11-1,0])cube([10,14.3-10,7.7+1.1]);
}
translate([5-8+40,1+28+11-1-37,0])cube([6,14.3+28,7.7+1.1]);
translate([5-8+40,1+28+11-1-37+8,0])cylinder(r=5,h=7.7+1.1,$fn=300);
translate([5-8+40,1+28+11-1-37+8+27,0])cylinder(r=4.5,h=7.7+1.1,$fn=300);
//translate([37,1,0])cube([12,39,7.7]);
}
}
translate([60+5-11,-2+2-23.5,8.8+20]){
cylinder(r=24/2,h=40,$fn=300);
}
translate([60+5-8-25,-2+2-60+12-2,8.8+35]){
translate([3,2,0]){
translate([11,5,0])cylinder(r=8/2,h=3,$fn=300);
translate([11,5,0])cylinder(r=4/2,h=30,$fn=300);
}
}
translate([60+5-8,-2+2-60+12,8.8+35]){
translate([3,2,0]){
translate([11,5,0])cylinder(r=8/2,h=3,$fn=300);
translate([11,5,0])cylinder(r=4/2,h=30,$fn=300);
}
}
translate([60+5-7,-2+2-60+12+30,8.8+35]){
translate([3,2,0]){
translate([11,5,0])cylinder(r=8/2,h=3,$fn=300);
translate([11,5,0])cylinder(r=4/2,h=30,$fn=300);
}
}
translate([0,0,4.5-0.4-2.79]){
translate([76,-15,47])cylinder(r=6.1/2,h=3.3,$fn=300);
translate([76,-15-22,47])cylinder(r=6.1/2,h=3.3,$fn=300);
}
//cube([]);
translate([5-8+40,1+28+11-1-37-50,52.7])cube([6+40,14.3+28,7.7+1.1]);

}
}


















module parts_cooling_fan_screwattach(){
//translate([60+5-30,-2+2-60+12,8.8+35])
difference(){
union(){
translate([32,-22-2,45-1.25])scale([0.5,0.5,1])rotate([0,0,180])import("DuctIVSingle_base.stl");
translate([60+5-2,-2+2,8.8])import("parts-cooling-fan.stl");
translate([60+5-2+0-20+3,-2+2-46.5,8.8])rotate([0,0,180])import("parts-cooling-fan.stl");
translate([60+5-30,-2+2-60+12,8.8+35])translate([0,0,0.10]){
translate([0,2,0])cube([10,10,7.7]);
translate([0,1,0])cube([19+18,15,7.7]);
translate([5,1+28,0])cube([19+18-10-2+2,14.3-3,7.7]);
translate([37,1,0])cube([12,39,7.7]);
}
}
translate([60+5-30+10.5,-2+2-60+12+15-2,8.8+35]){
cube([15+2,15+4,20]);
}
translate([60+5-30,-2+2-60+12,8.8+35]){
translate([3,34.5+1,4])rotate([0,90,0])cylinder(r=5/2,h=30,$fn=300);
//translate([3,34.5-2,4])rotate([0,90,0])cylinder(r=5/2,h=30,$fn=300);
}
translate([60+5-30,-2+2-60+12,8.8+35]){
translate([3,2,0]){
translate([11,5,0])cylinder(r=8/2,h=3,$fn=300);
translate([11,5,0])cylinder(r=4/2,h=30,$fn=300);
}
}
translate([0,0,4.5-0.4-2.79]){
translate([76,-15,47])cylinder(r=6.1/2,h=3.3,$fn=300);
translate([76,-15-22,47])cylinder(r=6.1/2,h=3.3,$fn=300);
}
}
}





//translate([-120-15,-215-7.5,-260])color("lime")rotate([90,0,-90])import("magprobe-stealthburner-mount.stl");
//toolhead_bottom_fix_improved();
//import("toolhead_bottom_fix_improved.stl");
//color("lime")import("toolhead-bottom.stl");

//toolhead_bottom_fix();




/*
difference(){
import("toolhead_bottom_fix_improved.stl");

translate([0-2,0,4.5-0.4+7.35]){
translate([76+1,-15-4.5,47-10+3])cylinder(r=6.1/2,h=3.3,$fn=300);
translate([76+1,-15-4.5-2+3.5,47-10+3])cylinder(r=3.1/2,h=3.3+2,$fn=300);
translate([76+1,-15-4.5-16.2,47-10+3])cylinder(r=6.1/2,h=3.3,$fn=300);
translate([76+1,-15-4.5-2+3.5-2.7-16.2+2.7,47-10+3])cylinder(r=3.1/2,h=3.3+2,$fn=300);
translate([76,-15-3,47+2-5])rotate([0,-90,0])cylinder(r=2/2,h=25.3,$fn=300);
translate([76,-15-2-23+5,47+2-5])rotate([0,-90,0])cylinder(r=2/2,h=25.3,$fn=300);
}

}
*/

//bambulab_extruder();
//translate([49,-35+3.8,70+12-0.05])rotate([0,0,0])bambulab_hotend();


//import("toolhead-top-1.stl");
//import("toolhead_top_1_fix_nom3fittings_endstop.stl");

//translate([30,-3.5,52])color("pink")detachable_probe();
//translate([49,-3.5,52+3.5-16.5])rotate([-90,0,0])endstop_mod();

/*
import("../ToolLock/lock-body-top-mod.stl");
translate([-4.28,-28.08,100-12.2])color("silver")cylinder(r=3/2,h=15,$fn=300);
translate([-4.28+9,-28.08,100-12.2])color("silver")cylinder(r=3/2,h=15,$fn=300);


translate([0+0.2,-20-2.83+1.5-1.5,95])color("pink")rotate([90,0,0])rotate([0,0,90]){
dowel_pin();
translate([0,0,-2])m5nut();
}
*/

//sensor_stub();


//translate([59.8,-0.15,0])toolheadtop2_fixed_nom3fittings_endstop();

/*


//translate([0,0,2])import("../ToolLock/MGN12_Linear_Guide_8mmlonger_minus3.5.stl");
//translate([-0.53-1.9,0.2,0])color("pink")import("../ToolLock/MGN12_Linear_Guide_10mmlonger.stl");
//translate([-0.53,0.2,0])color("pink")import("../ToolLock/MGN12_Linear_Guide_11.19mmlonger.stl");
//translate([-0.53,0.2,0])color("pink")import("../ToolLock/MGN12_Linear_Guide_11.09mmlonger.stl");



//import("toolhead_top_1_fix_mgn12_flushmodel.stl");
//color("pink")import("../ToolLock/MGN12_Linear_Guide_8mmlonger_minus3.5.stl");
//color("pink")translate([59.8,-0.15,0])toolhead_top_2_fixed_endstop();
//color("pink")import("../ToolLock/MGN12_Linear_Guide_8mmlonger_minus3.5.stl");
//color("pink")translate([59.8,-0.15,0])import("toolhead-top-2_fixed_nom3fittings_endstop.stl");
import("toolhead_top_1_fix_nom3fittings_endstop.stl");
import("toolhead_bottom_fix_improved.stl");
translate([35-1.56+0.3,-10,147.96])rotate([-90,0,0])color("silver")cylinder(r=4.0/2,h=12,$fn=300);
translate([35-1.56+0.3,-10,60.96])rotate([-90,0,0])color("silver")cylinder(r=4.0/2,h=12,$fn=300);
*/



//translate([60,0,-2])color("pink")import("../Dock/Dock_main_endstop_m4_m4selftap.stl");


//toolhead_bottom_fix_improved();

/*
translate([0,0,0]){
translate([35-1.56+0.3,-10,124.96-3-5])rotate([-90,0,0])color("silver")cylinder(r=4.0/2,h=32,$fn=300);
translate([35-1.56+0.3,-10,82.96+3+5])rotate([-90,0,0])color("silver")cylinder(r=4.0/2,h=32,$fn=300);
}
*/

//translate([59.8,-0.15,0])toolheadtop2_fixed_nom3fittings_endstop();
//translate([60,0,-2])dock_main_mod();
//color("orange")translate([59.78,0,-0.25])import("../Dock/dock-mount.stl");

/*
union(){
translate([30-0.11,-3.186,87])cube([10,12.692,35]);
translate([30-0.11-2,-3.186,87-3])cube([10,12.692,10]);
translate([30-0.11-2,-3.186,87-3-14.3])cube([1.4,12.692,15]);
translate([30-0.11-2,-3.186,87+30])cube([10,12.692,5]);
translate([30-0.11-2,-3.186,87+30])cube([1.4,12.692,24.3]);
}
*/
//toolhead_bottom_fix_improved();

//x_endstop_arm_connector();
//ebb36_mount();
//toolhead_top_1_fix();
//toolhead_top_1_fix_nom3fittings_endstop();
//import("toolhead_top_1_fix_nom3fittings_tmp.stl");
//toolhead_bottom_fix_improved();
//toolhead_bottom_fix();
//toolhead_top_2_fix();
//toolhead_bottom_fix_m4acorn();
//toolhead_bottom_fix();
//toolhead_bottom_fix_improved();

//import("toolhead-top-2_fixed_nom3fittings_endstop.stl");
//translate([90-5-5-0.231-120+16.5-2,-47.9+48-3.75-0.005,150-14+29])rotate([0,90,180])endstop_mod_top_2_fix_cut();

//translate([0,0,-2.2])color("silver")rotate([0,0,0])import("../Dock/Dock_main.stl");


//import("toolhead_top_1_fix_nom3fittings_endstop.stl");
//toolhead_top_1_fix_nom3fittings_endstop();
//toolhead_top_1_fix();
//translate([0,-0.19,0])import("toolhead-top-1.stl");
//translate([20-0.3+60-3.4+1.8,-27-0-0.2+16.8,150-0.3+24.2])color("pink")rotate([0,90,0])rotate([0,0,30])cylinder(r=15/2,h=2,$fn=300);

//cylinder(r2=10/2,r1=23/2,h=15);


//toolheadtop2_fixed_nom3fittings_endstop();



module sensor_stub(){
cylinder(r=4/2,h=3.7,$fn=300);
}


module toolheadtop2_fixed_nom3fittings_endstop(){
difference(){
toolhead_top_2_fix_endstop();
translate([90-5-5-0.231-120+16.5-2+1.5,-47.9+48-3.75-0.005+0.6,150-14+29])rotate([0,90,180])endstop_mod_top_2_fix_cut();
}
}

//translate([30,-3.5,52])color("pink")detachable_probe();

module toolhead_top_1_fix_nom3fittings_endstop(){
difference(){
import("toolhead_top_1_fix_nom3fittings.stl");
translate([90-5-5-0.231,-47.9,150-14])rotate([0,90,90])endstop_mod_cut();
translate([66,-11,160])cylinder(r=2/2,h=30,$fn=300);

}
}



module endstop_mod_top_2_fix_cut(){
//WMYCONGCONG 50 PCS Micro Switch AC 2A 125V 3 Pin SPDT Limit Micro Switch Long Hinge Lever
//difference(){
translate([-0.2,-0.2,-0.2])color("black")cube([12.8+0.4,6.5+0.4+5,5.7+0.4]);
//translate([-0.2,-0.2,-0.2])color("black")cube([12.8+0.4-4,6.5+0.4+6,5.7+0.4]);
translate([0,0,-5]){
//translate([12.8/2-6.5/2,5.2,0])cylinder(r=4/2,h=5,$fn=300);
//translate([12.8/2+6.5/2,5.2,0])cylinder(r=4/2,h=5,$fn=300);
translate([12.8/2-6.5/2,5.2,0])cylinder(r=1.9/2,h=18,$fn=300);
translate([12.8/2+6.5/2,5.2,0])cylinder(r=1.9/2,h=18,$fn=300);
//}
}
}








module endstop_mod(){
//WMYCONGCONG 50 PCS Micro Switch AC 2A 125V 3 Pin SPDT Limit Micro Switch Long Hinge Lever
difference(){
translate([-0.2,-0.2,-0.2])color("black")cube([12.8+0.4,6.5+0.4,5.7+0.4]);
translate([0,0,-5]){
//translate([12.8/2-6.5/2,5.2,0])cylinder(r=4/2,h=5,$fn=300);
//translate([12.8/2+6.5/2,5.2,0])cylinder(r=4/2,h=5,$fn=300);
translate([12.8/2-6.5/2,5.2,0])cylinder(r=1.8/2,h=18,$fn=300);
translate([12.8/2+6.5/2,5.2,0])cylinder(r=1.8/2,h=18,$fn=300);
}
}
}








module endstop_mod_cut(){
//WMYCONGCONG 50 PCS Micro Switch AC 2A 125V 3 Pin SPDT Limit Micro Switch Long Hinge Lever
//difference(){
translate([-0.2,-0.2-5,-0.2])color("black")cube([12.8+0.4,6.5+0.4+7+5,5.7+0.4]);
translate([0,0,-5]){
translate([12.8/2-6.5/2,5.2,0])cylinder(r=4/2,h=5,$fn=300);
translate([12.8/2+6.5/2,5.2,0])cylinder(r=4/2,h=5,$fn=300);
translate([12.8/2-6.5/2,5.2,0])cylinder(r=1.8/2,h=18,$fn=300);
translate([12.8/2+6.5/2,5.2,0])cylinder(r=1.8/2,h=18,$fn=300);
//}
}
}




module detachable_probe(){
//endstop_mod();
difference(){
union(){
translate([24,5,2])rotate([90,0,0])cylinder(r=13,h=3,$fn=300);
translate([0,0,-3])cube([15,5,25]);
translate([0,0,-3])cube([35,5,18]);
translate([33,0,-3])cube([15,5,18]);
translate([15,0,-3-16.6+7.5])cube([50-15-15,5,12]);
translate([0,-2,-3])cube([50-15+13,5,2.4]);
translate([1.5+2.35-0.065,0-2+15-10,16.65-7.7])rotate([90,0,0])cylinder(r=3.9/2,h=7,$fn=300);
}
//translate([19-0.5,0+1.9+3,-3-17])cube([13+1,6.5,6+9+15]);

translate([1.5+2.35+18.3,0-2+30,16.65-18.3-8.5])rotate([90,0,0])cylinder(r=1.8/2,h=134.15,$fn=300);
translate([1.5+2.35+18.3+6.5,0-2+30,16.65-18.3-8.5])rotate([90,0,0])cylinder(r=1.8/2,h=134.15,$fn=300);

translate([0,5.1,0]){
translate([1.5+2.35,0-2,16.65])rotate([90,0,0])cylinder(r=6.25/2,h=3.15,$fn=300);
translate([1.5+2.35+38.5,0-2,16.65-8.8])rotate([90,0,0])cylinder(r=6.25/2,h=3.15,$fn=300);
}
}
}

/*
import("toolhead_top_1_fix_nom3fittings.stl");
difference(){
translate([47.5-0.21+26-50+35.19-2.555,-12.2-0.2-26.558/2-1.6-2.1,100-5+0.64+53.15])rotate([0,90,0])color("lime")cylinder(r=12/2,h=6,$fn=300);
translate([47.5-0.21+26-50+35.19-8,-12.2-0.2-26.558/2-1.6-2.1,100-5+0.64+53.15])rotate([0,90,0])color("peru")cylinder(r=8.5/2,h=8,$fn=300);
}
*/

//import("toolhead-top-1.stl");

//translate([-90,0,0])toolhead_bottom_fix_improved();
//toolhead_bottom_fix_m4acorn();
//toolhead_bottom_fix_improved();
//import("toolhead_bottom_fix_m4acorn.stl");
//translate([47.5-0.21+26,-12.2-0.2-15,100-5-10+8-50+8.495])color("peru")cylinder(r=6/2,h=67-15.79,$fn=300);
//toolhead_bottom_fix_improved();

//toolhead_top_2_fix();

//hotend_mount_mod();

//color("pink")import("toolhead_bottom_fix.stl");

//toolhead_top_2_fix();
//color("pink")import("toolhead-top-2.stl");
//import("toolhead-top-2-v1.stl");
//bambulab_extruder();
//bambulab_hotend();

module bambulab_extruder(){
difference(){
union(){
hotend_mount_mod();
translate([49,-35+3.8,70+12]){
translate([7.4/2+0.2-5.7,11/2-5.6-3,0])cube([25,17,12]);
translate([7.4/2+0.2-5.7,11/2-5.6,0])cylinder(r=5/2,h=23.45,$fn=300);
translate([7.4/2+0.2-5.7,11/2+5.6,0])cylinder(r=5/2,h=23.45,$fn=300);
translate([7.4/2+0.2+5.7,11/2-5.6,0])cylinder(r=5/2,h=23.45,$fn=300);
translate([7.4/2+0.2+5.7,11/2+5.6,0])cylinder(r=5/2,h=23.45,$fn=300);
}
}
translate([49,-35+3.8,70+12-0.05])rotate([0,0,0])bambulab_hotend();
translate([49,-35+3.8,70+12]){
translate([-7+4.25+2,0,0]){
translate([-7.4/2-20,11/2+3.3,3.5])rotate([0,90,0])cylinder(r=6/2,h=25,$fn=300);
translate([-7.4/2-20,11/2-3.3,3.5])rotate([0,90,0])cylinder(r=6/2,h=25,$fn=300);
}
translate([-7.4/2-20,11/2+3.3,3.5])rotate([0,90,0])cylinder(r=3.3/2,h=25,$fn=300);
translate([-7.4/2-20,11/2-3.3,3.5])rotate([0,90,0])cylinder(r=3.3/2,h=25,$fn=300);
translate([-7.4/2-20+25,11/2+3.3,3.5])rotate([0,90,0])cylinder(r=3.2/2,h=25,$fn=300);
translate([-7.4/2-20+25,11/2-3.3,3.5])rotate([0,90,0])cylinder(r=3.2/2,h=25,$fn=300);

translate([2,0,-2]){
translate([-7.4/2-20+25+11-1,11/2+3.3,3.5])rotate([0,90,0])cylinder(r=6.45/2,h=4,$fn=6);
translate([-7.4/2-20+25+11-1,11/2-3.3,3.5])rotate([0,90,0])cylinder(r=6.45/2,h=4,$fn=6);
}
translate([-7.4/2-20+25+11-1+2,11/2+3.3,3.5])rotate([0,90,0])cylinder(r=6.45/2,h=4,$fn=6);
translate([-7.4/2-20+25+11-1+2,11/2-3.3,3.5])rotate([0,90,0])cylinder(r=6.45/2,h=4,$fn=6);

translate([7.4/2+0.2,11/2,-2])cylinder(r=3.1/2,h=70,$fn=300);
}

translate([61.2+3-0.5+2,-35,60])cube([20,20,60]);

}
}

module bambulab_hotend(){

difference(){
union(){
translate([-0.15/2,-0.15/2-0.3-0.55,0])cube([7.4+0.15,11+0.15+0.6+1.1,7.15]);
translate([0,11,0])cube([1.3,0.3,7]);
translate([7.4-1.3,11,0])cube([1.3,0.3,7]);
}
translate([7.4/2+0.2,11/2,-2])cylinder(r=3.1/2,h=70,$fn=300);
//translate([-7.4/2-20,11/2+3.3,3.5])rotate([0,90,0])cylinder(r=3.3/2,h=50,$fn=300);
//translate([-7.4/2-20,11/2-3.3,3.5])rotate([0,90,0])cylinder(r=3.3/2,h=50,$fn=300);
translate([0-0.1,-1+9.925-9.85+9.85,7-1.3])cube([7.4+0.2,3,1.3+0.5]);
}
}



module toolhead_top_2_fix_endstop(){
difference(){
union(){
translate([-30+0.425,-50.057+2.534,102.1+52.79])color("peru")cube([2.6+6.2-0.81+20-15.992,46.6-11.133,10]);
difference(){
translate([-30+0.425,-50.057+2.534,102.1+52.79-3])color("red")cube([2.6+6.2-0.81+20-15.992,4,10]);
translate([-30+0.425,-50.057+2.534+1-1.5,102.1+52.79-3-1])color("")rotate([-40,0,0])cube([2.6+6.2-0.81+20-15.992+1,4,10]);
}
translate([-30+0.425,-50.057+2.534-2.523,102.1+52.79-2.8])color("blue")cube([2.6+6.2-0.81+20-15.992-0-2.943,2.5,12.8]);
translate([-30+0.425,-50.057+2.534-2.523,102.1+52.79-2.8-7.94])color("green")cube([2.6+6.2-0.81+20-15.992-0-2.943,2.225,12.8]);
translate([-30+0.425,-50.057+2.534-2.523,102.1+52.79-2.8-7.94-4.64])color("red")cube([2.6+6.2-0.81+20-15.992-0-2.943,1.568,12.8]);
translate([-30+0.425,-50.057+2.534-2.523,102.1+52.79-2.8-7.94-4.64-22.9])color("red")cube([2.6+6.2-0.81+20-15.992-0-2.943,1.568,16.8]);
translate([-30+0.425,-50.057+2.534-2.523,102.1+52.79-2.8-7.94-4.64-22.9-18.51])color("blue")cube([2.6+6.2-0.81+20-15.992-0-2.943,1.568+4.559,16.8+4.2]);
translate([-30+0.425+2.94,-50.057+2.534-2.523+2.832,102.1+52.79-2.8-7.94-4.64-22.9-18.51+4+0.0])color("peru")cube([2.6+6.2-0.81+20-15.992-0-2.943,1.568+4.559+9.4,16.8+4.2-10.61]);

translate([-30+0.425+2.94,-50.057+2.534-2.523+2.832+28.92,102.1+52.79-2.8-7.94-4.64-22.9-18.51+4+0.0])color("red")cube([2.6+6.2-0.81+20-15.992-0-2.943,1.568+4.559+8.75,16.8+4.2-10.61]);
translate([-30+0.425+2.94,-50.057+2.534-2.523+2.832+28.92+8.176,102.1+52.79-2.8-7.94-4.64-22.9-18.51+4+0])color("green")cube([2.6+6.2-0.81+20-15.992-0-2.943,1.568+4.559+0.57,16.8+4.2-10.61+7]);

//translate([-30+0.425+2.94,3.6-50.057+2.534-2.523+2.832+28.92+8.176-10-23,102.1+52.79-2.8-7.94-4.64-22.9-18.51+4+22-1])
translate([-26.6349,-39.518+10,123.099+10])color("silver")rotate([0,90,0])cylinder(r1=25/2,r2=13/2,h=9,$fn=300);
translate([-30+0.425+2.94,3.6-50.057+2.534-2.523+2.832+28.92+8.176-10-23,102.1+52.79-2.8-7.94-4.64-22.9-18.51+4+22-1])
difference(){
translate([0,3,0])color("blue")cube([2.6+6.2-0.81+20-15.992-0-2.943+0.003,6+1.568+4.559+0.57+14.5-3,16.8+4.2-10.61+4.68+1]);
translate([0,33,-5])rotate([45,0,0])cube([2.6+6.2-0.81+20-15.992-0-2.943+0.003,6+1.568+4.559+0.57+14.5,16.8+4.2-10.61+4.68+1]);
translate([0,33-12,5])rotate([0,0,0])cube([2.6+6.2-0.81+20-15.992-0-2.943+0.003,6+1.568+4.559+0.57+14.5,16.8+4.2-10.61+4.68+1]);
}
translate([-30+0.425,-50.057,102.1])difference(){
translate([0,0,0])color("lime")cube([2.6+6.2-0.81,46.6,62.8]);
translate([0-3+15-6,50+30-100+13+8.8,20-5+3])rotate([0,0,0])cube([2.6+6.2-0.81+6,20-8,19-5]);
//translate([0-3,50+30,20])rotate([45,0,0])cube([2.6+6.2-0.81+6,46.6,62.8]);
//translate([0-3+4.2,50+30-2,20])rotate([45,0,0])cube([2.6+6.2-0.81-3.1,46.6,62.8]);
//translate([0-3+4.347,50-5.6,50-1.8+1.2])rotate([0,0,0])cube([2.6+6.2-0.81-3.33-0.055,2+1,62.8]);
//translate([0-3+4.347-3.7,50-5.6-10.5,50-1.8+3.8])rotate([-66,0,0])cube([2.6+6.2-0.81-3.33-0.055,2,32.8]);
}
//import("toolhead-top-2.stl");
translate([47.5-0.21-70-3.2,-12.2-0.125+10-3-5.6+6.5-2.1-4,100-5+45-0.1])rotate([-90,0,0])color("")cylinder(r=4.25-1,h=7,$fn=300);
}

//translate([-30+0.425+2.94,3.6-50.057+2.534-2.523+2.832+28.92+8.176-10-23,102.1+52.79-2.8-7.94-4.64-22.9-18.51+4+22-1])
translate([-26.634999999999998+1, -39.518-8.8-4.2, 123.09999999999998-6+16.35])
color("blue")cube([2.6+6.2-0.81+20-15.992-0-2.943+0.003,5,6]);

translate([-26.634999999999998, -39.518-8.8, 123.09999999999998-6+3])
color("blue")cube([2.6+6.2-0.81+20-15.992-0-2.943+0.003,9,16.8+4.2-10.61+4.68+1+4-3]);

translate([-26.634999999999998, -39.518-8.8, 123.09999999999998-6+4])
color("blue")cube([2.6+6.2-0.81+20-15.992-0-2.943+0.003,5.5,16.8+4.2-10.61+4.68+1+10-4]);

//translate([-30+0.425,-50.057,102.1])
//translate([0-3+4.347-3.7,50-5.6-10.5,50-1.8+3.8])rotate([-66,0,0])cube([2.6+6.2-0.81-3.33-0.055,2,32.8]);


translate([0,0,0]){
translate([-30+0.425-5,-50.057+21-0.1+0.1,102.1+30-0.48+0.25])color("lime")rotate([0,90,0])cylinder(r=(23-10.4)/2,h=30,$fn=300);
translate([5-30+0.425-5.1,-50.057+21-0.1+0.1,102.1+30-0.48+0.25])color("lime")rotate([0,90,0])cylinder(r=23/2,h=7.55-5,$fn=300);
translate([5-30+0.425-5.05,-50.057+21-0.1+0.1,102.1+30-0.48+0.25])color("lime")rotate([0,90,0])cylinder(r1=22/2,r2=12/2,h=7.55-5+9,$fn=300);
translate([-30+0.425-5+7,-50.057+21-0.1+0.1,102.1+30-0.48+0.25+16.7])color("lime")rotate([0,90,0])cylinder(r=28/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5,-50.057+21-0.1+0.1,102.1+30-0.48+0.25+16.7])color("lime")rotate([0,90,0])cylinder(r=8.2/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5-3,-50.057+21-0.1+0.1,102.1+30-0.48+0.25+16.7])color("lime")rotate([0,90,0])cylinder(r=(7.2-1)/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5,-50.057+21-0.1+0.1+10+6.25,102.1+30-0.48+0.25+16.7-0.3+0.02])color("lime")rotate([0,90,0])cylinder(r=(6.2-0.3)/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5-2,-50.057+21-0.1+0.1+10+6.25,102.1+30-0.48+0.25+16.7-0.3+0.02])color("lime")rotate([0,90,0])cylinder(r=(6.2-2.2)/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5,-50.057+21-0.1+0.1+10+6.25-32+0.2,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95])color("lime")rotate([0,90,0])cylinder(r=(4.2-0.3)/2,h=30,$fn=300);


//translate([-30+0.425-5+7-2+0.5+4.37,-50.057+21-0.1+0.1+10+6.25-32+0.2,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36])color("lime")rotate([0,90,0])cylinder(r=(5.2-0.65)/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5+4.37-6,-50.057+21-0.1+0.1+10+6.25-32+0.2,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36])color("lime")rotate([0,90,0])cylinder(r=(2.8)/2,h=30,$fn=300);


translate([-30+0.425-5+7-2+0.5+4.37-10,-50.057+21-0.1+0.1+10+6.25-32+0.2+30.50,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2])color("lime")rotate([0,90,0])cylinder(r=(2.9)/2,h=30,$fn=300);
//translate([-30+0.425-5+7-2+0.5+4.37-10-25+0.2+3.5,-50.057+21-0.1+0.1+10+6.25-32+0.2+30.5,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2])color("lime")rotate([0,90,0])cylinder(r=(6.5)/2,h=30,$fn=6);


//channel part in back
translate([10-30+0.425-5+7-2+0.5+4.37-10-25+0.2+5,-50.057+21-0.1+0.1+10+6.25-32+0.2+30.5+5.65,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2-8.55])color("lime")rotate([0,90,0])cylinder(r=(7.1)/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5+4.37-10-25+0.2+5+30-1.5,-50.057+21-0.1+0.1+10+6.25-32+0.2+30.5+5.65,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2-8.55-23+19])color("lime")rotate([0,0,0])cylinder(r=(6.1)/2,h=10,$fn=300);
translate([-30+0.425-5+7-2+0.5+4.37-10-25+0.2+5+30-1.5,-50.057+21-0.1+0.1+10+6.25-32+0.2+30.5+5.65,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2-8.55-23+19])color("lime")rotate([0,0,0])cylinder(r=(6.1)/2,h=10,$fn=300);
translate([-30+0.425-5+7-2+0.5+4.37-10-25+0.2+5+30-1.5-4,-50.057+21-0.1+0.1+10+6.25-32+0.2+30.5+5.65+0.1,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2-8.55-23+18])color("lime")rotate([0,0,45])cylinder(r=(6.1)/2,h=7,$fn=4);
//translate([-30+0.425-5+7-2+0.5+4.37-10-25+0.2+5+30-1.5-4+2,-50.057+21-0.1+0.1+10+6.25-32+0.2+30.5+5.65+0.1+0.65,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2-8.55-2+18])color("lime")rotate([0,0,45])cylinder(r=(6.1)/2,h=7,$fn=4);


//translate([-30+0.425-5+7-2+0.5+4.37-10-25+0.2+5+30-1.5-4+5.25,-50.057+21-0.1+0.1+10+6.25-32+0.2+30.5+5.65+0.1+0.65-10+0.29,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2-8.55-23])color("lime")rotate([0,0,45])cylinder(r=(6.1-1.30)/2,h=12-5.7,$fn=300);
//translate([-30+0.425-5+7-2+0.5+4.37-10-25+0.2+5+30-1.5-4+5.25,-50.057+21-0.1+0.1+10+6.25-32+0.2+30.5+5.65+0.1+0.65-10+0.29-20,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2-8.55-23])color("lime")rotate([0,0,45])cylinder(r=(6.1-1.30)/2,h=12-5.7,$fn=300);


translate([-30+0.425-5+7-2+0.5+4.37-10-25+0.2+5+30-1.5-4+5.25,-50.057+21-0.1+0.1+10+6.25-32+0.2+30.5+5.65+0.1+0.65-10+0.29,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2-8.55-23])color("lime")rotate([0,0,45])cylinder(r=(2.8)/2,h=12-1.7,$fn=300);
translate([-30+0.425-5+7-2+0.5+4.37-10-25+0.2+5+30-1.5-4+5.25,-50.057+21-0.1+0.1+10+6.25-32+0.2+30.5+5.65+0.1+0.65-10+0.29-20,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2-8.55-23])color("lime")rotate([0,0,45])cylinder(r=(2.8)/2,h=12-1.7,$fn=300);


translate([6-30+0.425-5+7-2+0.5+4.37-10-25+0.2+5+30-1.5-4+5.25,12.5-50.057+21-0.1+0.1+10+6.25-32+0.2+30.5+5.65+0.1+0.65-10+0.29-20,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2-8.55-23-2.55])color("lime")rotate([0,0,45])cylinder(r=(7.5-1.30)/2,h=12-5.7,$fn=300);

translate([-30+0.425-5+7-2+0.5-5,-50.057+21-0.1+0.1+10+6.25-32+0.2-1+0.02,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95-28.55])color("lime")rotate([0,90,0])cylinder(r=(4.2-0.3)/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5-5,-50.057+21-0.1+0.1+10+6.25-32+0.2-1+0.02,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95-28.55])color("lime")rotate([0,90,0])cylinder(r=(4.2-0.3)/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5+3.7,-50.057+21-0.1+0.1+10+6.25-32+0.2-1+0.02-0,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95-28.55])color("lime")rotate([0,90,0])cylinder(r=(6.25-0.3)/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5+3.7,-50.057+21-0.1+0.1+10+6.25-32+0.2-1+0.02-0,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95-28.55])color("lime")rotate([0,90,0])cylinder(r=(6.25-0.3)/2,h=30,$fn=300);


//translate([-30+0.425-5+7-2+0.5+3.7+0.8,-50.057+21-0.1+0.1+10+6.25-32+0.2-1+0.02-0+3.8,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95-28.55-11+0.2])color("lime")rotate([0,90,0])cylinder(r=(5.25-0.8)/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5+3.7+0.8-10,-50.057+21-0.1+0.1+10+6.25-32+0.2-1+0.02-0+3.8,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95-28.55-11+0.2])color("lime")rotate([0,90,0])cylinder(r=(2.8)/2,h=30,$fn=300);

//translate([0.08-30+0.425-5+7-2+0.5+3.7+0.8+0.45,-50.057+21-0.1+0.1+10+6.25-32+0.2-1+0.02-0+3.8+25.1,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95-28.55-11+0.2+55+1.8-5])color("lime")rotate([0,0,0])cylinder(r=(4.8)/2,h=30,$fn=300);
translate([0.08-30+0.425-5+7-2+0.5+3.7+0.8+0.45,-50.057+21-0.1+0.1+10+6.25-32+0.2-1+0.02-0+3.8+25.1,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95-28.55-11+0.2+55+1.8-5-3])color("lime")rotate([0,0,0])cylinder(r=(2.8)/2,h=30,$fn=300);


}

translate([47.5-0.21-70-3.2-0.48+0.32,-7-12.2-0.125+10-3-5.6+6.5-2.1+3,100-5+45-0.1+8.05])rotate([-90,0,0])color("pink")cylinder(r=4.1/2,h=8.1,$fn=300);
translate([47.5-0.21-70-3.2+0.05,-12.2-0.125+10-3-5.6+6.5-2.1,100-5+45-0.1+0.05])rotate([-90,0,0])color("pink")cylinder(r=6.2/2,h=3.1,$fn=300);
translate([47.5-0.21-70-3.2-0.48+0.32,-7-12.2-0.125+10-3-5.6+6.5-2.1+3,100-5+45-0.1+8.05-31])rotate([-90,0,0])color("pink")cylinder(r=4.1/2,h=20.1,$fn=300);
//magnet to make connection more secure
translate([47.5-0.21-70-3.2+0.05,-12.2-0.125+10-3-5.6+6.5-2.1,100-5+45-0.1+0.05-32])rotate([-90,0,0])color("pink")cylinder(r=6.2/2,h=3.5+10,$fn=300);
translate([47.5-0.21-70-3.2+0.05,-12.2-0.125+10-3-5.6+6.5-2.1,100-5+45-0.1+0.05-32+23])rotate([-90,0,0])color("pink")cylinder(r=6.2/2,h=3.5+10,$fn=300);
translate([47.5-0.21-70-3.2+0.05,-12.2-0.125+10-3-5.6+6.5-2.1,100-5+45-0.1+0.05-32+23+17])rotate([-90,0,0])color("pink")cylinder(r=6.2/2,h=3.5+10,$fn=300);
//translate([47.5-0.21-70-3.2+0.05,-12.2-0.125+10-3-5.6+6.5-2.1,100-5+45-0.1+0.05-32])rotate([-90,0,0])color("pink")cylinder(r=4.2/2,h=3.5+35,$fn=300);

}

translate([-30+0.425-5+7-2+0.5+4.37+7,28.5-50.057+21-0.1+0.1+10+6.25-32+0.155,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36+0.50])color("lime")rotate([0,90,0])cylinder(r1=(4.2)/2,r2=(3.7/2),h=2.6,$fn=300);


//translate([47.5-0.21-70-3.2,-12.2-0.125+10-3-5.6+6.5-2.1-4,100-5+45-0.1])rotate([-90,0,0])color("")cylinder(r=4.25-1,h=7,$fn=300);
}











module toolhead_top_2_fix(){
difference(){
union(){
translate([-30+0.425,-50.057+2.534,102.1+52.79])color("peru")cube([2.6+6.2-0.81+20-15.992,46.6-11.133,10]);
difference(){
translate([-30+0.425,-50.057+2.534,102.1+52.79-3])color("red")cube([2.6+6.2-0.81+20-15.992,4,10]);
translate([-30+0.425,-50.057+2.534+1-1.5,102.1+52.79-3-1])color("")rotate([-40,0,0])cube([2.6+6.2-0.81+20-15.992+1,4,10]);
}
translate([-30+0.425,-50.057+2.534-2.523,102.1+52.79-2.8])color("blue")cube([2.6+6.2-0.81+20-15.992-0-2.943,2.5,12.8]);
translate([-30+0.425,-50.057+2.534-2.523,102.1+52.79-2.8-7.94])color("green")cube([2.6+6.2-0.81+20-15.992-0-2.943,2.225,12.8]);
translate([-30+0.425,-50.057+2.534-2.523,102.1+52.79-2.8-7.94-4.64])color("red")cube([2.6+6.2-0.81+20-15.992-0-2.943,1.568,12.8]);
translate([-30+0.425,-50.057+2.534-2.523,102.1+52.79-2.8-7.94-4.64-22.9])color("red")cube([2.6+6.2-0.81+20-15.992-0-2.943,1.568,16.8]);
translate([-30+0.425,-50.057+2.534-2.523,102.1+52.79-2.8-7.94-4.64-22.9-18.51])color("blue")cube([2.6+6.2-0.81+20-15.992-0-2.943,1.568+4.559,16.8+4.2]);
translate([-30+0.425+2.94,-50.057+2.534-2.523+2.832,102.1+52.79-2.8-7.94-4.64-22.9-18.51+4+0.0])color("peru")cube([2.6+6.2-0.81+20-15.992-0-2.943,1.568+4.559+9.4,16.8+4.2-10.61]);
translate([-30+0.425+2.94,-50.057+2.534-2.523+2.832+28.92,102.1+52.79-2.8-7.94-4.64-22.9-18.51+4+0.0])color("red")cube([2.6+6.2-0.81+20-15.992-0-2.943,1.568+4.559+8.75,16.8+4.2-10.61]);
translate([-30+0.425+2.94,-50.057+2.534-2.523+2.832+28.92+8.176,102.1+52.79-2.8-7.94-4.64-22.9-18.51+4+0])color("green")cube([2.6+6.2-0.81+20-15.992-0-2.943,1.568+4.559+0.57,16.8+4.2-10.61+7]);

//translate([-30+0.425+2.94,3.6-50.057+2.534-2.523+2.832+28.92+8.176-10-23,102.1+52.79-2.8-7.94-4.64-22.9-18.51+4+22-1])
translate([-26.6349,-39.518+10,123.099+10])color("silver")rotate([0,90,0])cylinder(r1=25/2,r2=13/2,h=9,$fn=300);
translate([-30+0.425+2.94,3.6-50.057+2.534-2.523+2.832+28.92+8.176-10-23,102.1+52.79-2.8-7.94-4.64-22.9-18.51+4+22-1])
difference(){
translate([0,3,0])color("blue")cube([2.6+6.2-0.81+20-15.992-0-2.943+0.003,6+1.568+4.559+0.57+14.5-3,16.8+4.2-10.61+4.68+1]);
translate([0,33,-5])rotate([45,0,0])cube([2.6+6.2-0.81+20-15.992-0-2.943+0.003,6+1.568+4.559+0.57+14.5,16.8+4.2-10.61+4.68+1]);
translate([0,33-12,5])rotate([0,0,0])cube([2.6+6.2-0.81+20-15.992-0-2.943+0.003,6+1.568+4.559+0.57+14.5,16.8+4.2-10.61+4.68+1]);
}
translate([-30+0.425,-50.057,102.1])difference(){
translate([0,0,0])color("lime")cube([2.6+6.2-0.81,46.6,62.8]);
translate([0-3+15-6,50+30-100+13+8.8,20-5+3])rotate([0,0,0])cube([2.6+6.2-0.81+6,20-8,19-5]);
translate([0-3,50+30,20])rotate([45,0,0])cube([2.6+6.2-0.81+6,46.6,62.8]);
translate([0-3+4.2,50+30-2,20])rotate([45,0,0])cube([2.6+6.2-0.81-3.1,46.6,62.8]);
translate([0-3+4.347,50-5.6,50-1.8+1.2])rotate([0,0,0])cube([2.6+6.2-0.81-3.33-0.055,2+1,62.8]);
translate([0-3+4.347-3.7,50-5.6-10.5,50-1.8+3.8])rotate([-66,0,0])cube([2.6+6.2-0.81-3.33-0.055,2,32.8]);
}
//import("toolhead-top-2.stl");
translate([47.5-0.21-70-3.2,-12.2-0.125+10-3-5.6+6.5-2.1-4,100-5+45-0.1])rotate([-90,0,0])color("")cylinder(r=4.25-1,h=7,$fn=300);
}

//translate([-30+0.425+2.94,3.6-50.057+2.534-2.523+2.832+28.92+8.176-10-23,102.1+52.79-2.8-7.94-4.64-22.9-18.51+4+22-1])
translate([-26.634999999999998+1, -39.518-8.8-4.2, 123.09999999999998-6+16.35])
color("blue")cube([2.6+6.2-0.81+20-15.992-0-2.943+0.003,5,6]);

translate([-26.634999999999998, -39.518-8.8, 123.09999999999998-6+3])
color("blue")cube([2.6+6.2-0.81+20-15.992-0-2.943+0.003,9,16.8+4.2-10.61+4.68+1+4-3]);

translate([-26.634999999999998, -39.518-8.8, 123.09999999999998-6+4])
color("blue")cube([2.6+6.2-0.81+20-15.992-0-2.943+0.003,5.5,16.8+4.2-10.61+4.68+1+10-4]);

translate([-30+0.425,-50.057,102.1])
translate([0-3+4.347-3.7,50-5.6-10.5,50-1.8+3.8])rotate([-66,0,0])cube([2.6+6.2-0.81-3.33-0.055,2,32.8]);

translate([0,0,0]){
translate([-30+0.425-5,-50.057+21-0.1+0.1,102.1+30-0.48+0.25])color("lime")rotate([0,90,0])cylinder(r=(23-10.4)/2,h=30,$fn=300);
translate([5-30+0.425-5.1,-50.057+21-0.1+0.1,102.1+30-0.48+0.25])color("lime")rotate([0,90,0])cylinder(r=23/2,h=7.55-5,$fn=300);
translate([5-30+0.425-5.05,-50.057+21-0.1+0.1,102.1+30-0.48+0.25])color("lime")rotate([0,90,0])cylinder(r1=22/2,r2=12/2,h=7.55-5+9,$fn=300);
translate([-30+0.425-5+7,-50.057+21-0.1+0.1,102.1+30-0.48+0.25+16.7])color("lime")rotate([0,90,0])cylinder(r=28/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5,-50.057+21-0.1+0.1,102.1+30-0.48+0.25+16.7])color("lime")rotate([0,90,0])cylinder(r=8.2/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5-3,-50.057+21-0.1+0.1,102.1+30-0.48+0.25+16.7])color("lime")rotate([0,90,0])cylinder(r=(7.2-1)/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5,-50.057+21-0.1+0.1+10+6.25,102.1+30-0.48+0.25+16.7-0.3+0.02])color("lime")rotate([0,90,0])cylinder(r=(6.2-0.3)/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5-2,-50.057+21-0.1+0.1+10+6.25,102.1+30-0.48+0.25+16.7-0.3+0.02])color("lime")rotate([0,90,0])cylinder(r=(6.2-2.2)/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5,-50.057+21-0.1+0.1+10+6.25-32+0.2,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95])color("lime")rotate([0,90,0])cylinder(r=(4.2-0.3)/2,h=30,$fn=300);


//translate([-30+0.425-5+7-2+0.5+4.37,-50.057+21-0.1+0.1+10+6.25-32+0.2,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36])color("lime")rotate([0,90,0])cylinder(r=(5.2-0.65)/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5+4.37-6,-50.057+21-0.1+0.1+10+6.25-32+0.2,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36])color("lime")rotate([0,90,0])cylinder(r=(2.8)/2,h=30,$fn=300);


translate([-30+0.425-5+7-2+0.5+4.37-10,-50.057+21-0.1+0.1+10+6.25-32+0.2+30.50,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2])color("lime")rotate([0,90,0])cylinder(r=(3.6)/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5+4.37-10-25+0.2+3.5,-50.057+21-0.1+0.1+10+6.25-32+0.2+30.5,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2])color("lime")rotate([0,90,0])cylinder(r=(6.5)/2,h=30,$fn=6);
translate([-30+0.425-5+7-2+0.5+4.37-10-25+0.2+5,-50.057+21-0.1+0.1+10+6.25-32+0.2+30.5+5.65,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2-8.55])color("lime")rotate([0,90,0])cylinder(r=(6.1)/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5+4.37-10-25+0.2+5+30-1.5,-50.057+21-0.1+0.1+10+6.25-32+0.2+30.5+5.65,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2-8.55-23])color("lime")rotate([0,0,0])cylinder(r=(6.1)/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5+4.37-10-25+0.2+5+30-1.5-4,-50.057+21-0.1+0.1+10+6.25-32+0.2+30.5+5.65+0.1,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2-8.55-23])color("lime")rotate([0,0,45])cylinder(r=(6.1)/2,h=30-5,$fn=4);
translate([-30+0.425-5+7-2+0.5+4.37-10-25+0.2+5+30-1.5-4+2,-50.057+21-0.1+0.1+10+6.25-32+0.2+30.5+5.65+0.1+0.65,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2-8.55-23])color("lime")rotate([0,0,45])cylinder(r=(6.1)/2,h=30-5.7,$fn=4);


//translate([-30+0.425-5+7-2+0.5+4.37-10-25+0.2+5+30-1.5-4+5.25,-50.057+21-0.1+0.1+10+6.25-32+0.2+30.5+5.65+0.1+0.65-10+0.29,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2-8.55-23])color("lime")rotate([0,0,45])cylinder(r=(6.1-1.30)/2,h=12-5.7,$fn=300);
//translate([-30+0.425-5+7-2+0.5+4.37-10-25+0.2+5+30-1.5-4+5.25,-50.057+21-0.1+0.1+10+6.25-32+0.2+30.5+5.65+0.1+0.65-10+0.29-20,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2-8.55-23])color("lime")rotate([0,0,45])cylinder(r=(6.1-1.30)/2,h=12-5.7,$fn=300);


translate([-30+0.425-5+7-2+0.5+4.37-10-25+0.2+5+30-1.5-4+5.25,-50.057+21-0.1+0.1+10+6.25-32+0.2+30.5+5.65+0.1+0.65-10+0.29,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2-8.55-23])color("lime")rotate([0,0,45])cylinder(r=(2.8)/2,h=12-1.7,$fn=300);
translate([-30+0.425-5+7-2+0.5+4.37-10-25+0.2+5+30-1.5-4+5.25,-50.057+21-0.1+0.1+10+6.25-32+0.2+30.5+5.65+0.1+0.65-10+0.29-20,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2-8.55-23])color("lime")rotate([0,0,45])cylinder(r=(2.8)/2,h=12-1.7,$fn=300);


translate([6-30+0.425-5+7-2+0.5+4.37-10-25+0.2+5+30-1.5-4+5.25,12.5-50.057+21-0.1+0.1+10+6.25-32+0.2+30.5+5.65+0.1+0.65-10+0.29-20,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36-27+0.2-8.55-23-2.55])color("lime")rotate([0,0,45])cylinder(r=(7.5-1.30)/2,h=12-5.7,$fn=300);

translate([-30+0.425-5+7-2+0.5-5,-50.057+21-0.1+0.1+10+6.25-32+0.2-1+0.02,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95-28.55])color("lime")rotate([0,90,0])cylinder(r=(4.2-0.3)/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5-5,-50.057+21-0.1+0.1+10+6.25-32+0.2-1+0.02,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95-28.55])color("lime")rotate([0,90,0])cylinder(r=(4.2-0.3)/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5+3.7,-50.057+21-0.1+0.1+10+6.25-32+0.2-1+0.02-0,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95-28.55])color("lime")rotate([0,90,0])cylinder(r=(6.25-0.3)/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5+3.7,-50.057+21-0.1+0.1+10+6.25-32+0.2-1+0.02-0,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95-28.55])color("lime")rotate([0,90,0])cylinder(r=(6.25-0.3)/2,h=30,$fn=300);


//translate([-30+0.425-5+7-2+0.5+3.7+0.8,-50.057+21-0.1+0.1+10+6.25-32+0.2-1+0.02-0+3.8,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95-28.55-11+0.2])color("lime")rotate([0,90,0])cylinder(r=(5.25-0.8)/2,h=30,$fn=300);
translate([-30+0.425-5+7-2+0.5+3.7+0.8-10,-50.057+21-0.1+0.1+10+6.25-32+0.2-1+0.02-0+3.8,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95-28.55-11+0.2])color("lime")rotate([0,90,0])cylinder(r=(2.8)/2,h=30,$fn=300);

//translate([0.08-30+0.425-5+7-2+0.5+3.7+0.8+0.45,-50.057+21-0.1+0.1+10+6.25-32+0.2-1+0.02-0+3.8+25.1,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95-28.55-11+0.2+55+1.8-5])color("lime")rotate([0,0,0])cylinder(r=(4.8)/2,h=30,$fn=300);
translate([0.08-30+0.425-5+7-2+0.5+3.7+0.8+0.45,-50.057+21-0.1+0.1+10+6.25-32+0.2-1+0.02-0+3.8+25.1,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95-28.55-11+0.2+55+1.8-5-3])color("lime")rotate([0,0,0])cylinder(r=(2.8)/2,h=30,$fn=300);
}


//guide posts
translate([47.5-0.21-70-3.2-0.48,-7-12.2-0.125+10-3-5.6+6.5-2.1+3,100-5+45-0.1+8.1])rotate([-90,0,0])color("pink")cylinder(r=3.9/2,h=8.1,$fn=300);

//magnet
translate([47.5-0.21-70-3.2+0.05,-12.2-0.125+10-3-5.6+6.5-2.1,100-5+45-0.1+0.05])rotate([-90,0,0])color("pink")cylinder(r=6.2/2,h=3.1,$fn=300);
}

translate([-30+0.425-5+7-2+0.5+4.37+7,28.5-50.057+21-0.1+0.1+10+6.25-32+0.155,102.1+30-0.48+0.25+16.7-0.3+0.02-0.95+12.36+0.50])color("lime")rotate([0,90,0])cylinder(r1=(4.2)/2,r2=(3.7/2),h=2.6,$fn=300);


//translate([47.5-0.21-70-3.2,-12.2-0.125+10-3-5.6+6.5-2.1-4,100-5+45-0.1])rotate([-90,0,0])color("")cylinder(r=4.25-1,h=7,$fn=300);
}




module toolhead_bottom_fix_improved(){
/*
difference(){
translate([0,-0,0])color("lime")import("toolhead-bottom.stl");
translate([47.5-0.21+26-26,-12.2-0.2-15-11.55,100-5-10+8-50+8.495+30])color("peru")cylinder(r=2.8/2,h=20,$fn=300);
translate([47.5-0.21+26-26,-12.2-0.2-15-11.55+26.55,100-5-10+8-50+8.495+30])color("peru")cylinder(r=2.8/2,h=20,$fn=300);
}
*/
//translate([0,-0.2,0])color("lime")import("toolhead-bottom.stl");
difference(){
union(){
translate([0,-0,0])color("lime")import("toolhead-bottom.stl");
translate([-0.415,0,0]){
translate([47.5-0.21+26,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26-6,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26-3,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26+3,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26+5,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([0,1,0]){
translate([47.5-0.21+26,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26-6,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26-3,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26+3,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26+5,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
}
translate([0,-1,0]){
translate([47.5-0.21+26,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26-6,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26-3,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26+3,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26+5,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
}
//translate([74.8-5.25-0.25-15-20+41.1-0.2,-25.48+12.85,62.4])rotate([0,90,0])rotate([0,0,30])color("silver")cylinder(r=9.7/2,h=5,$fn=6);
//translate([74.8-5.25-0.25-15-20+41.1-0.2,-25.48+12.85-28.5,62.4])rotate([0,90,0])rotate([0,0,30])color("silver")cylinder(r=9.7/2,h=5,$fn=6);
}

translate([34-0.075,0-4+0.45-3.1,70-1.35])rotate([-90,0,0])cylinder(r=6.4/2,h=3,$fn=300);
translate([0,-0.2,0])color("lime")import("toolhead-bottom.stl");
translate([47.5-0.21,-12.2-0.125,100-5])color("peru")cylinder(r=4.25,h=2.56,$fn=300);
translate([47.5-0.21,-12.2-0.2-26.525,100-5])color("peru")cylinder(r=4.25,h=2.56,$fn=300);
translate([47.5-0.21+9.72,-12.2-0.2+1+0.02,100-5-10+8])color("peru")cylinder(r=6.8/2,h=4.5,$fn=300);
translate([47.5-0.21+9.72,-12.2-0.2+1-28+0.17,100-5-10+8])color("peru")cylinder(r=6.8/2,h=4.5,$fn=300);
translate([47.5-0.21-2.85,-12.2-0.2-26.558+5-1.892,100-5-10+8-30-0.4])color("")rotate([90,0,0])cylinder(r=2.9/2,h=4.47,$fn=300);
translate([47.5-0.21-2.85+24,-12.2-0.2-26.558+5-1.892+0.16-1.287,100-5-10+8-30-0.4])color("")rotate([90,0,0])cylinder(r=2.9/2,h=4.47-1.28,$fn=300);
translate([47.5-0.21-2.85+24,-12.2-0.2-26.558+5-1.892+0.16,100-5-10+8-30-0.4+24])color("")rotate([90,0,0])cylinder(r=2.9/2,h=4.47,$fn=300);
translate([47.5-0.21-2.85-5+2.15,-12.2-0.2-26.558+5-1.892-12,100-5-10+8-30-0.4-8])color("")rotate([0,90,0])cylinder(r=2.9/2,h=4.47,$fn=300);
translate([47.5-0.21-2.85-5+2.15,-12.2-0.2-26.558+5-1.892-12+35.5,100-5-10+8-30-0.4-8+35.5])color("")rotate([0,90,0])cylinder(r=2.9/2,h=4.47,$fn=300);
difference(){
union(){
translate([74.8-5.25-0.25,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=5.5/2,h=6.78,$fn=300);
//translate([74.8-5.25-0.25+6.689,-25.48+12.85,62.4])rotate([0,90,0])color("pink")rotate([0,0,90])cylinder(r=9.5/2,h=4,$fn=6);
}
translate([74.8-5.25-0.25-15-20,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=4.9/2,h=18.3+15+20,$fn=300);
//translate([74.8-5.25-0.25-27.5-3+5+5,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=9.3/2,h=18.3+15-5-5,$fn=300);
//translate([74.8-5.25-0.25+6.75+1.01,-25.48+12.85,62.4])rotate([0,90,0])color("pink")rotate([0,0,90])cylinder(r=8/2,h=3,$fn=6);
}
translate([0,-28.5,0])difference(){
union(){
translate([74.8-5.25-0.25+2.5,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=5.5/2,h=6.78-2.5,$fn=300);
//translate([74.8-5.25-0.25+6.689,-25.48+12.85,62.4])rotate([0,90,0])color("pink")rotate([0,0,90])cylinder(r=9.5/2,h=4,$fn=6);
}
translate([74.8-5.25-0.25-15-20,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=4.9/2,h=18.3+15+20,$fn=300);
//translate([74.8-5.25-0.25-27.5-3+5+5,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=9.3/2,h=18.3+15-5-5,$fn=300);
//translate([74.8-5.25-0.25+6.75+1.01,-25.48+12.85,62.4])rotate([0,90,0])color("pink")rotate([0,0,90])cylinder(r=8/2,h=3,$fn=6);
}

} //end union
translate([0,0,4.5-0.4]){
translate([76,-15,47])cylinder(r=6.1/2,h=3.3,$fn=300);
translate([76,-15-22,47])cylinder(r=6.1/2,h=3.3,$fn=300);
translate([76,-15-2,47+2])rotate([0,-90,0])cylinder(r=1/2,h=25.3,$fn=300);
translate([76,-15-2-23+5,47+2])rotate([0,-90,0])cylinder(r=1/2,h=25.3,$fn=300);
}
translate([34-0.075,0-4+0.45-3.1,70-1.35])rotate([-90,0,0])cylinder(r=6.1/2,h=10,$fn=300);
translate([34-0.075-0.2,0-4+0.45-3.1-9,70-1.35-7.7+30])rotate([-90,0,0])cylinder(r=4.1/2,h=20,$fn=300);
translate([74.8-5.25-0.25-15-20,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=4.9/2,h=18.3+15+20,$fn=300);
translate([74.8-5.25-0.25-15-20,-25.48+12.85-28.5,62.4])rotate([0,90,0])color("silver")cylinder(r=4.9/2,h=18.3+15+20,$fn=300);
translate([74.8-5.25-0.25-27.5-3+5+5,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=9.3/2,h=18.3+15-5-5,$fn=300);
translate([0,-28.5,0])translate([74.8-5.25-0.25-27.5-3+5+5,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=9.3/2,h=18.3+15-5-5,$fn=300);



translate([70-5.25-0.25,-25.48,80+3.3-2])cylinder(r=5.05/2,h=30,$fn=300);
translate([70-5.25-0.25-5-23+21+2,-25.48-8.75+0.5,80+3.3+4.60-0.2-30])rotate([0,0,0])cube([11.2,18,35]);
translate([70-5.25-0.25-5-23+21,-25.48-8.75+0.5,80+3.3+4.60-0.2-30])rotate([0,0,0])cube([11.2,18,35]);
translate([70-5.25-0.25-5-23,-25.48-8.75+0.5,80+3.3+4.60-0.2-30])rotate([0,0,0])cube([11.2,18,30]);
//translate([74.8-5.25-0.25,27.5-1.5+10,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=9.3/2,h=18.3+5,$fn=300);
//translate([0-1.5+10,-28.5,0])translate([74.8-5.25-0.25-27.5,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=9.3/2,h=18.3+5,$fn=300);
translate([47.5-0.21+26-26,-12.2-0.2-15-11.55,100-5-10+8-50+8.495+30])color("peru")cylinder(r=2.8/2,h=20,$fn=300);
translate([47.5-0.21+26-26,-12.2-0.2-15-11.55+26.55,100-5-10+8-50+8.495+30])color("peru")cylinder(r=2.8/2,h=20,$fn=300);
translate([47.5-0.21+26,-12.2-0.2-15,100-5-10+8-50+8.495])color("peru")cylinder(r=(6)/2,h=(67-15.79)/2,$fn=300);

translate([47.5-0.21+26-26,-12.2-0.2-15-11.55,100-5-10+8-50+8.495+30])color("peru")cylinder(r=2.8/2,h=20,$fn=300);
translate([47.5-0.21+26-26,-12.2-0.2-15-11.55+26.55,100-5-10+8-50+8.495+30])color("peru")cylinder(r=2.8/2,h=20,$fn=300);


translate([47.5-0.21+26,-12.2-0.2-15,100-5-10+8-50+8.495])color("peru")cylinder(r=2.9/2,h=67-15.79,$fn=300);
translate([70-5.25-0.25,-25.48,80+3.3-2])cylinder(r=4.9/2,h=30,$fn=300);
translate([0,0,0]){
translate([70-5.25-0.25-5,-25.48-8.75,80+3.3+4.60-0.2])rotate([0,0,0])cube([11.2,17,3]);
translate([47.5-0.21+9.72,-12.2-0.2+1+0.1+0.02,100-5-10+8-1.5])color("peru")cylinder(r=6.15/2,h=27-8,$fn=300);
translate([47.5-0.21+9.72,-12.2-0.2+1-28+0.17,100-5-10+8-1.5])color("peru")cylinder(r=6.15/2,h=27-8,$fn=300);
translate([47.5-0.21,-12.2-0.2,100-5-10+8])color("peru")cylinder(r=3/2,h=27-8,$fn=300);
//translate([47.5-0.21,-12.2-0.2-26.558,100-5-10])color("peru")cylinder(r=2.8/2,h=27,$fn=300);
translate([47.5-0.21,-12.2-0.2-26.558,100-5-10+8])color("peru")cylinder(r=3/2,h=27-8,$fn=300);
translate([47.5-0.21-2.85,-12.2-0.2-26.558+5-1.892,100-5-10+8-30-0.4])color("")rotate([90,0,0])cylinder(r=2.95/2,h=4.47,$fn=300);
translate([47.5-0.21-2.85+24,-12.2-0.2-26.558+5-1.892+0.16-1.287,100-5-10+8-30-0.4])color("")rotate([90,0,0])cylinder(r=2.95/2,h=4.47-1.28,$fn=300);
translate([47.5-0.21-2.85+24,-12.2-0.2-26.558+5-1.892+0.16,100-5-10+8-30-0.4+24])color("")rotate([90,0,0])cylinder(r=2.95/2,h=4.47,$fn=300);
translate([47.5-0.21-2.85-5+2.15,-12.2-0.2-26.558+5-1.892-12,100-5-10+8-30-0.4-8])color("")rotate([0,90,0])cylinder(r=2.95/2,h=4.47,$fn=300);
translate([47.5-0.21-2.85-5+2.15,-12.2-0.2-26.558+5-1.892-12+35.5,100-5-10+8-30-0.4-8+35.5])color("")rotate([0,90,0])cylinder(r=2.95/2,h=4.47,$fn=300);
}
}
}




























































module toolhead_bottom_fix_m4acorn(){
difference(){
union(){
translate([-0.415,0,0]){
translate([47.5-0.21+26,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26-6,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26-3,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26+3,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26+5,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([0,1,0]){
translate([47.5-0.21+26,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26-6,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26-3,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26+3,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26+5,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
}
translate([0,-1,0]){
translate([47.5-0.21+26,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26-6,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26-3,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26+3,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
translate([47.5-0.21+26+5,-12.2-0.2-15,100-5-10+8-50+40])rotate([0,0,45])color("peru")cylinder(r=6/2,h=4.7,$fn=4);
}
}
translate([0,-0.2,0])color("lime")import("toolhead-bottom.stl");
translate([47.5-0.21,-12.2-0.125,100-5])color("peru")cylinder(r=4.25,h=2.56,$fn=300);
translate([47.5-0.21,-12.2-0.2-26.525,100-5])color("peru")cylinder(r=4.25,h=2.56,$fn=300);
translate([47.5-0.21+9.72,-12.2-0.2+1+0.02,100-5-10+8])color("peru")cylinder(r=6.8/2,h=4.5,$fn=300);
translate([47.5-0.21+9.72,-12.2-0.2+1-28+0.17,100-5-10+8])color("peru")cylinder(r=6.8/2,h=4.5,$fn=300);
translate([47.5-0.21-2.85,-12.2-0.2-26.558+5-1.892,100-5-10+8-30-0.4])color("")rotate([90,0,0])cylinder(r=2.9/2,h=4.47,$fn=300);
translate([47.5-0.21-2.85+24,-12.2-0.2-26.558+5-1.892+0.16-1.287,100-5-10+8-30-0.4])color("")rotate([90,0,0])cylinder(r=2.9/2,h=4.47-1.28,$fn=300);
translate([47.5-0.21-2.85+24,-12.2-0.2-26.558+5-1.892+0.16,100-5-10+8-30-0.4+24])color("")rotate([90,0,0])cylinder(r=2.9/2,h=4.47,$fn=300);
translate([47.5-0.21-2.85-5+2.15,-12.2-0.2-26.558+5-1.892-12,100-5-10+8-30-0.4-8])color("")rotate([0,90,0])cylinder(r=2.9/2,h=4.47,$fn=300);
translate([47.5-0.21-2.85-5+2.15,-12.2-0.2-26.558+5-1.892-12+35.5,100-5-10+8-30-0.4-8+35.5])color("")rotate([0,90,0])cylinder(r=2.9/2,h=4.47,$fn=300);
difference(){
union(){
translate([74.8-5.25-0.25,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=5.5/2,h=6.78,$fn=300);
translate([74.8-5.25-0.25+6.689,-25.48+12.85,62.4])rotate([0,90,0])color("pink")rotate([0,0,90])cylinder(r=9.5/2,h=4,$fn=6);
}
translate([74.8-5.25-0.25-15,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=4.3/2,h=18.3+15,$fn=300);
//translate([74.8-5.25-0.25-27.5,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=9.3/2,h=18.3+15,$fn=300);
translate([74.8-5.25-0.25+6.75+1.01,-25.48+12.85,62.4])rotate([0,90,0])color("pink")rotate([0,0,90])cylinder(r=8/2,h=3,$fn=6);
}
translate([0,-28.5,0])difference(){
union(){
translate([74.8-5.25-0.25+2.5,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=5.5/2,h=6.78-2.5,$fn=300);
translate([74.8-5.25-0.25+6.689,-25.48+12.85,62.4])rotate([0,90,0])color("pink")rotate([0,0,90])cylinder(r=9.5/2,h=4,$fn=6);
}
translate([74.8-5.25-0.25-15,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=4.3/2,h=18.3+15,$fn=300);
//translate([74.8-5.25-0.25-27.5,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=9.3/2,h=18.3+15,$fn=300);
translate([74.8-5.25-0.25+6.75+1.01,-25.48+12.85,62.4])rotate([0,90,0])color("pink")rotate([0,0,90])cylinder(r=8/2,h=3,$fn=6);
}
difference(){
translate([70-5.25-0.25,-25.48-0.2,82.778])color("lightblue")cylinder(r=9.25/2,h=19.922-14.8,$fn=300);
translate([70-5.25-0.25,-25.48,80+3.3-2])cylinder(r=4.9/2,h=30,$fn=300);
translate([70-5.25-0.25+5-4,-25.48-5,80+3.3+1.5])cube([10,6.3-0,2.2]);
}
}
translate([74.8-5.25-0.25-27.5-1.5+10,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=9.3/2,h=18.3+5,$fn=300);
translate([0-1.5+10,-28.5,0])translate([74.8-5.25-0.25-27.5,-25.48+12.85,62.4])rotate([0,90,0])color("silver")cylinder(r=9.3/2,h=18.3+5,$fn=300);
translate([47.5-0.21+26,-12.2-0.2-15,100-5-10+8-50+8.495])color("peru")cylinder(r=2.9/2,h=67-15.79,$fn=300);
translate([47.5-0.21+26,-12.2-0.2-15,100-5-10+8-50+8.495])color("peru")cylinder(r=(6)/2,h=(67-15.79)/2,$fn=300);
translate([70-5.25-0.25,-25.48,80+3.3-2])cylinder(r=4.9/2,h=30,$fn=300);
translate([0,0,0]){
translate([70-5.25-0.25-5,-25.48-8.75,80+3.3+4.60-0.2])rotate([0,0,0])cube([11.2,17,3]);
translate([47.5-0.21+9.72,-12.2-0.2+1+0.1+0.02,100-5-10+8-1.5])color("peru")cylinder(r=6.15/2,h=27-8,$fn=300);
translate([47.5-0.21+9.72,-12.2-0.2+1-28+0.17,100-5-10+8-1.5])color("peru")cylinder(r=6.15/2,h=27-8,$fn=300);
translate([47.5-0.21,-12.2-0.2,100-5-10+8])color("peru")cylinder(r=3/2,h=27-8,$fn=300);
//translate([47.5-0.21,-12.2-0.2-26.558,100-5-10])color("peru")cylinder(r=2.8/2,h=27,$fn=300);
translate([47.5-0.21,-12.2-0.2-26.558,100-5-10+8])color("peru")cylinder(r=3/2,h=27-8,$fn=300);
translate([47.5-0.21-2.85,-12.2-0.2-26.558+5-1.892,100-5-10+8-30-0.4])color("")rotate([90,0,0])cylinder(r=2.95/2,h=4.47,$fn=300);
translate([47.5-0.21-2.85+24,-12.2-0.2-26.558+5-1.892+0.16-1.287,100-5-10+8-30-0.4])color("")rotate([90,0,0])cylinder(r=2.95/2,h=4.47-1.28,$fn=300);
translate([47.5-0.21-2.85+24,-12.2-0.2-26.558+5-1.892+0.16,100-5-10+8-30-0.4+24])color("")rotate([90,0,0])cylinder(r=2.95/2,h=4.47,$fn=300);
translate([47.5-0.21-2.85-5+2.15,-12.2-0.2-26.558+5-1.892-12,100-5-10+8-30-0.4-8])color("")rotate([0,90,0])cylinder(r=2.95/2,h=4.47,$fn=300);
translate([47.5-0.21-2.85-5+2.15,-12.2-0.2-26.558+5-1.892-12+35.5,100-5-10+8-30-0.4-8+35.5])color("")rotate([0,90,0])cylinder(r=2.95/2,h=4.47,$fn=300);
}
}
}









module toolhead_bottom_fix(){
difference(){ 
union(){
translate([0,-0.2,0])color("lime")import("toolhead-bottom.stl");
translate([47.5-0.21,-12.2-0.125,100-5])color("peru")cylinder(r=4.25,h=2.56,$fn=300);
translate([47.5-0.21,-12.2-0.2-26.525,100-5])color("peru")cylinder(r=4.25,h=2.56,$fn=300);
translate([47.5-0.21+9.72,-12.2-0.2+1+0.02,100-5-10+8])color("peru")cylinder(r=6.8/2,h=4.5,$fn=300);
translate([47.5-0.21+9.72,-12.2-0.2+1-28+0.17,100-5-10+8])color("peru")cylinder(r=6.8/2,h=4.5,$fn=300);
translate([47.5-0.21-2.85,-12.2-0.2-26.558+5-1.892,100-5-10+8-30-0.4])color("")rotate([90,0,0])cylinder(r=3.4/2,h=4.47,$fn=300);
//translate([47.5-0.21-2.85+24,-12.2-0.2-26.558+5-1.892+0.16-1.287,100-5-10+8-30-0.4])color("")rotate([90,0,0])cylinder(r=3.4/2,h=4.47-1.28,$fn=300);
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


/*
difference(){
translate([70-5.25-0.25,-25.48-0.2,82.778])color("lightblue")cylinder(r=9.25/2,h=19.922-14.8,$fn=300);
translate([70-5.25-0.25,-25.48,80+3.3-2])cylinder(r=4.9/2,h=30,$fn=300);
translate([70-5.25-0.25+5-4,-25.48-5,80+3.3+1.5])cube([10,6.3-0,2.2]);
}
*/

}

translate([0,0,0]){
translate([70-5.25-0.25-5,-25.48-8.75,80+3.3+4.60-0.2])rotate([0,0,0])cube([11.2,17,3]);
translate([47.5-0.21+9.72,-12.2-0.2+1+0.1+0.02,100-5-10+8-1.5])color("peru")cylinder(r=6.15/2,h=27-8,$fn=300);
translate([47.5-0.21+9.72,-12.2-0.2+1-28+0.17,100-5-10+8-1.5])color("peru")cylinder(r=6.15/2,h=27-8,$fn=300);
translate([47.5-0.21,-12.2-0.2,100-5-10+8])color("peru")cylinder(r=3/2,h=27-8,$fn=300);
//translate([47.5-0.21,-12.2-0.2-26.558,100-5-10])color("peru")cylinder(r=2.8/2,h=27,$fn=300);
translate([47.5-0.21,-12.2-0.2-26.558,100-5-10+8])color("peru")cylinder(r=3/2,h=27-8,$fn=300);
translate([47.5-0.21-2.85,-12.2-0.2-26.558+5-1.892,100-5-10+8-30-0.4])color("")rotate([90,0,0])cylinder(r=2.95/2,h=4.47,$fn=300);
translate([47.5-0.21-2.85+24,-12.2-0.2-26.558+5-1.892+0.16-1.287,100-5-10+8-30-0.4])color("")rotate([90,0,0])cylinder(r=2.95/2,h=4.47-1.28,$fn=300);
translate([47.5-0.21-2.85+24,-12.2-0.2-26.558+5-1.892+0.16,100-5-10+8-30-0.4+24])color("")rotate([90,0,0])cylinder(r=2.95/2,h=4.47,$fn=300);
translate([47.5-0.21-2.85-5+2.15,-12.2-0.2-26.558+5-1.892-12,100-5-10+8-30-0.4-8])color("")rotate([0,90,0])cylinder(r=2.95/2,h=4.47,$fn=300);
translate([47.5-0.21-2.85-5+2.15,-12.2-0.2-26.558+5-1.892-12+35.5,100-5-10+8-30-0.4-8+35.5])color("")rotate([0,90,0])cylinder(r=2.95/2,h=4.47,$fn=300);
}

translate([0-2,0,4.5-0.4+7.35]){
translate([76+1,-15-4.5,47-10+3])cylinder(r=6.1/2,h=3.3,$fn=300);
translate([76+1,-15-4.5-2+3.5,47-10+3])cylinder(r=3.1/2,h=3.3+2,$fn=300);
translate([76+1,-15-4.5-16.2,47-10+3])cylinder(r=6.1/2,h=3.3,$fn=300);
translate([76+1,-15-4.5-2+3.5-2.7-16.2+2.7,47-10+3])cylinder(r=3.1/2,h=3.3+2,$fn=300);
translate([76,-15-3,47+2-5])rotate([0,-90,0])cylinder(r=2/2,h=25.3,$fn=300);
translate([76,-15-2-23+5,47+2-5])rotate([0,-90,0])cylinder(r=2/2,h=25.3,$fn=300);
}



}
}



module hotend_mount_mod(){

translate([47.5-0.21-6,-12.2-0.2-10,100.61+0.15])rotate([0,0,45])color("lime")cylinder(r=(7)/2,h=4.85-2.5+2.6,$fn=4);
translate([47.5-0.21-6,-12.2-0.2-10-4,100.61+0.15])rotate([0,0,45])color("lime")cylinder(r=(7)/2,h=4.85-2.5+2.6,$fn=4);
translate([47.5-0.21-6,-12.2-0.2-10-8,100.61+0.15])rotate([0,0,45])color("lime")cylinder(r=(7)/2,h=4.85-2.5+2.6,$fn=4);

translate([0,-28,0])difference(){
translate([47.5-0.21+10-0.2,-12.2-0.2+1,100.61])color("lime")cylinder(r=(7+6)/2,h=4.85+0.3,$fn=300);
translate([47.5-0.21+10-0.2,-12.2-0.2+1,100.61-2])color("lime")cylinder(r=4.15/2,h=15.85,$fn=300);
}


difference(){
translate([47.5-0.21+10-0.2,-12.2-0.2+1,100.61])color("lime")cylinder(r=(7+6)/2,h=4.85+0.3,$fn=300);
translate([47.5-0.21+10-0.2,-12.2-0.2+1,100.61-2])color("lime")cylinder(r=4.15/2,h=15.85,$fn=300);
}


difference(){
translate([47.5-0.21,-12.2-0.2,100.61])color("lime")cylinder(r=(7+5)/2,h=4.85-2.5+2.6,$fn=300);
translate([47.5-0.21,-12.2-0.2,100.61-1])color("lime")cylinder(r=4.5/2,h=14.85,$fn=300);
}
translate([0+0.05,-26.6,0])difference(){
translate([47.5-0.21,-12.2-0.2,100.61])color("lime")cylinder(r=(7+5)/2,h=4.85-2.5+2.6,$fn=300);
translate([47.5-0.21,-12.2-0.2,100.61-1])color("lime")cylinder(r=4.5/2,h=14.85,$fn=300);
}
//translate([47.5-0.21,-12.2-0.2,100.61])color("pink")lm8uu_pla(6.3,4.85,2.8);
//translate([47.5-0.21,-12.2-0.2-26.58,100.61])color("pink")lm8uu_pla(6.3,4.85,2.8);
translate([60-0.25,0-0.2,2.8])import("hotend-mount.stl");
}




module toolhead_top_1_fix(){


//translate([70-5.25-0.25,-25.48,80+3.3-1])color("silver")cylinder(r=4.9/2,h=25,$fn=300);
difference(){
union(){
translate([0,-0.19,0])import("toolhead-top-1.stl");
//translate([20-0.3,-27-0,150-0.4])color("pink")rotate([0,90,0])rotate([0,0,30])cylinder(r=9.2/2,h=3,$fn=6);
//translate([20-0.3+60-3.4,-27-0-0.2,150-0.3])color("pink")rotate([0,90,0])rotate([0,0,30])cylinder(r=10.2/2,h=3.45,$fn=6);
translate([20-0.3+60-3.4+1.8-0.15,-27-0-0.2+16.8,150-0.3+24.2])color("pink")rotate([0,90,0])rotate([0,0,30])cylinder(r=15/2,h=2,$fn=300);
//translate([47.5-0.21+21.5-2,-12.2-0.2+2.5,100-5+10.44-2.695])color("peru")cylinder(r=5.2/2,h=7.52,$fn=300);
translate([47.5-0.21+21.5-2.55,-12.2-0.2+2.65,100-5+10.44-2.695])color("peru")cylinder(r=4.3/2,h=7.52,$fn=300);
translate([47.5-0.21+21.5-2.55,-12.2-0.2+2.65-34,100-5+10.44-2.695])color("peru")cylinder(r=4.3/2,h=7.52,$fn=300);

translate([47.5-0.21,-12.2-0.2,100-5+10.44])color("peru")cylinder(r=5.2/2,h=7.52,$fn=300);

translate([47.5-0.21+26,-12.2-0.2-26.558/2-1.6,100-5+10.64])color("peru")cylinder(r=6.2/2,h=65.52-41.8,$fn=300);
translate([47.5-0.21+26+1,-12.2-0.2-26.558/2-1.6,100-5+10.64])color("peru")cylinder(r=6.2/2,h=65.52-41.8,$fn=300);
translate([47.5-0.21+26+1+0,-12.2-0.2-26.558/2-1.6,100-5+10.64+18.6])color("peru")rotate([0,0,45])cylinder(r=16.2/2,h=4,$fn=4);
translate([47.5-0.21,-12.2-0.2-26.558,100-5+10.44+4.9-4.9])color("peru")cylinder(r=5.2/2,h=7.52,$fn=300);
translate([47.5-0.21+28.65,-12.2-0.2-26.558/2-1.6-6.7,100-5+0.64+60])color("peru")cylinder(r=5.7/2,h=60.52-1.8-49.5,$fn=300);
translate([47.5-0.21+28.65-35+4.05,-12.2-0.2-26.558/2-1.6-6.7,100-5+0.64+40.6])rotate([85,0,0])color("peru")cylinder(r=4.7/2,h=60.52-1.8-49.5,$fn=300);
//translate([47.5-0.21+26-50+35.19,-12.2-0.2-26.558/2-1.6-2.1,100-5+0.64+53.15])rotate([0,90,0])color("peru")cylinder(r=8.5/2,h=3,$fn=300);
//translate([47.5-0.21+26-50+35.19,-12.2-0.2-26.558/2-1.6-2.1,100-5+0.64+53.15])rotate([0,90,0])color("peru")cylinder(r=8.5/2,h=3,$fn=300);
//translate([47.5-0.21+26-50+35.19-8,-12.2-0.2-26.558/2-1.6-2.1,100-5+0.64+53.15])rotate([0,90,0])color("peru")cylinder(r=8.5/2,h=8,$fn=300);

//translate([47.5-0.21+26-50+35.19-2.555,-12.2-0.2-26.558/2-1.6-2.1,100-5+0.64+53.15])rotate([0,90,0])color("lime")cylinder(r=12/2,h=6,$fn=300);
}

translate([60-1.1,-33.85,133-0.2])cube([2,4,5]);
//translate([40,-52,137])cube([50,50,100]);
translate([20-0.3+60-3.4+1.8-2,-27-0-0.2+16.8,150-0.3+24.2])color("pink")rotate([0,90,0])rotate([0,0,30])cylinder(r=9.5/2,h=21,$fn=300);
translate([20-0.3+60-3.4-7,-27-0-0.2,150-0.3])color("pink")rotate([0,90,0])rotate([0,0,30])cylinder(r=4.2/2,h=33.45,$fn=300);
//translate([47.5-0.21+26-50+35.19-8,-12.2-0.2-26.558/2-1.6-2.1,100-5+0.64+53.15])rotate([0,90,0])color("peru")cylinder(r=8.5/2,h=9,$fn=300);
translate([47.5-0.21+26-50,-12.2-0.2-26.558/2-1.6-2.1,100-5+0.64+53.15])rotate([0,90,0])color("peru")cylinder(r=5.1/2,h=46.52-1.8,$fn=300);

translate([47.5-0.21+21.5-2.55,-12.2-0.2+2.65,100-5+10.44-2.695])color("peru")cylinder(r=2.85/2,h=7.52,$fn=300);
translate([47.5-0.21+21.5-2.55,-12.2-0.2+2.65-34,100-5+10.44-2.695])color("peru")cylinder(r=2.85/2,h=7.52,$fn=300);
translate([47.5-0.21+28.65-35+4.05,-12.2-0.2-26.558/2-1.6-6.7-6.95,100-5+0.64+40.6])rotate([82,0,0])color("peru")rotate([0,0,45])cylinder(r=8.85/2,h=3,$fn=4);
translate([47.5-0.21+28.65-35+4.05,-12.2-0.2-26.558/2-1.6-6.7,100-5+0.64+40.6])rotate([85,0,0])color("peru")cylinder(r=2.85/2,h=60.52-1.8-47.5,$fn=300);
translate([47.5-0.21+28.65,-12.2-0.2-26.558/2-1.6-6.7,100-5+0.64+60])color("peru")cylinder(r=2.85/2,h=60.52-1.8-45.5,$fn=300);
translate([47.5-0.21+26,-12.2-0.2-26.558/2-1.6,100-5+0.64])color("peru")cylinder(r=2.85/2,h=95.52-1.8,$fn=300);
translate([47.5-0.21,-12.2-0.2,100-5+10.44-1])color("peru")cylinder(r=3.15/2,h=10.52,$fn=300);
translate([47.5-0.21-0.65,-12.2-0.2-3.3,100-5+10.44-1+5.15])color("peru")cylinder(r=2.9/2,h=10.52,$fn=300);
translate([47.5-0.21,-12.2-0.2-26.558,100-5+10.44-1])rotate([0,0,0])cylinder(r=3.15/2,h=20.52,$fn=300);
translate([47.5-0.21-20,-12.2-0.2-26.558-3,100-5+10.44-1+4])rotate([0,90,0])cylinder(r=4/2,h=50.52,$fn=300);
}

/*
*/
difference(){
translate([70-5.25-0.25,-25.48,80+3.3-1+23.34])color("lime")cylinder(r=9/2,h=5.9,$fn=300);
translate([70-5.25-0.25,-25.48,80+3.3-1+23.34-1])color("lime")cylinder(r=5.15/2,h=8.9,$fn=300);
}

//translate([70-5.25-0.25+8.5+0.3,-25.48-1.8,80+3.3-1+23.34-1])color("lime")cylinder(r=5.0/2,h=89,$fn=300);
//translate([70-5.25-0.25+8.5+0.3-20,-25.48-1.75,80+3.3-1+23.34+44.05])color("lime")rotate([0,90,0])cylinder(r=4.5/2,h=89,$fn=300);

}




module x_endstop_arm_connector(){
difference(){
union(){
translate([7,0+68,0])cube([20,30,4]);
translate([10+13,0+68,0])cube([65,12,4]);
}
translate([15,5+70,-3])cylinder(r=5.8/2,h=30,$fn=300);
translate([15,5+70+16,-3])cylinder(r=5.8/2,h=30,$fn=300);

translate([42,0,0]){
translate([33,5+72,-3])cylinder(r=1.8/2,h=30,$fn=300);
translate([33+6.5,5+72,-3])cylinder(r=1.8/2,h=30,$fn=300);
}
}
}


module ebb36_mount(){
difference(){
union(){
import("EBB36\ Mount.stl");
translate([10.1,-40,182.74])color("purple")cube([10,3.1,4.9]);
translate([10.1,-40-1.2,182.74-1])color("purple")cube([10,2.5,4.9]);

translate([-44,0,0]){
translate([10.1,-40,182.74])color("purple")cube([10,3.1,4.9]);
translate([10.1,-40-1.2,182.74-1])color("purple")cube([10,2.5,4.9]);
}
}
translate([10.1+4.5,-40+3,182.74+2])rotate([90,0,0])cylinder(r=2.8/2,h=30,$fn=300);
translate([10.1+4.5-43.8,-40+3,182.74+2])rotate([90,0,0])cylinder(r=2.8/2,h=30,$fn=300);
}
}


module m5nut(dia){
difference(){
cylinder(r=dia/2,h=3.5,$fn=6);
//cylinder(r=9.17/2,h=3.5,$fn=6);
//translate([0,0,-1.1])cylinder(r=3.95/2,h=7.5,$fn=300);
}
}


module dowel_pin(h){
diam = 6.95;
difference(){
union(){

translate([0,0,h])sphere(r=diam/2,$fn=300);

cylinder(r=diam/2,h=h,$fn=300);
//translate([0,0,5])cylinder(r2=(diam-0)/2,r1=(diam)/2,h=4.4-2,$fn=300);


//cylinder(r=diam/2,h=5,$fn=300);
//translate([0,0,5])cylinder(r2=(diam-0)/2,r1=(diam)/2,h=4.4-2,$fn=300);

}
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


