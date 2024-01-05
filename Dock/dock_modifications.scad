

//dock_main();
dock_mount();

//import("dock-main.stl");

module dock_mount(){
difference(){
union(){
translate([0,74,0])import("dock-mount.stl");
translate([-60+11.2+0.1,0+9.0,100-9.3+1.10-8.1])cube([18+6.5-7,20,3+8]);
translate([-60+11.2+0.5,0+9.0,100-9.3+1.10-8.1+31.101])cube([18+6.5-7,20,3+8]);
}
translate([-60+11.2+0.1+9,0+9.0+11,100-9.3+1.10-8.1-20])#cylinder(r=5.8/2,h=100,$fn=300);
translate([-60+11.2+0.1+9,0+9.0+11,100-9.3+1.10-8.1-20+62-11+4])#cylinder(r=12/2,h=10,$fn=300);
translate([-60+11.2+0.1+9,0+9.0+11,100-9.3+1.10-8.1-20+22-12+4])#cylinder(r=12/2,h=10,$fn=300);
}

}

module dock_main(){
difference(){
union(){
//color("lime")import("Dock_main.stl");
translate([0,0,2.2])import("dock-main.stl");
translate([-26.4,-20+18+2,155.85])rotate([90,0,0])sm_mag_mod(0.5,1.25);
translate([-26.3,-20+18+5.05-3.2+4,155.85-13.7])rotate([90,0,0])lg_mag_mod(0.3,4.1);
translate([-26.3+38.76,-20+18+5.05-3.2+4,155.85-13.7-2.6])rotate([90,0,0])md_mag_mod(0.5,4.1);
translate([-26.3+38.76,-20+18+5.05-3.2+4,155.85-13.7-2.6-78.6])rotate([90,0,0])md_mag_mod(0.5,4.1);

translate([-26.55,-20+18+5.05-3.2+4,155.85-13.7-71.83])rotate([90,0,0])lg_mag_mod(0.3,4.1);
translate([2.65,-0.3,54.5])m3_smooth(1,10.1);
translate([2.65,-0.3+7,54.5])m3_smooth(1,10.1);
translate([0,0,29.5]){
translate([2.65,-0.3,54.5])m3_smooth(1,9);
translate([2.65,-0.3+7,54.5])m3_smooth(1,9);
}
translate([0.1,0,67]){
translate([2.65,-0.3,54.5])m3_smooth(1,22);
translate([2.65,-0.3+7,54.5])m3_smooth(1,22);
}


translate([2.65-33.7,0.15+2.95,78.55])rotate([0,90,0])m4_smooth(1,11.5);
translate([2.65+3,0.15+2.95,78.55])rotate([0,90,0])m4_smooth(1,14.1);
translate([2.65-33.63,0.15+2.95,78.55+55.4])rotate([0,90,0])m4_smooth(1,50.75);
}
translate([-26.3,-20+18+5.05-3.2+3.2,155.85-13.7])rotate([90,0,0])lg_mag_mod(0.,0.1+3.2);
translate([-26.3+38.76,-20+18+5.05-3.2+3.2,155.85-13.7-2.6])rotate([90,0,0])md_mag_mod(0,0.1+3.2);
translate([-26.3+38.76,-20+18+5.05-3.2+3.2,155.85-13.7-2.6-78.6])rotate([90,0,0])md_mag_mod(0,0.1+3.2);

translate([-26.55,-20+18+5.05-3.2+3.2,155.85-13.7-71.83])rotate([90,0,0])lg_mag_mod(0,0.1+3.2);

translate([2.65,-0.3,54.5])m3_smooth(0,90.1);
translate([2.65,-0.3+7,54.5])m3_smooth(0,90.1);
translate([2.65-33.63,0.15+2.95,78.55])rotate([0,90,0])#m4_smooth(0,60.75);
translate([2.65-33.63,0.15+2.95,78.55+55.4])rotate([0,90,0])#m4_smooth(0,60.75);

}

}
module sm_mag_mod(d,h){color("silver")cylinder(r=(4+d)/2, h=(2+h), $fn=300);}
module md_mag_mod(d,h){color("silver")cylinder(r=(6+d)/2, h=(3+h), $fn=300);}
module lg_mag_mod(d,h){color("silver")cylinder(r=(8+d)/2, h=(3+h), $fn=300);}
module m3_smooth(d,h){color("silver")cylinder(r=(3+d)/2,h=h,$fn=300);}
module m4_smooth(d,h){color("silver")cylinder(r=(4+d)/2,h=h,$fn=300);}

