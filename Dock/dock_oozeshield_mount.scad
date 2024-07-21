
/*
translate([-17,-30,31])union(){
import("dock_oozeshield_mount.stl");
difference(){
translate([62,123.4115,-1])rotate([90,0,0])cylinder(r=6/2,h=5.4,$fn=300);
translate([62,123.4115+1,-1])rotate([90,0,0])cylinder(r=2.8/2,h=15.4,$fn=300);
}
}
*/


difference(){
union(){
translate([38,-2+27+4,0])cube([13,10,36-5]);


cube([35,23,15]);
translate([35,-2,0])cube([16,34,8]);
//#translate([38,-2+27,0])cube([13,10,13]);
}

translate([5,-2,3])cube([1.5,20,30]);
translate([5+5.8,-2,3])cube([1.5,20,30]);
translate([5+(5.8*2),-2,3])cube([1.5,20,30]);
translate([5+(5.8*3),-2,3])cube([1.5,20,30]);


translate([38+6.5,-2+27+4+20,33-5])rotate([90,0,0])cylinder(r=3.2/2,h=30,$fn=300);
translate([38+6.5-3+1.33,-2+27+4+20-24,33-16-5])cube([3.33,20,16]);
translate([38+6.5,-2+27+4+20,33-16-5])rotate([90,0,0])cylinder(r=3.2/2,h=30,$fn=300);
translate([38+6.5,-2+27+4+20-9.8,33-5])rotate([90,0,0])cylinder(r=5.7/2,h=5,$fn=300);
#translate([38+6.5-3+1.33-1.2,-2+27+4+20-24+9.2,33-16-5])cube([3.33+2.4,20,16]);
#translate([38+6.5,-2+27+4+20-9.8,33-16-5])rotate([90,0,0])cylinder(r=5.7/2,h=5,$fn=300);

/*
for(i=[0:60]){
translate([38+6.5,-2+27+4+20,33-i*0.25])rotate([90,0,0])cylinder(r=3.2/2,h=30,$fn=300);
#translate([38+6.5,-2+27+4+20-9.8,33-i*0.25])rotate([90,0,0])cylinder(r=5.7/2,h=5,$fn=300);
}
*/
//#translate([38+6.5,-2+27+4+20,33-15])rotate([90,0,0])cylinder(r=3.2/2,h=30,$fn=300);

}
