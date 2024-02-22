//translate([-38,-71,220-162])rotate([0,0,0])import("../Misc/mgn12-cut-guide.stl");
//cube([12,8.5,23]);

//import("../Toolhead/toolhead_top_1_fix.stl");

MGN12_Linear_Guide_3mmlonger();


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
translate([150-80-399,-31.5-2,283.5-170])cube([400,12,30]);
translate([150-80-399+433+3,-31.5-2,283.5-170])cube([50,12,30]);
translate([-1.5+75,-27.5,100])color("pink")cylinder(r=3.7/2,h=100,$fn=300);
translate([-1.5+75+28,-27.5,100])color("pink")cylinder(r=2.9/2,h=100,$fn=300);
}
}
}


