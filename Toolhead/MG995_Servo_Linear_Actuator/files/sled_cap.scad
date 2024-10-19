translate([45,0,0]) #cube(size = [25.5,7.5,1.2]);

difference() {
    translate([0,0,-3]) cube(size = [70.5,10.5,3]);
    translate([3.75,3.75,-3]) cylinder(h = 20, r = 1.75, $fn=20);
    translate([41.25,3.75,-3]) cylinder(h = 20, r = 1.75, $fn=20);
}

difference() {
    cube(size = [45,7.5,0.2]);
    translate([3.75,3.75,0]) cylinder(h = 20, r = 1.75, $fn=20);
    translate([41.25,3.75,0]) cylinder(h = 20, r = 1.75, $fn=20);
}
