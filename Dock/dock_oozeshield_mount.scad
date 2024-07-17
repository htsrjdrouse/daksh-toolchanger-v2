
union(){
import("dock_oozeshield_mount.stl");
difference(){
translate([62,123.4115,-1])rotate([90,0,0])cylinder(r=6/2,h=5.4,$fn=300);
translate([62,123.4115+1,-1])rotate([90,0,0])cylinder(r=2.8/2,h=15.4,$fn=300);
}
}

