
//syringe_1ml_stack_1piece_multichannel_clamp();
//iverntech_pump_slider_plate_connect_multichannel();
difference(){union(){
//translate([41.9,-5-7,42.5])rotate([180,-90,90])import("pump_plunger_clamp.stl");
translate([41.9,-5-4,42.5])rotate([180,-90,90])iverntech_pump_slider_plate_connect_multichannel();
color("pink")import("pump_cover_slide_v51.stl");
}
translate([-3+0.5,34+4-4,-6])#cube([3.3-1.2,40,12]);
}

module pump_base(){
difference(){
rotate([90,0,0])import("pump_base_v51.stl");
translate([-14,28,-10])#cylinder(r=4/2,h=60,$fn=300);
translate([-14,28,3])#cylinder(r=8/2,h=60,$fn=300);
translate([-14,28-57,-10])#cylinder(r=4/2,h=60,$fn=300);
translate([-14,28-57,3])#cylinder(r=8/2,h=60,$fn=300);

translate([68,0,0]){
translate([-14,28,-10])#cylinder(r=4/2,h=60,$fn=300);
translate([-14,28,3])#cylinder(r=8/2,h=60,$fn=300);
translate([-14,28-57,-10])#cylinder(r=4/2,h=60,$fn=300);
translate([-14,28-57,3])#cylinder(r=8/2,h=60,$fn=300);
}

translate([-72,0,0]){
translate([-14,28,-10])#cylinder(r=4/2,h=60,$fn=300);
translate([-14,28,3])#cylinder(r=8/2,h=60,$fn=300);
translate([-14,28-57,-10])#cylinder(r=4/2,h=60,$fn=300);
translate([-14,28-57,3])#cylinder(r=8/2,h=60,$fn=300);
}

}
}

module syringe_1ml_stack_1piece_multichannel_clamp(){
difference(){union(){
/*
*/
//clamp part
translate([-0.3-14,0+146-2,-0.8])
translate([-110+54.5+6-14,-81.5+1.5+40+6.6+3.5-14.5,16+15+6+3])cube([5,6.5,35-15-4-3]);
translate([-0.3-14-(8*14)-3.5,0+146-2,-0.8])
translate([-110+54.5+6-14,-81.5+1.5+40+6.6+3.5-14.5,16+15+6+3])cube([5,6.5,35-15-4-3]);
for(i=[0:7]){
//color("")translate([-85-(i*14),105.5,44])rotate([-0,0,-90])syringe_1ml_plungerclip_1piece();
//translate([-183+(i*14),170,44])rotate([0,90,90])syringe_1ml();
translate([0-42.5-(i*14),-4+230-80-2,0])iverntech_pump_slider_plate_connect_multichannel();
}
}
translate([-77.5-0.5,100-0.5,50-4])rotate([90,90,0])cylinder(r=3.8/2,h=100);
translate([-77.5-0.5,130,50-4])rotate([90,90,0])cylinder(r=2.8/2,h=100);
translate([-77.5-(8*14)-0.5,100-0.5,50-4])rotate([90,90,0])cylinder(r=3.8/2,h=100);
translate([-77.5-(8*14)-0.5,130,50-4])rotate([90,90,0])cylinder(r=2.8/2,h=100);
for(i=[0:7]){
//translate([18-(i*14),0,-8])cylinder(r=3.7/2,h=40);
translate([-14,0,0]){
translate([-77.5-(i*14)-0.5,100-0.5,50-4])rotate([90,90,0])cylinder(r=3.8/2,h=100);
translate([-77.5-(i*14)-0.5,130,50-4])rotate([90,90,0])cylinder(r=2.8/2,h=100);
}
translate([-77.5-0.5,100-0.5,50-4])rotate([90,90,0])cylinder(r=3.8/2,h=100);
translate([-77.5-0.5,130,50-4])rotate([90,90,0])cylinder(r=2.8/2,h=100);
translate([-77.5-(8*14)-0.5,100-0.5,50-4])rotate([90,90,0])cylinder(r=3.8/2,h=100);
translate([-77.5-(8*14)-0.5,130,50-4])rotate([90,90,0])cylinder(r=2.8/2,h=100);
}
}
}

module iverntech_pump_slider_plate_connect_multichannel(){
translate([-0.3,0,-0.8])difference(){
union(){
translate([-110+54.5+6-3,-81.5+1.5+40+6.6+3.5-14.5,16+15+6+3])cube([22+5-12+3,6.5,35-15-4-3+8]);
}
translate([-110+59+5.3+4.5-1,-81.5+1.5+146,36-3.4+10.25+2])rotate([90,90,0])cylinder(r=3.7/2,h=200); 

//#translate([-110+59+5.3+4.5-1+4.5+3,-81.5+1.5+146,36-3.4+10.25+2+2])rotate([90,90,0])cylinder(r=2.8/2,h=200);
for(i=[0:30]){
translate([-110+59+5.3+4.5-1,-81.5+1.5+146-4-1.5-103.4,36-3.4+10.25+2+i])rotate([90,90,0])cylinder(r=10.5/2,h=1.5);
translate([-110+59+5.3+4.5-1,-81.5+1.5+146-4-1.5-7,36-3.4+10.25+2+i])rotate([90,90,0])cylinder(r=4.5/2,h=100);
}
}
}
