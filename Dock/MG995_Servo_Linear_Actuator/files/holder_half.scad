function rel_to_abs(list, i = 0, sum = [0,0], result = []) = 
    i == len(list) ? result : rel_to_abs(list, i + 1, sum + list[i], concat(result, [sum + list[i]]));

module doubleHoles() {
cylinder(h = 20, r = 2.7/2, $fn=20);
translate([7,0,0]) cylinder(h = 20, r = 2.7/2, $fn=20);
}

module wideDoubleHoles() {
  cylinder(h = 20, r = 2.7/2, $fn=20);
  translate([10,0,0]) cylinder(h = 20, r = 2.7/2, $fn=20);
}

module servoLip() {
  difference() {
    linear_extrude(14.5) polygon(rel_to_abs([[0,0],[20,0], [0, 7], [-20,0]]));
    translate([5, 3.5, 0]) wideDoubleHoles();
  }
}



difference() {
  union() {    
    linear_extrude(20) polygon(rel_to_abs([[0,0],[54,0],[0,7.5],[-13,0],[0,20],[8,0],[0,7.5],[-12,0],[0,-27.5],[-20,0],[0,27.5],[-12,0],[0,-7.5],[8,0],[0,-20],[-13,0]]));

    translate([17,7,0]) servoLip();
  }

  translate([3.5, 3.75, 0]) doubleHoles();
  translate([43.5, 3.75, 0]) doubleHoles();
  translate([9, 40, 15]) rotate([90,90,0]) wideDoubleHoles();
  translate([45, 40, 15]) rotate([90,90,0]) wideDoubleHoles();
}

