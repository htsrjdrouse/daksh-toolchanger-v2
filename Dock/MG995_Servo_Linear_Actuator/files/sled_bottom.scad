function rel_to_abs(list, i = 0, sum = [0,0], result = []) = 
    i == len(list) ? result : rel_to_abs(list, i + 1, sum + list[i], concat(result, [sum + list[i]]));
    

module doubleHoles() {
cylinder(h = 20, r = 1.75, $fn=20);
translate([7,0,0]) cylinder(h = 20, r = 1.75, $fn=20);
}

module doubleHoles6mm() {
cylinder(h = 5, r = 3, $fn=20);
translate([7,0,0]) cylinder(h = 5, r = 3, $fn=20);
}

difference() {
  linear_extrude(7.5) polygon(rel_to_abs([[0,0],[70.5,0],[0,17],[-70.5,0]]));

  rotate([0,0,90]) translate([3.5, -3.75, -1]) doubleHoles();
  rotate([0,0,90]) translate([3.5, -66.75, -1]) doubleHoles();
    
  rotate([0,0,90]) translate([3.5, -3.75, -1]) doubleHoles6mm();
  rotate([0,0,90]) translate([3.5, -66.75, -1]) doubleHoles6mm();
    
  linear_extrude(2) polygon(rel_to_abs([[0,0],[70.5,0],[0,12.5],[-70.5,0]]));

}

//#translate([50.5,-20,2]) limit_switch_protrusion();
translate([0,-7.5,-6.8]) back();

module limit_switch_protrusion() {
    difference() {
        cube(size = [20,20,5.5]);
        translate([3.5,5.5,0]) cylinder(h = 20, r = 2.1/2, $fn=20);
        translate([3.5,15,0]) cylinder(h = 20, r = 2.1/2, $fn=20);

    }
}

module back() {
    difference() {
        cube(size = [45,7.5,14.3]);
        translate([3.75,3.75,0]) cylinder(h = 20, r = 2.7/2, $fn=20);
        translate([41.25,3.75,0]) cylinder(h = 20, r = 2.7/2, $fn=20);

    }
}
