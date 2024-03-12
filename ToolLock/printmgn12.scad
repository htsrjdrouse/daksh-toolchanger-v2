

difference(){
cylinder(r=18/2,h=15,$fn=300);
translate([0,0,-1])cylinder(r=9.4/2,h=60,$fn=300);
}

//translate([-38,-71,220-162])rotate([0,0,0])import("../Misc/mgn12-cut-guide.stl");
//cube([12,8.5,23]);

//import("../Toolhead/toolhead_top_1_fix.stl");
//translate([-3,0,0])import("MGN12_Linear_Guide_8mmlonger_minus2.stl");

//translate([-3,10,0])import("MGN12_Linear_Guide_8mmlonger_minus3.stl");
//import("MGN12_Linear_Guide_8mmlonger.stl");
//mgn12_guides();

module mgn12_guides(){
difference(){
import("MGN12_Linear_Guide_8mmlonger_minus2.stl");
translate([-1.5+75+25+5-50,-27.5+3.7,132])color("pink")rotate([0,90,0])cylinder(r=2.0/2,h=100,$fn=300);
translate([-1.5+75+25+5-50,-27.5-3.7,132])color("pink")rotate([0,90,0])cylinder(r=2.0/2,h=100,$fn=300);
//translate([-1.5+75+25+5-50,-27.5+3.7,132])color("pink")rotate([0,90,0])cylinder(r=2.95/2,h=100,$fn=300);
//translate([-1.5+75+25+5-50,-27.5-3.7,132])color("pink")rotate([0,90,0])cylinder(r=2.95/2,h=100,$fn=300);
//translate([-1.5+75+25+5-50,-27.5-4+1,132+3.8])color("pink")rotate([0,90,0])cylinder(r=1.95/2,h=100,$fn=300);
//translate([-1.5+75+25+5-50,-27.5+4-1,132+3.8])color("pink")rotate([0,90,0])cylinder(r=1.95/2,h=100,$fn=300);
}
}
/*
*/

//MGN12_Linear_Guide_3mmlonger();
//translate([0,5,0])import("MGN12_Linear_Guide_3mmlonger.stl");


module MGN12_Linear_Guide_3mmlonger(){
translate([-0.15,0,0]){
//translate([-1.5-0,-27.5,100])color("pink")cylinder(r=3.7/2,h=100,$fn=300);
//translate([-1.5+75,-27.5,100])color("pink")cylinder(r=3.7/2,h=100,$fn=300);

difference(){
union(){
translate([150,-31.5,283.5])color("silver")import("MGN12_Linear_Guide.stl");
translate([-1.5+75,-27.5,134])color("pink")cylinder(r=6.2/2,h=3.5,$fn=300);
translate([-1.5+75+25,-27.5,134])color("pink")cylinder(r=6.2/2,h=3.5,$fn=300);
}
translate([150-80-399-2+1,-31.5-2,283.5-170])cube([400,12,30]);
translate([150-80-399+433+5,-31.5-2,283.5-170])cube([50,12,30]);
translate([-1.5+75-2+1,-27.5,100])color("pink")cylinder(r=3.7/2,h=100,$fn=300);
#translate([-1.5+75+25+5,-27.5,100])color("pink")cylinder(r=3.05/2,h=100,$fn=300);
}
}
}


