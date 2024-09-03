
difference(){
translate([-154,27,101])rotate([0,90,-90])import("FilamentRunoutSensorcase.stl");
translate([0,0,-10])cube([30,30,60]);
}

translate([0,0,0])difference(){union(){
translate([0,11,4.3])cube([10,16,40]);
translate([10,11,0-30.7])cube([10,16,75]);
translate([20,11,75-5-20.2-80.5+20.1])cube([10,16,5]);
}
translate([0,19,75-10-95.7+10])rotate([0,90,0])#cylinder(r=5.8/2,h=150,$fn=300);
translate([0,19,75-10-95.7+10])rotate([0,90,0])#cylinder(r=9/2,h=17,$fn=300);
}

