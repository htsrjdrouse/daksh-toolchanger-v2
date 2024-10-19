
/*
translate([-17,-30,31])union(){
import("dock_oozeshield_mount.stl");
difference(){
translate([62,123.4115,-1])rotate([90,0,0])cylinder(r=6/2,h=5.4,$fn=300);
translate([62,123.4115+1,-1])rotate([90,0,0])cylinder(r=2.8/2,h=15.4,$fn=300);
}
}
*/

//translate([80-16.5,-36.5,23])rotate([0,0,90])dock_oozeshield();
//translate([80-16.5,-36.5,23])rotate([0,0,90])dock_oozeshield_arm();




module mod_nozzle_wiper(){

difference(){
translate([-120,-118,18-0.4])import("ultimate_nozzle_wiper_002c.stl");
#cube([20,20,20]);
}
}

/*

translate([80-16.5,-35,23])rotate([0,0,90])
translate([2-52,12+38,0-4-23]){
translate([50,-50,10])import("ultimate_nozzle_wiper_base.stl");
translate([54.6,-50+7.30,30+2])#cylinder(r=7.8/2,h=12,$fn=300);
translate([54.6,-50+7.30,30])#cylinder(r=7.8/2,h=12,$fn=300);
}
*/


module dock_oozeshield(){

difference(){
union(){

translate([38,-2+27+4,-3])cube([13+1,10,36-5+3]);
translate([38+13.5-0.3,-2+27+4-4,-3])cube([13,10+3,36-5+3]);

//#translate([38-35,-2+27+4+5,0])cube([13,5,36-5]);


translate([-5,-7+7,0-3])cube([35-10+5,23+5-7,18]);
translate([35-11,-2+5,-3])cube([16+13.5-5,34-10+5,11]);
//#translate([35-35+3,0,0])cube([16-3,34,8]);
//#translate([38,-2+27,0])cube([13,10,13]);
}


translate([2-51.25,12+38.,0-4-23-5])translate([54.6,-50+7.30,30])#cylinder(r=8.25/2,h=19,$fn=300);
//translate([2-51.25,12+38.-9,0-4-23-5])translate([54.6,-50+7.30,30])cylinder(r=8.25/2,h=19,$fn=300);


//translate([5,-2,3])cube([1.5,20,30]);
translate([5+5.8+(2.5/2),-2-5,3+12-6-1])cube([1.5+4.5,20+5,40]);
//translate([5+(5.8*2),-2,3])cube([1.5,20,30]);
//translate([5+(5.8*3),-2,3])cube([1.5,20,30]);


translate([0,0,0]){
translate([38+6.5,-2+27+4+20,33-5])rotate([90,0,0])cylinder(r=3.2/2,h=30,$fn=300);
translate([38+6.5-3+1.33,-2+27+4+20-24,33-16-5])cube([3.33,20,16]);
translate([38+6.5,-2+27+4+20,33-16-5])rotate([90,0,0])cylinder(r=3.2/2,h=30,$fn=300);
translate([38+6.5,-2+27+4+20-9.8,33-5])rotate([90,0,0])cylinder(r=5.7/2,h=5,$fn=300);
translate([38+6.5-3+1.33-1.2,-2+27+4+20-24+9.2,33-16-5])cube([3.33+2.4,20,16]);
translate([38+6.5,-2+27+4+20-9.8,33-16-5])rotate([90,0,0])cylinder(r=5.7/2,h=5,$fn=300);
}

/*
translate([0+13.5,0,0]){
translate([38+6.5,-2+27+4+20,33-5])rotate([90,0,0])cylinder(r=3.2/2,h=30,$fn=300);
translate([38+6.5-3+1.33,-2+27+4+20-24,33-16-5])cube([3.33,20,16]);
translate([38+6.5,-2+27+4+20,33-16-5])rotate([90,0,0])cylinder(r=3.2/2,h=30,$fn=300);
translate([38+6.5,-2+27+4+20-9.8,33-5])rotate([90,0,0])cylinder(r=5.7/2,h=5,$fn=300);
translate([38+6.5-3+1.33-1.2,-2+27+4+20-24+9.2,33-16-5])cube([3.33+2.4,20,16]);
translate([38+6.5,-2+27+4+20-9.8,33-16-5])rotate([90,0,0])cylinder(r=5.7/2,h=5,$fn=300);
}
*/






translate([-35,0,57]){
translate([38+6.5,-2+27+4+20,33-16-5-45])rotate([90,0,0])cylinder(r=2.8/2,h=30,$fn=300);
}



/*
for(i=[0:60]){
translate([38+6.5,-2+27+4+20,33-i*0.25])rotate([90,0,0])cylinder(r=3.2/2,h=30,$fn=300);
#translate([38+6.5,-2+27+4+20-9.8,33-i*0.25])rotate([90,0,0])cylinder(r=5.7/2,h=5,$fn=300);
}
*/
//#translate([38+6.5,-2+27+4+20,33-15])rotate([90,0,0])cylinder(r=3.2/2,h=30,$fn=300);

}

}
