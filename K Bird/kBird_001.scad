
color ("CornflowerBlue") {
    // head
    hull () {
        sphere (45);
        translate([0,0,140]) sphere (45);
    };
    // body
    translate([0,20,0])
     hull () {
        sphere (64);
        translate([0,100,0]) sphere (64);
    };
    // leg front
    translate ([20,30,0])
    hull () {
        sphere (10);
        translate([0,0,-90]) sphere (10);
    };
    // leg back
    translate ([-20,90,0])
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
    translate([20,-10,-91])
    hull(){
        sphere(10);
        translate ([0,65,0]) sphere(10);
    };
    // paw r 
    translate([-20,40,-91])
    hull(){
        sphere(10);
        translate ([0,65,0]) sphere(10);
    };
};