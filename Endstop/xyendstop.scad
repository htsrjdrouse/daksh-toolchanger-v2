

//endstop_mod();

xyendstop();

module xyendstop(){

difference(){
union(){
cube([18,29,6]);
translate([15,-8,0])cube([53+15-6,20,6]);
translate([15+40+15-6,-8-11-12,0])cube([13,25,6]);
}
translate([0,6,0]){
translate([9,0,-2])cylinder(r=5.7/2,h=50,$fn=300);
translate([9,16,-2])cylinder(r=5.7/2,h=50,$fn=300);
}

translate([0,-9,0]){
translate([26,5,-2])cylinder(r=1.95/2,h=50,$fn=300);
translate([26+6.5,5,-2])cylinder(r=1.95/2,h=50,$fn=300);
}

translate([0+15-6,-12-12,0]){
translate([9+56,16-20,-2])#cylinder(r=1.95/2,h=50,$fn=300);
translate([9+56,16-20+6.5,-2])#cylinder(r=1.95/2,h=50,$fn=300);
}
}
}



module endstop_mod(){
//WMYCONGCONG 50 PCS Micro Switch AC 2A 125V 3 Pin SPDT Limit Micro Switch Long Hinge Lever
difference(){
color("black")cube([12.8,6.5,5.7]);
translate([0,0,-5]){
translate([12.8/2-6.5/2,5.2,0])cylinder(r=2/2,h=50,$fn=300);
translate([12.8/2+6.5/2,5.2,0])cylinder(r=2/2,h=50,$fn=300);
}
}
}
