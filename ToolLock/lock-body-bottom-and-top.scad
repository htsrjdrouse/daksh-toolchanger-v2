
//lockbodybottom();
//lockbodytop();


//import("lock-body-top.stl");
//import("lock-body-top-mod.stl");
lockbodybottom();
//import("lock-body-bottom-mod.stl");
//translate([28.19805,106.16,-55])color("pink")rotate([0,0,-90])import("lock-body-top_dakash2.stl");
translate([28.19805,106.16,-55])color("pink")rotate([0,0,-90])import("lock-body-bottom_dakash2.stl");


//color("pink")translate([28.198,110-2.84,-100+15])rotate([0,0,-90])import("test.this.lock-body-top.stl");
//color("pink")translate([28.198,110-2.84,-100+15])rotate([0,0,-90])import("../../daksh-toolchanger-v2/STL/ToolLock/lock-body-top.stl");
//translate([0,0,-30])import("lock-body-top.stl");
//translate([0,0,0])color("lime")lockbodytop();
//import("carriage-mgn12-integrated--belt-groove.stl");
//carriage_mgn12_integrated_belt_groove();

//nomgn12_bottom_spacer();

//translate([-13.55,-20,7])color("lime")rotate([90,0,0])import("dowel_and_nut.stl");
//color("silver")translate([-21.6-0+3.55,-40.35+10+2.25,0])rotate([0,0,0])cylinder(r=3/2,h=30,$fn=300);
//color("silver")translate([-21.6-0+3.55+9,-40.35+10+2.25,0])rotate([0,0,0])cylinder(r=3/2,h=30,$fn=300);

/*
color("")import("lock-body-bottom-mod.stl");
difference(){
union(){
color("pink")translate([-21.6-0+8.1,-40.35+10+22.25-16.25,8])rotate([90,0,0])rotate([0,0,45])cylinder(r=16/2,h=7.5,$fn=4);
color("pink")translate([-21.6-0+8.1+28.33+0.25,-40.35+10+22.25-16.25,8])rotate([90,0,0])rotate([0,0,45])cylinder(r=16/2,h=7.5,$fn=4);
}
color("lime")translate([-21.6-0+8.1,-40.35+10+22.25-16.25+5,8])rotate([90,0,0])rotate([0,0,45])cylinder(r=6.1/2,h=7.5+5,$fn=300);
color("lime")translate([-21.6-0+8.1+28.33+0.25,-40.35+10+22.25-16.25+5,8])rotate([90,0,0])rotate([0,0,45])cylinder(r=6.1/2,h=7.5+5,$fn=300);
}*/




module carriage_mgn12_integrated_belt_groove(){
import("carriage-mgn12-integrated--belt-groove.stl");
//translate([-13.30,0-10,37+0.1])rotate([90,0,0])#cylinder(r=3.3/2,h=50,$fn=300);
}



module nomgn12_bottom_spacer(){
color("pink")import("spring-spacer-bottom.stl");
translate([-21.55495,-42.462,13.4])color("peru")cube([50-4,10-2+0.5,20.8]);
}



module lockbodytop(){
//import("lock-body-top.stl");
//translate([28.19805,106.16,-55])color("pink")rotate([0,0,-90])import("lock-body-top_dakash2.stl");
difference(){
union(){
import("lock-body-top.stl");
//translate([28.19805,106.16,-55])color("pink")rotate([0,0,-90])import("lock-body-top_dakash2.stl");
//import("lock-body-top_dakash2.stl");
translate([-21.6,-40.35,0+89.4])color("pink")cube([46,3+5,13.4]);
translate([-21.6,-40.35,34.4+26.4])color("pink")cube([46,3+5,13.4-5.8]);
/*
color("lime")translate([-21.6-0+8.1+(28.33+0.25)/2,-40.35+10+22.25-16.25,8+89.15])rotate([90,0,0])rotate([0,0,45])cylinder(r=16/2,h=7.5,$fn=4);
color("lime")translate([-21.6-0+8.1+(28.33+0.25)/2-2,-40.35+10+22.25-16.25,8+89.15])rotate([90,0,0])rotate([0,0,45])cylinder(r=16/2,h=7.5,$fn=4);
color("lime")translate([-21.6-0+8.1+(28.33+0.25)/2,-40.35+10+22.25-16.25,8+89.15-4.2])rotate([90,0,0])rotate([0,0,45])cylinder(r=16/2,h=7.5,$fn=4);
color("lime")translate([-21.6-0+8.1+(28.33+0.25)/2-2,-40.35+10+22.25-16.25,8+89.15-4.2])rotate([90,0,0])rotate([0,0,45])cylinder(r=16/2,h=7.5,$fn=4);
*/

//#color("lime")translate([-21.6-0+8.1+9.225,-40.35+10+22.25-16.25+5-8.7,98])rotate([0,0,0])cylinder(r=(3)/2,h=180,$fn=300);
//#color("lime")translate([-21.6-0+8.1+9.225+11,-40.35+10+22.25-16.25+5-8.7,98])rotate([0,0,0])cylinder(r=(3)/2,h=180,$fn=300);

}
#translate([-3+(28.33+0.25-1)/2+3,0,87]){
/*
color("lime")translate([-21.6-0+8.1,-40.35+10+22.25-16.25+5,8+1])rotate([90,0,0])rotate([0,0,45])cylinder(r=6.1/2,h=7.5+5,$fn=300);
color("lime")translate([-21.6-0+8.1,-40.35+10+22.25-16.25+5,8])rotate([90,0,0])rotate([0,0,45])cylinder(r=(6.1+0)/2,h=7.5+5,$fn=300);
color("lime")translate([-21.6-0+8.1,-40.35+10+22.25-16.25+5,8-1])rotate([90,0,0])rotate([0,0,45])cylinder(r=6.1/2,h=7.5+5,$fn=300);
*/
}



//translate([-21.6-0+23,-40.35+30,9.15+26.4])rotate([90,0,0])#cylinder(r=3.3/2,h=100,$fn=300);
translate([-1.35,0,27.7]){
translate([-21.6-0+23-14.75,-40.35+30,34.4+2.7])rotate([90,0,0])cylinder(r=3.3/2,h=100,$fn=300);
translate([-21.6-0+23+14.25+3,-40.35+30,34.4+2.7])rotate([90,0,0])cylinder(r=3.3/2,h=100,$fn=300);
}
translate([-1.35-0.65,0,57-0.2]){
translate([-21.6-0+23-14.75,-40.35+30,34.4+2.7])rotate([90,0,0])cylinder(r=3.3/2,h=100,$fn=300);
translate([-21.6-0+23+14.25+3+0.5,-40.35+30,34.4+2.7])rotate([90,0,0])cylinder(r=3.3/2,h=100,$fn=300);
//translate([-21.6-0+23,-40.35+30,9.15])rotate([90,0,0])#cylinder(r=3.3/2,h=100,$fn=300);
#translate([0,0,0]){
translate([-21.6-0+8.22,-40.35+30-13.5,9.15+28])rotate([90,90,0])cylinder(r=6.4/2,h=0.3+10.3,$fn=6);
translate([-21.6-0+8.22+32.6,-40.35+30-13.5,9.15+28])rotate([90,90,0])cylinder(r=6.4/2,h=0.3+10.3,$fn=6);
translate([-21.6-0+8.22+32.6,-40.35+30-13.5,8.10])rotate([90,90,0])cylinder(r=6.5/2,h=0.3+10.3,$fn=306);
translate([-21.6-0+8.22+0.6,-40.35+30-13.5,8.10])rotate([90,90,0])cylinder(r=6.5/2,h=0.3+10.3,$fn=306);
}
}
}
}




module lockbodybottom(){
difference(){
union(){
import("lock-body-bottom.stl");
//translate([28.19805,106.16,-55])color("pink")rotate([0,0,-90])import("lock-body-bottom_dakash2.stl");
//color("lime")translate([-21.6-0+8.1,-40.35+10+22.25-16.25,8])rotate([90,0,0])rotate([0,0,45])cylinder(r=16/2,h=7.5,$fn=4);
//color("lime")translate([-21.6-0+8.1+28.33+0.25,-40.35+10+22.25-16.25,8])rotate([90,0,0])rotate([0,0,45])cylinder(r=16/2,h=7.5,$fn=4);

#translate([-21.6,-40.35,0])color("pink")cube([46,3+6.2,13.4]);
translate([-21.6,-40.35,34.4])color("pink")cube([46,3,13.4-8.3]);
//color("silver")translate([-21.6-0+3.55,-40.35+10+2,-3])rotate([0,0,0])cylinder(r=3/2,h=100,$fn=300);
}
/*
#translate([0,-3,0]){
color("lime")translate([-21.6-0+8.1,-40.35+10+22.25-16.25+5,8+1])rotate([90,0,0])rotate([0,0,45])cylinder(r=6.1/2,h=7.5+5,$fn=300);
color("lime")translate([-21.6-0+8.1,-40.35+10+22.25-16.25+5,8])rotate([90,0,0])rotate([0,0,45])cylinder(r=6.1/2,h=7.5+5,$fn=300);
color("lime")translate([-21.6-0+8.1,-40.35+10+22.25-16.25+5,8-1])rotate([90,0,0])rotate([0,0,45])cylinder(r=6.1/2,h=7.5+5,$fn=300);
}

#translate([0,-3,0]){
color("lime")translate([-21.6-0+8.1+28.33+0.25-1,-40.35+10+22.25-16.25+5,8])rotate([90,0,0])rotate([0,0,45])cylinder(r=6.1/2,h=7.5+5,$fn=300);
color("lime")translate([-21.6-0+8.1+28.33+0.25+1,-40.35+10+22.25-16.25+5,8])rotate([90,0,0])rotate([0,0,45])cylinder(r=6.1/2,h=7.5+5,$fn=300);
color("lime")translate([-21.6-0+8.1+28.33+0.25,-40.35+10+22.25-16.25+5,8])rotate([90,0,0])rotate([0,0,45])cylinder(r=6.1/2,h=7.5+5,$fn=300);
}
*/


translate([-21.6-0+23.02,-40.35+30,9.2])rotate([90,0,0])cylinder(r=3.2/2,h=100,$fn=300);
translate([-21.6-0+23.02,-40.35+30,9.2])rotate([90,0,0])rotate([0,0,90])#cylinder(r=6.4/2,h=17+4,$fn=6);

translate([-21.6-0+23+14.25,-40.35+30-13.5,9.15+28])rotate([90,90,0])cylinder(r=6.5/2,h=0.3+6.3,$fn=300);
translate([-21.6-0+23-14.6,-40.35+30-13.5,9.15+28])rotate([90,90,0])cylinder(r=6.5/2,h=0.3+6.3,$fn=300);


translate([-21.6-0+23-14.75,-40.35+30,34.4+2.7])rotate([90,0,0])cylinder(r=3.3/2,h=100,$fn=300);
translate([-21.6-0+23+14.25,-40.35+30,34.4+2.7])rotate([90,0,0])cylinder(r=3.3/2,h=100,$fn=300);
}
}
