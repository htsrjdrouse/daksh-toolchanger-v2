
lockbodybottom();
//lockbodytop();


module lockbodytop(){
difference(){
union(){
import("lock-body-top.stl");
translate([-21.6,-40.35,0+89.4])color("pink")cube([46,3,13.4]);
translate([-21.6,-40.35,34.4+26.4])color("pink")cube([46,3,13.4-5.8]);
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

#translate([-21.6-0+8.22,-40.35+30-13.5,9.15+28])rotate([90,90,0])#cylinder(r=6.4/2,h=0.3+6.3,$fn=6);
#translate([-21.6-0+8.22+32.6,-40.35+30-13.5,9.15+28])rotate([90,90,0])#cylinder(r=6.4/2,h=0.3+6.3,$fn=6);

#translate([-21.6-0+8.22+32.6,-40.35+30-13.5,8.10])rotate([90,90,0])#cylinder(r=6.5/2,h=0.3+6.3,$fn=306);
#translate([-21.6-0+8.22+0.6,-40.35+30-13.5,8.10])rotate([90,90,0])#cylinder(r=6.5/2,h=0.3+6.3,$fn=306);


}



}
}




module lockbodybottom(){
difference(){
union(){
import("lock-body-bottom.stl");
translate([-21.6,-40.35,0])color("pink")cube([46,3,13.4]);
translate([-21.6,-40.35,34.4])color("pink")cube([46,3,13.4-8.3]);
}
translate([-21.6-0+23,-40.35+30,9.15])rotate([90,0,0])#cylinder(r=3.3/2,h=100,$fn=300);
translate([-21.6-0+23-0.1,-40.35+30-13.5,9.25])rotate([90,90,0])cylinder(r=6.4/2,h=0.3+6.3,$fn=6);


translate([-21.6-0+23+14.25,-40.35+30-13.5,9.15+28])rotate([90,90,0])#cylinder(r=6.5/2,h=0.3+6.3,$fn=300);
translate([-21.6-0+23-14.6,-40.35+30-13.5,9.15+28])rotate([90,90,0])#cylinder(r=6.5/2,h=0.3+6.3,$fn=300);


translate([-21.6-0+23-14.75,-40.35+30,34.4+2.7])rotate([90,0,0])cylinder(r=3.3/2,h=100,$fn=300);
translate([-21.6-0+23+14.25,-40.35+30,34.4+2.7])rotate([90,0,0])cylinder(r=3.3/2,h=100,$fn=300);
}
}
