$fn=100;

thickness = .85;
radius = 32;
theta = 72;
orbit =10 ;
h = sqrt ((radius*radius)-(orbit*orbit));
gapWidth = theta - asin(orbit/radius);
gapLength = gapWidth*0.0174533 * radius;
      
echo( gapWidth = gapWidth );
echo( gapLength = gapLength );
    


color ("darkgoldenrod")  scale ([1,1,1]) union(){
    // bracelet
    difference () {
        
        hula (thickness,radius);
        
        // Gap
        linear_extrude(4*thickness,center=true) scale(1.3) 
        polygon ([[0,0],[1.5*radius,0],[1.5*radius*cos(theta),1.5*radius*sin(theta)] ]);

    };
    
    // Letter
    translate ([(radius-.6*thickness)*cos(theta+1),(radius-.46*thickness)*sin(theta+1),-.46*thickness]) rotate([90,0,theta+1]) linear_extrude (thickness) text ("H",size=thickness);
    
    //translate (radius*[cos(theta),sin(theta),0]) sphere(thickness);

    // nucleus
    translate ([radius,0,0 ]) sphere (3*thickness);

    // orbit
    translate ([h,0,0 ]) rotate ([0,90,0]) hula (thickness*.6,orbit);

    // electron
    rotate ([45,0,0]) translate ([h,orbit,0 ]) sphere (1.5*thickness);
};


module hula (thickness,radius) {
    rotate_extrude()
        translate ([radius,0,0])
            circle (thickness);
            };