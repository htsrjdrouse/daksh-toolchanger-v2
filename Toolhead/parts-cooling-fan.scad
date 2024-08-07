//import("parts-cooling-fan-4020.stl");

//partscooling_base();

translate([-37.3,3.666,0])color("pink")partscooling_top();
translate([0,0,3+4.3])import("parts-cooling-fan-base.stl");
module partscooling_top(){

difference(){
union(){
translate([0-0.5,-40-0.5,44.95+5])cube([16.201+1,17.3+0.6,10-5+1.5]);
translate([0-1.398,-40-1.39999,44.95+5-2.952+3])cube([16.201+2.5959,17.3+9.431+1.4+1.5,10-5-3]);
//translate([0-1.398,-40-1.39999,44.95+5-2.952-1.7])cube([16.201+2.5959,17.3+9.431+1.4+1.89,10-5]);
}
translate([1,-40+1,44.95+5-10])cube([16.201-2,17.3+8.1,10-5+20]);
}
}


module partscooling_base(){


difference(){
import("parts-cooling-fan-4020.stl");
#translate([-37.3-1,3.666-1.164-1,-3+5.5-5])color("lime")translate([0-1.398,-40-1.39999,44.95+5-2.952-1.7])cube([16.201+2.5959+2.5,17.3+9.431+1.4+1.89+3.164,9.65+10]);
}

}


