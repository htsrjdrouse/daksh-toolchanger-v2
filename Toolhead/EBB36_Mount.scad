

module ebb36_mount(){

difference(){
union(){
import("EBB36_Mount.stl");
translate([10.1,-40,182.74])color("purple")cube([10,3.1,4.9]);
translate([10.1,-40-1.2,182.74-1])color("purple")cube([10,2.5,4.9]);

translate([-44,0,0]){
translate([10.1,-40,182.74])color("purple")cube([10,3.1,4.9]);
translate([10.1,-40-1.2,182.74-1])color("purple")cube([10,2.5,4.9]);
}
}
translate([10.1+4.5,-40+3,182.74+2])rotate([90,0,0])#cylinder(r=2.8/2,h=30,$fn=300);
translate([10.1+4.5-43.8,-40+3,182.74+2])rotate([90,0,0])#cylinder(r=2.8/2,h=30,$fn=300);
}

}
