include<../tslot.inc.scad>



//translate([-55,100,90-0.3])rotate([90,0,0])tslot20(200);

translate([60,0+5,-2+2.5])dock_main_mod();
//import("Dock_main_exp_2in1.stl");

//translate([-52+202,20-80,120-3.3])color("pink")rotate([0,90,-90])rotate([0,0,-90])tslot20innerbracket_stable();


module tslot20innerbracket_stable(){
   

 //bottom corner support
   translate([180,2,0])   rotate([0,90,-270]){  
   difference(){
   translate([25,0,0])cube([15+0,5+0,20+0]);
    #translate([19+13,15,10])    rotate([90,0,0])    cylinder(r=5.7/2,h=50, $fn=300);
   }
   difference(){
   union(){
   translate([-10+0,0,-10])cube([15+0,30+0,40+0]);
   translate([0,0,0])cube([30+0,30+0,20+0]);
   }
   //translate([27,0,-2])   cube([10,5,25]);
   translate([0,27,-2])
   cube([10,5,25]);
   translate([0,30,25])   rotate([180,0,45])   cube([30,50,30]);
   translate([5+6,5,5])
   cube([20,20,9.5]);
   translate([-5-42+37+4,20-4.34,10-13.3])rotate([0,90,0])cylinder(r=9.5/2,h=50, $fn=300);
   translate([-5-42,20-4.34,10-13.3])rotate([0,90,0])cylinder(r=5.5/2,h=80, $fn=300);
   translate([-5-42+37+4,20-4.34,10-13.3+24])rotate([0,90,0])cylinder(r=9.5/2,h=80, $fn=300);
   translate([-5-42,20-4.34,10-13.3+24])rotate([0,90,0])cylinder(r=5.5/2,h=80, $fn=300);

    translate([19,15,10])    rotate([90,0,0])    cylinder(r=5.7/2,h=50);
   }
    //translate([-2,0,7.5])   # cube([5,13,5]);
   }
}




module dock_main_mod(){

//color("orange")translate([-59.78,0,-0.25])
difference(){
union(){
//color("orange")translate([59.78,0,-0.25])import("../Dock/dock-mount.stl");
translate([0,0.1,0])import("dock-mount.stl");
color("pink")import("../Dock/Dock_main.stl");
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
#translate([30-0.11-2,-3.186+4,87-3-14.3+2])cube([1.4+1,12.692-8,17]);
}
translate([-38.75,0,81.2])
translate([12.45,5.06-5.6,60.95])rotate([90,0,0])cylinder(r=8.1/2,h=12.7,$fn=300);
translate([0,0,78.6])
translate([12.45,5.06-5.6,60.95])rotate([90,0,0])cylinder(r=6.1/2,h=2.7,$fn=300);
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

translate([-35+4-6,3.0,133.95-7.4])rotate([0,90,0])cylinder(r=3.9/2,h=46,$fn=300);
translate([-35+4-6,3.0,133.95-7.4-41.74])rotate([0,90,0])cylinder(r=3.9/2,h=24,$fn=300);
translate([-35+4-6,3.0,133.95-7.4+7.4])rotate([0,90,0])cylinder(r=3.95/2,h=86,$fn=300);

translate([-35+4-6,3.0,133.95-7.4-41.74-6.3])rotate([0,90,0])cylinder(r=3.95/2,h=74,$fn=300);


// magnets
translate([-38.75,0,81.2])translate([12.45,5.06-5.6,60.95])rotate([90,0,0])cylinder(r=8.1/2,h=2.7+1,$fn=300);
#translate([-38.75,0,81.2-34.7])translate([12.45,5.06-5.6,60.95])rotate([90,0,0])cylinder(r=6.5/2,h=2.7+1,$fn=300);
#translate([-38.75,0,81.2-34.7])translate([12.45,5.06-5.6,60.95+23])rotate([90,0,0])cylinder(r=8.1/2,h=2.7+1,$fn=300);

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
}
