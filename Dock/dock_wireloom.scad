import("dock-wireloom-extrusion-holder.stl");

difference(){
translate([-23.25,-130+9,178])cube([8.6,10,15]);
translate([-23.25+5,-130+9+4,178])cylinder(r=2.3/2,h=100,$fn=300);
translate([-23.25+5+1,-130+9+4,178+10])rotate([0,-90,0])#cylinder(r=2.3/2,h=100,$fn=300);
}
