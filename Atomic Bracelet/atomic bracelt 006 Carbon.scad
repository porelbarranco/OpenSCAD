$fn=100;

thickness = .55;
radius = 32;
cut = 10;
theta = 45;
orbit = 6;
orbit2 = 12;
h = sqrt ((radius*radius)-(orbit*orbit));
h2 = sqrt ((radius*radius)-(orbit2*orbit2));


color ("darkgoldenrod")  scale ([1,1,1]) union(){
    // bracelet
    difference () {
        
        hula (thickness,radius);
        
        linear_extrude(4*thickness,center=true) scale(1.3) 
        polygon ([[0,0],[radius,0],[radius*cos(theta),radius*sin(theta)] ]);
        translate ([(radius-.6*thickness)*cos(theta+1),(radius-.6*thickness)*sin(theta+1),-.5*thickness]) rotate([90,0,theta+1]) linear_extrude (2*thickness) text ("C",size=thickness);
    };

    //translate (radius*[cos(theta),sin(theta),0]) sphere(thickness);
    
    // nucleus
    translate ([radius,0,0 ]) scale(1.4) nucleus();
    
    // orbit
    translate ([h,0,0 ]) rotate ([0,90,0]) hula (thickness,orbit);

    // electrons orbit 1
    rotate ([45,0,0]) translate ([h,orbit,0 ]) sphere (2*thickness);
    rotate ([-135,0,0]) translate ([h,orbit,0 ]) sphere (2*thickness);

    // orbit 2
    translate ([h2,0,0 ]) rotate ([0,90,0]) hula (thickness,orbit2);

    // electrons in orbit 2
    rotate ([0,0,0]) translate ([h2,orbit2,0 ]) sphere (2*thickness);
    rotate ([-45,0,0]) translate ([h2,orbit2,0 ]) sphere (2*thickness);
    rotate ([180,0,0]) translate ([h2,orbit2,0 ]) sphere (2*thickness);
    rotate ([135,0,0]) translate ([h2,orbit2,0 ]) sphere (2*thickness);
};


module nucleus () {
    s = 72;
    
    translate ([0,0,2*thickness]) sphere(2*thickness);
    translate ([0,0,-2*thickness]) sphere(2*thickness);
    
    translate ([0,0,thickness]) union () {
        translate ([cos(0*s),sin(0*s),0]) sphere(2*thickness);
        translate ([cos(s),sin(s),0]) sphere(2*thickness);
        translate ([cos(2*s),sin(2*s),0]) sphere(2*thickness);
        translate ([cos(3*s),sin(3*s),0]) sphere(2*thickness);
        translate ([cos(4*s),sin(4*s),0]) sphere(2*thickness);
    };
    
    translate ([0,0,-thickness]) rotate(180,0,0) union () {
        translate ([cos(0*s),sin(0*s),0]) sphere(2*thickness);
        translate ([cos(s),sin(s),0]) sphere(2*thickness);
        translate ([cos(2*s),sin(2*s),0]) sphere(2*thickness);
        translate ([cos(3*s),sin(3*s),0]) sphere(2*thickness);
        translate ([cos(4*s),sin(4*s),0]) sphere(2*thickness);
    };
};




module hula (thickness,radius) {
    rotate_extrude()
        translate ([radius,0,0])
            circle (thickness);
            };