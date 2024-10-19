include<../gantry/tslot.inc.scad>
include<dock_oozeshield_mount.scad>


//dock_main_mod_openscad_servo_linearactuator();
//dock_main_mod();
//dock_main_mod_openscad();
//import("Dock_main_exp_2in1.stl");

//translate([-55,100,90-0.3])rotate([90,0,0])tslot20(200);

//translate([60,0+5,-2+2.5])dock_main_mod();
//import("/Users/richard/Documents/voron/Trident/daksh_clean/Dock/Dock_main_exp_2in1.stl");

//translate([4.4,100,90.25])rotate([90,0,0])tslot20(300);

//translate([80-16.5,-36.5,23])rotate([0,0,90])dock_oozeshield();
//translate([80-16.5-48,-36.5-5,23])rotate([0,0,90])dock_oozeshield();

//translate([-52+202+60.1,20-80+84.65,120-2.8])color("pink")rotate([0,90,-90])rotate([0,0,-90])tslot20innerbracket_stable();

/*
translate([2,12,0-4]){
translate([50,-50,10])import("ultimate_nozzle_wiper_base.stl");
translate([54.6,-50+7.30,30+2])#cylinder(r=7.8/2,h=12,$fn=300);
translate([54.6,-50+7.30,30])#cylinder(r=7.8/2,h=12,$fn=300);
}
*/


//mod_nozzle_wiper();

module tslot20innerbracket_stable(){
   

 //bottom corner support
   translate([180,2,0])   rotate([0,90,-270]){  
   /*
   difference(){
   #translate([25,0,0])cube([15+0,5+0,20+0]);
    #translate([19+13,15,10])    rotate([90,0,0])    cylinder(r=5.7/2,h=50, $fn=300);
   }
   */
   difference(){
   union(){
   translate([-10+0,0,-10])cube([15+0,30+0,40+0]);
   translate([-10,4,0])cube([13,5,70]);
   //#translate([0,0,0])cube([30+0,30+0,20+0]);
   }
   //translate([27,0,-2])   cube([10,5,25]);
   //translate([0,27,-2])   #cube([10,5,25]);
   //#translate([0,30,25])   rotate([180,0,45])   cube([30,50,30]);
   translate([5+6,5,5])
   cube([20,20,9.5]);
   translate([-5-42+37+4,20-4.34,10-13.3])rotate([0,90,0])cylinder(r=9.5/2,h=50, $fn=300);
   translate([-5-42,20-4.34,10-13.3])rotate([0,90,0])cylinder(r=5.5/2,h=80, $fn=300);
   translate([-5-42+37+4,20-4.34,10-13.3+24])rotate([0,90,0])cylinder(r=9.5/2,h=80, $fn=300);
   translate([-5-42,20-4.34,10-13.3+24])rotate([0,90,0])cylinder(r=5.5/2,h=80, $fn=300);

    //#translate([19,15,10])    rotate([90,0,0])    cylinder(r=5.7/2,h=50, $fn=300);
    translate([19-22,35,10])    rotate([90,0,0])    cylinder(r=5.7/2,h=50, $fn=300);
    translate([19-22,54,10])    rotate([90,0,0])    cylinder(r=9.7/2,h=50, $fn=300);
    #translate([19-22-13.5+13.5,35,65.4])    rotate([90,0,0])    cylinder(r=3.7/2,h=50, $fn=300);
   }
    //translate([-2,0,7.5])   # cube([5,13,5]);
   }
}




module test_dock(){

#color("pink")import("/Users/richard/Documents/voron/Trident/daksh_clean/Dock/daksh_clean/Dock/Dock_main_exp_2in1.stl");

}

module dock_main_mod(){
//color("orange")translate([-59.78,0,-0.25])
color("pink")import("Dock_main.stl");
difference(){
union(){
//color("orange")translate([59.78,0,-0.25])import("../Dock/dock-mount.stl");
translate([0,0.1,0])import("dock-mount.stl");
color("pink")import("/Users/richard/Documents/voron/Trident/daksh_clean/Dock/Dock_main.stl");
//import("dock-mount.stl");
//#translate([-20,3.05,133.95])rotate([0,90,0])cylinder(r=4.15/2,h=120,$fn=300);
//translate([-20,3.05,133.95-55.35])rotate([0,90,0])cylinder(r=4.15/2,h=120,$fn=300);
translate([-35+4,3.0,133.95-7.4])rotate([0,90,0])cylinder(r=5.5/2,h=30,$fn=300);
translate([-35+4,3.0+0.25,133.95-7.4-41.74])rotate([0,90,0])cylinder(r=5.5/2,h=14,$fn=300);
translate([-60,0,2]){
translate([30-0.11,-3.186,87])cube([25,12.692,35]);
translate([30-0.11-2,-3.186,87-3])cube([10,12.692,8.7]);
translate([30-0.11-2,-3.186,87-3-14.3])cube([1.4,12.692,15]);
translate([30-0.11-2,-3.186,87+30])cube([10,12.692,5]);
translate([30-0.11-2,-3.186,87+30])cube([1.4,12.692,24.3]);
}

translate([0,0,0]){
translate([0,0,0]){
translate([12.45,5.06,60.95])rotate([90,0,0])cylinder(r=6.5/2,h=8.3,$fn=300);
translate([0,0,78.6])
translate([12.45,5.06,60.95])rotate([90,0,0])cylinder(r=6.5/2,h=8.3,$fn=300);
translate([-38.75,0,81.2])
translate([12.45,5.06,60.95])rotate([90,0,0])cylinder(r=8.5/2,h=8.3,$fn=300);
translate([-38.75,0,81.2+14])
translate([12.45,5.06,60.95])rotate([90,0,0])cylinder(r=5.5/2,h=8.3,$fn=300);
translate([-39,0,9.4])
translate([12.45,5.06,60.95])rotate([90,0,0])cylinder(r=8.5/2,h=8.3,$fn=300);
}
}
translate([-39,0,9.4]){
translate([12.45,5.06-5.6,60.95])rotate([90,0,0])cylinder(r=8.1/2,h=2.7,$fn=300);
translate([12.45,5.06-5.6,60.95-6.5])rotate([90,0,0])cylinder(r=5.1/2,h=2.7,$fn=300);
}
translate([-60-2,0,2]){
translate([30-0.11-2,-3.186+4,87-3-14.3+2])cube([1.4+1,12.692-8,17]);
}
translate([-38.75,0,81.2])translate([12.45,5.06-5.6,60.95])rotate([90,0,0])cylinder(r=8.1/2,h=12.7,$fn=300);
translate([0,0,78.6])translate([12.45,5.06-5.6,60.95])rotate([90,0,0])cylinder(r=6.1/2,h=2.7,$fn=300);
translate([12.45,5.06-5.6,60.95])rotate([90,0,0])cylinder(r=6.1/2,h=2.7,$fn=300);
translate([-60-0.,0,2-2.5]){
translate([35-1.56+0.3,-10+6.6,124.96-3-5])rotate([-90,0,0])color("silver")cylinder(r2=5.0/2,r1=10/2,h=4,$fn=300);
translate([35-1.56+0.3,-10,124.96-3-5])rotate([-90,0,0])color("silver")cylinder(r=5.0/2,h=32,$fn=300);
translate([35-1.56+0.3,-10+6.6,82.96+3+5])rotate([-90,0,0])color("silver")cylinder(r2=5.0/2,r1=10/2,h=4,$fn=300);
translate([35-1.56+0.3,-10,82.96+3+5])rotate([-90,0,0])color("silver")cylinder(r=5.0/2,h=32,$fn=300);
}
translate([-60-0.,0,2]){
translate([35-1.56+0.3+12,-10,124.96-3-6])rotate([-90,0,0])color("silver")cylinder(r=4.8/2,h=32,$fn=300);
translate([35-1.56+0.3+12,-10,124.96-3-30])rotate([-90,0,0])color("silver")cylinder(r=4.8/2,h=32,$fn=300);
}
}
translate([-35+4-6,3.0,133.95-7.4])rotate([0,90,0])cylinder(r=3.9/2,h=46,$fn=300);
translate([-35+4-6,3.0,133.95-7.4-41.74])rotate([0,90,0])cylinder(r=3.9/2,h=24,$fn=300);
translate([-35+4-6,3.0,133.95-7.4+7.4])rotate([0,90,0])cylinder(r=3.95/2,h=86,$fn=300);
translate([-35+4-6,3.0,133.95-7.4-41.74-6.3])rotate([0,90,0])cylinder(r=3.95/2,h=74,$fn=300);

// magnets
translate([-38.75,0,81.2])translate([12.45,5.06-5.6,60.95])rotate([90,0,0])cylinder(r=8.1/2,h=2.7+1,$fn=300);
translate([-38.75,0,81.2-34.7])translate([12.45,5.06-5.6,60.95])rotate([90,0,0])cylinder(r=6.5/2,h=2.7+1,$fn=300);
translate([-38.75,0,81.2-34.7])translate([12.45,5.06-5.6,60.95+23])rotate([90,0,0])cylinder(r=8.1/2,h=2.7+1,$fn=300);

translate([-39,0,9.4])
translate([12.45,5.06-5.6,60.95])rotate([90,0,0])cylinder(r=8.1/2,h=2.7+20,$fn=300);

}

difference(){union(){
translate([2.74,-0.15,136.2])cylinder(r=4/2,h=7.3,$fn=300);
translate([2.74,-0.15+7,136.2])cylinder(r=4/2,h=7.3,$fn=300);
translate([2.74,-0.15,136.2-13])cylinder(r=4/2,h=7.3,$fn=300);
translate([2.74,-0.15+7,136.2-13])cylinder(r=4/2,h=7.3,$fn=300);

}
translate([2.74,-0.15,136.2-14])cylinder(r=2.9/2,h=22,$fn=300);
translate([2.74,-0.15+7,136.2-14])cylinder(r=2.9/2,h=22,$fn=300);
}


//dock_main();

}











module dock_main_mod_openscad_servo_linearactuator(){
//color("orange")translate([-59.78,0,-0.25])
//color("pink")import("/Users/richard/Documents/voron/Trident/daksh_clean/Dock/Dock_main.stl");
//translate([0,0.1,0])import("dock-mount.stl");
//translate([-60,0-5.,-0.4])import("Dock_main_exp_2in1.stl");

difference(){
translate([-60,0,2]){
translate([30-0.11-18.18-0.4+18.58-0.9+12+25,-3.186-0,87+25.8-47.1+2.2-15.3])cube([16,12.692,10+70]);
}
translate([-35+4-6,3.0,133.95-7.4+7.4])rotate([0,90,0])cylinder(r=4.05/2,h=86,$fn=300);
translate([-35+4-6,3.0,133.95-7.4-41.74-6.3])rotate([0,90,0])cylinder(r=4.05/2,h=74,$fn=300);
}
difference(){
union(){
//color("orange")translate([59.78,0,-0.25])import("../Dock/dock-mount.stl");
//translate([0,0.1,0])import("dock-mount.stl");
//#color("pink")import("/Users/richard/Documents/voron/Trident/daksh_clean/Dock/Dock_main.stl");
//import("dock-mount.stl");
//#translate([-20,3.05,133.95])rotate([0,90,0])cylinder(r=4.15/2,h=120,$fn=300);
//translate([-20,3.05,133.95-55.35])rotate([0,90,0])cylinder(r=4.15/2,h=120,$fn=300);
translate([-35+4,3.0,133.95-7.4])rotate([0,90,0])cylinder(r=5.5/2,h=30,$fn=300);
translate([-35+4,3.0+0.25,133.95-7.4-41.74])rotate([0,90,0])cylinder(r=5.5/2,h=14,$fn=300);

translate([-60,0,2]){
translate([30-0.11-18.18-0.4+18.58-0.9+12+6,-3.186,87+25.8-47.1+2.2-15.3+88-88-10])cube([5,12.692,20]);

translate([30-0.11-18.18-0.4+18.58-0.9+18,-3.186,87+25.8-47.1+2.2-15.3+88])cube([10,12.692,20]);
//#translate([30-0.11-18.18-0.4+18.58-0.9+12,-3.186-0,87+25.8-47.1+2.2-15.3+98])cube([12,12.692,10]);
translate([30-0.11-18.18-0.4+18.58-0.9+12+25,-3.186-0,87+25.8-47.1+2.2-15.3])cube([16,12.692,10+70]);
translate([30-0.11-18.18-0.4+18.58,-3.186,87+25.8-47.1+2.2-15.3])cube([25-5+30+12+5,12.692,24.9+64.2]);

translate([30-0.11-18.18-0.4+18.58-0.9,-3.186,87+25.8-47.1+2.2-15.])cube([25-5+30.9,12.692,24.9+15]);
translate([30-0.11-18.18-0.4,-3.186,87+25.8-47.1+2.2])cube([25-5,12.692,24.9]);
translate([30-0.11-18.18,-3.186,87+25.8])cube([25-4,12.692,27]);
translate([30-0.11-18.18,-3.186-11-3,87+25.8])cube([25-8,12.692+3,27]);
translate([30-0.11,-3.186,87])cube([25,12.692,35]);
translate([30-0.11-2,-3.186,87-3])cube([10,12.692,8.7]);
translate([30-0.11-2,-3.186,87-3-14.3])cube([1.4,12.692,15]);
translate([30-0.11-2,-3.186,87+30])cube([10,12.692,5]);
//#translate([30-0.11-2,-3.186,87+30])cube([1.4,12.692,24.3]);
}
}
translate([-100,3,50-0.3])rotate([0,90,0])#cylinder(r=4/2,h=200,$fn=300);

translate([0+12+6,0,0]){
//translate([12.45,5.06,60.95])rotate([90,0,0])cylinder(r=6.5/2,h=8.3,$fn=300);
translate([12.45,5.06,60.95])rotate([90,0,0])cylinder(r=6.5/2,h=2.7+1,$fn=300);
//#translate([0,0,78.6])translate([12.45,5.06,60.95])rotate([90,0,0])cylinder(r=6.5/2,h=8.3,$fn=300);
#translate([0,0,78.6])translate([12.45,5.06,60.95])rotate([90,0,0])cylinder(r=6.5/2,h=2.7+1,$fn=300);
//translate([-38.75,0,81.2])
//translate([12.45,5.06,60.95])rotate([90,0,0])cylinder(r=8.5/2,h=8.3,$fn=300);
translate([-38.75,0,81.2+14])
translate([12.45,5.06+5,60.95-2])rotate([90,0,0])cylinder(r=2.8/2,h=28.3,$fn=300);
//translate([-39,0,9.4])
//translate([12.45,5.06,60.95-2])rotate([90,0,0])cylinder(r=8.5/2,h=8.3,$fn=300);
translate([-39,0,9.4]){
translate([12.45,5.06-5.6,60.95-2])rotate([90,0,0])cylinder(r=8.1/2,h=2.7,$fn=300);
//#translate([12.45,5.06-5.6,60.95-6.5])rotate([90,0,0])cylinder(r=5.1/2,h=2.7,$fn=300);
}
translate([-60-2,0,2]){
translate([30-0.11-2,-3.186+4,87-3-14.3+2])cube([1.4+1,12.692-8,17]);
}
translate([-38.75,0,81.2])translate([12.45,5.06-5.6,60.95])rotate([90,0,0])cylinder(r=8.1/2,h=12.7,$fn=300);
translate([0,0,78.6])translate([12.45,5.06-5.6,60.95])rotate([90,0,0])cylinder(r=6.1/2,h=2.7,$fn=300);
translate([12.45,5.06-5.6,60.95])rotate([90,0,0])cylinder(r=6.1/2,h=2.7,$fn=300);
translate([-60-0.,0,2-2.5]){
translate([35-1.56+0.3,-10+6.6,124.96-3-5])rotate([-90,0,0])color("silver")cylinder(r2=5.0/2,r1=10/2,h=4,$fn=300);
translate([35-1.56+0.3,-10,124.96-3-5])rotate([-90,0,0])color("silver")cylinder(r=5.0/2,h=32,$fn=300);
translate([35-1.56+0.3,-10+6.6,82.96+3+5])rotate([-90,0,0])color("silver")cylinder(r2=5.0/2,r1=10/2,h=4,$fn=300);
translate([35-1.56+0.3,-10,82.96+3+5])rotate([-90,0,0])color("silver")cylinder(r=5.0/2,h=32,$fn=300);
}

// magnets
translate([-38.75,0,81.2])translate([12.45,5.06-5.6,60.95])rotate([90,0,0])cylinder(r=8.1/2,h=2.7+1,$fn=300);
translate([-38.75,0,81.2-34.7])translate([12.45,5.06-5.6,60.95])rotate([90,0,0])cylinder(r=6.5/2,h=2.7+1,$fn=300);
translate([-38.75,0,81.2-34.7])translate([12.45,5.06-5.6,60.95+23])rotate([90,0,0])cylinder(r=8.1/2,h=2.7+1,$fn=300);
//translate([-39,0,9.4])translate([12.45,5.06-5.6,60.95])rotate([90,0,0])cylinder(r=8.1/2,h=2.7+20,$fn=300);


/*
#translate([0,0,0]){
translate([2.74,-0.15,136.2-14])cylinder(r=2.9/2,h=22,$fn=300);
translate([2.74,-0.15+7,136.2-14])cylinder(r=2.9/2,h=22,$fn=300);
}
#translate([0,0,-110]){
translate([2.74,-0.15,136.2-14])cylinder(r=3.05/2,h=122,$fn=300);
translate([2.74,-0.15+7,136.2-14])cylinder(r=3.05/2,h=122,$fn=300);
}
*/
}

/*
translate([-60-0.,0,2]){
translate([35-1.56+0.3+12,-10,124.96-3-6])rotate([-90,0,0])color("silver")cylinder(r=4.8/2,h=32,$fn=300);
translate([35-1.56+0.3+12,-10,124.96-3-30])rotate([-90,0,0])color("silver")cylinder(r=4.8/2,h=32,$fn=300);
}
*/

translate([-35+4-6,3.0,133.95-7.4])rotate([0,90,0])cylinder(r=3.9/2,h=46,$fn=300);
translate([-35+4-6,3.0,133.95-7.4-41.74])rotate([0,90,0])cylinder(r=3.9/2,h=24,$fn=300);
#translate([-35+4-6,3.0,133.95-7.4+7.4])rotate([0,90,0])cylinder(r=4.05/2,h=86,$fn=300);
#translate([-35+4-6,3.0,133.95-7.4-41.74-6.3])rotate([0,90,0])cylinder(r=4.05/2,h=74,$fn=300);

translate([-35+4-9,3.0,133.95-7.4-41.74-6.3-20])rotate([0,0,0])cylinder(r=5.3/2,h=94,$fn=300);
translate([-35+4-9,3.0,133.95-7.4-41.74-6.3-20+62.5])rotate([0,0,0])cylinder(r=10.3/2,h=44,$fn=300);

translate([-35+4-9,3.0-13,133.95-7.4-41.74-6.3-20+62.5])rotate([0,0,0])cylinder(r=10.3/2,h=44,$fn=300);
translate([-35+4-9,3.0-13,133.95-7.4-41.74-6.3-20])rotate([0,0,0])cylinder(r=5.3/2,h=94,$fn=300);

translate([-35+4-9,3.0,133.95-7.4-41.74-6.3-20+62.5-74.3])rotate([0,0,0])cylinder(r=10.3/2,h=44,$fn=300);
translate([-35+4-9-9,3.0-2.5,133.95-7.4-41.74-6.3-20+62.5-47])rotate([0,0,0])cube([5,5,16.5+0]);
//#translate([-35+4-9-5,3.0,133.95-7.4-41.74-6.3-20+62.5])rotate([0,0,0])cylinder(r=10.3/2,h=18,$fn=300);
translate([-35+4-9-9,3.0-2.5,133.95-7.4-41.74-6.3-20+62.5])rotate([0,0,0])cube([5,5,18+0]);


#translate([30-0.11-18.18-0.4+18.58-0.9-35+5,-3.186-1,87+25.8-47.1+2.2-15.+30])cube([25-5+30.9,12.692+5,24.9+20-5]);
//#translate([30-0.11-18.18-0.4+18.58-0.9-35,-3.186-1,87+25.8-47.1+2.2-15.+16])rotate([-90,0,0])cylinder(r=12,h=50,$fn=300);


}

/*
difference(){
union(){
translate([2.74,-0.15,136.2])cylinder(r=4/2,h=7.3,$fn=300);
translate([2.74,-0.15+7,136.2])cylinder(r=4/2,h=7.3,$fn=300);
translate([2.74,-0.15,136.2-13])cylinder(r=4/2,h=7.3,$fn=300);
translate([2.74,-0.15+7,136.2-13])cylinder(r=4/2,h=7.3,$fn=300);
}
translate([2.74,-0.15,136.2-14])cylinder(r=2.9/2,h=22,$fn=300);
translate([2.74,-0.15+7,136.2-14])cylinder(r=2.9/2,h=22,$fn=300);
}
*/

//dock_main();

}




























module dock_main(){

	/*
	difference(){
translate([12.45,5.06,60.95])rotate([90,0,0])cylinder(r=6.5/2,h=8.3,$fn=300);
translate([12.45,5.06-5.6,60.95])rotate([90,0,0])cylinder(r=6.1/2,h=2.7,$fn=300);
}

translate([0,0,78.6])difference(){
translate([12.45,5.06,60.95])rotate([90,0,0])cylinder(r=6.5/2,h=8.3,$fn=300);
translate([12.45,5.06-5.6,60.95])rotate([90,0,0])cylinder(r=6.1/2,h=2.7,$fn=300);
}

translate([-38.75,0,81.2])difference(){
translate([12.45,5.06,60.95])rotate([90,0,0])cylinder(r=8.5/2,h=8.3,$fn=300);
translate([12.45,5.06-5.6,60.95])rotate([90,0,0])cylinder(r=8.1/2,h=2.7,$fn=300);
}

translate([-38.75,0,81.2+14])
translate([12.45,5.06,60.95])rotate([90,0,0])cylinder(r=5.5/2,h=8.3,$fn=300);
*/

translate([-39,0,9.4])difference(){
translate([12.45,5.06,60.95])rotate([90,0,0])cylinder(r=8.5/2,h=8.3,$fn=300);
translate([12.45,5.06-5.6,60.95])rotate([90,0,0])cylinder(r=8.1/2,h=2.7,$fn=300);
translate([12.45,5.06-5.6,60.95-6.5])rotate([90,0,0])cylinder(r=5.1/2,h=2.7,$fn=300);
}


}
