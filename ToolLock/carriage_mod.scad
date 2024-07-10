//import("carriage_mod.stl");


carriage_mod();

#translate([22.1,-56.5,23.5])rotate([90,0,0])color("silver")cylinder(r=4.3/2,h=3.5,$fn=300);
#translate([-16.4,-56.5,23.5])rotate([90,0,0])color("silver")cylinder(r=4.3/2,h=3.5,$fn=300);

translate([0,0,56]){
#translate([22.1,-56.5,23.5])rotate([90,0,0])color("silver")cylinder(r=4.3/2,h=3.5,$fn=300);
#translate([-17.5,-56.5,23.5])rotate([90,0,0])color("silver")cylinder(r=4.3/2,h=3.5,$fn=300);
}


module carriage_mod(){
difference(){

union(){
import("carriage-mgn12-integrated--belt-groove.stl");

translate([15-0.55,-40+0.5,50+12])rotate([90,0,0])squarenut_bottom();
translate([15-0.55-32,-40+0.5,50+12])rotate([90,0,0])squarenut_bottom();
translate([15-0.55-30.55,-40+0.5-4.45,50+12-24-3.7])rotate([90,0,0])squarenut_top();
translate([15-0.55-30.55+29,-40+0.5-4.45,50+12-24-3.7])rotate([90,0,0])squarenut_top();
}


#translate([15-0.56,-40+0.5,75+16.18])rotate([90,0,0])translate([5.6/2,5.6/2,-3])cylinder(r=3.4/2,h=11,$fn=300);
#translate([15-0.56-32-0.67,-40+0.5,75+16.18])rotate([90,0,0])translate([5.6/2,5.6/2,-3])cylinder(r=3.4/2,h=11,$fn=300);
//translate([15-0.55-32-0.67,-40+0.5,50+12])rotate([90,0,0])translate([5.6/2,5.6/2,-3])cylinder(r=3.3/2,h=11,$fn=300);


translate([-0.2,0,-55.65]){
translate([15-0.55-((32-0.67)/2),-40+0.5,50+12])rotate([90,0,0])#translate([5.6/2,5.6/2,-3])cylinder(r=3.3/2,h=11,$fn=300);
}
/*
*/

}



}


module squarenut_bottom(){
difference(){
color("pink")translate([0-0.2,0-2+0.8,-2])cube([5.6+0.4,5.6+2-0.1,6.4]);
#translate([5.6/2,5.6/2,-3])cylinder(r=2.9/2,h=11,$fn=300);
}
}


module squarenut_top(){
difference(){
color("pink")translate([0-1,0.3,0-6.485])cube([6.8,4.89,7.4]);
#translate([5.6/2,5.6/2,-3-10])cylinder(r=2.9/2,h=50,$fn=300);
}
}


