scale (.2)
union( ) {    
    color ("CornflowerBlue") {
        // head
        hull () {
            sphere (46);
            translate([0,0,140]) sphere (46);
        };
        // body
        translate([0,79,50])
        
        
        minkowski () {
            union () {
                hull () { 
                    hull () {
                        translate ([0,-74,-30]) sphere(46);
                        translate ([0,-74,-62]) sphere(46);
                    };
                    difference () {
                        scale([.6,1,.9]) sphere (120);
                        translate ([-200,-200,0]) cube ([400,400,400]);
                    };
                };
            };
            sphere(5);
        };
        
        
        
        
        // leg front
        translate ([30,30,0])
        hull () {
            sphere (10);
            translate([0,0,-90]) sphere (10);
        };
        // leg back
        translate ([-30,90,0])
        hull () {
            sphere (10);
            translate([0,0,-90]) sphere (10);
        };
    };
    color ("white") {
        // eye l
        translate([32,4,140])
        sphere(25);
        // eye r
        translate([-32,4,140])
        sphere(25);
    };
    color ("sandybrown"){
        // peak
        translate([0,0,120])
        hull(){
            sphere(20);
            translate ([0,-65,0]) sphere(20);
        }; 
        // paw l 
        translate([30,-10,-91])
        hull(){
            sphere(10);
            translate ([0,65,0]) sphere(10);
        };
        // paw r 
        translate([-30,40,-91])
        hull(){
            sphere(10);
            translate ([0,65,0]) sphere(10);
        };
    };
};