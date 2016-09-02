$fn=50;

/// HEAD
translate([0,0,height])
icosahedron(55);

module icosahedron(x){
	phi = (1+ sqrt(5))/2;
	scale(x/3)
	translate([0, 0, cos(atan((phi - 1) / phi)) * phi])
	rotate([0, 0, 0])
	difference() {
		intersection_for(a = [0:4])
			rotate([0, 31.75, 72 * a])
		intersection_for(r = [[0,0,0],[90,90,0],[90,0,90]])
			rotate(r)
			linear_extrude(height = 10, center = true)
			polygon(points=[[phi,1],[phi,-1],[0,-phi],[-phi,-1],[-phi,1],[0,phi]], paths=[[0,1,2,3,4,5]]);
				}
};


// BODY

height = 100;

cylinder(r=4.8, h= height, $fn=15);

sphere(r=2);

for( t = [1 : 4 : height]){
    translate([0,0,t])
rotate_extrude(convexity = 10, $fn = 100)
translate([4, 0, 0])
circle(r = 2, $fn = 100);
};

cylinder(r=20, h=5, $fn=6);


/// LEGS
rotate(45,0,0)
cylinder(r=5,h=100);