





difference(){
union(){
cube([18,29,6]);
translate([15,-8,0])cube([53,20,6]);
translate([15+40,-8-11-12,0])cube([13,25,6]);
}
translate([0,6,0]){
translate([9,0,-2])cylinder(r=5.7/2,h=50,$fn=300);
translate([9,16,-2])cylinder(r=5.7/2,h=50,$fn=300);
}

translate([0,-9,0]){
translate([26,5,-2])cylinder(r=1.9/2,h=50,$fn=300);
translate([26+6.5,5,-2])cylinder(r=1.9/2,h=50,$fn=300);
}

translate([0,-12-12,0]){
translate([9+56,16-20,-2])#cylinder(r=1.9/2,h=50,$fn=300);
translate([9+56,16-20+6.5,-2])#cylinder(r=1.9/2,h=50,$fn=300);
}
}


//endstop_mod();


module endstop_mod(){
//WMYCONGCONG 50 PCS Micro Switch AC 2A 125V 3 Pin SPDT Limit Micro Switch Long Hinge Lever

difference(){
cube([12.8,5.6,6.1]);
#cylinder(r=2/2,h=50,$fn=300);
}
}
