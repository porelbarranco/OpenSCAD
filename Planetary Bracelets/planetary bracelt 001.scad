$fn=50;

thickness = .55;
radius = 32;
cut = 10;
theta = 45;
orbit =10 ;
h = sqrt ((radius*radius)-(orbit*orbit));

color ("darkgoldenrod")  scale ([1,1,1]) union(){
    // bracelet
    difference () {
        
        hula (thickness,radius);
        
        linear_extrude(4*thickness,center=true) scale(1.3) 
        polygon ([[0,0],[radius,0],[radius*cos(theta),radius*sin(theta)] ]);
        translate ([(radius-.6*thickness)*cos(theta+1),(radius-.6*thickness)*sin(theta+1),-.5*thickness]) rotate([90,0,theta+1]) linear_extrude (2*thickness) text ("H",size=thickness);
    };

    translate (radius*[cos(theta),sin(theta),0]) sphere(thickness);

    // orbit
    translate ([h,0,0 ]) rotate ([0,90,0]) scale ([1,1,1]) hula (thickness,orbit);

    // nucleus
    translate ([radius,0,0 ]) sphere (6*thickness);

    // electron
    rotate ([0,0,0])translate ([h,orbit,0 ]) sphere (2*thickness);
    
    rotate ([0,0,0]) translate ([h,orbit,0 ]) rotate ([0,90,0]) hula (thickness,6*thickness);

    
};


module hula (thickness,radius) {
    rotate_extrude()
        translate ([radius,0,0])
            circle (thickness);
            };