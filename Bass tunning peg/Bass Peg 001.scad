$fn = 50;
color ("darkgray") {

// BODY
    
rotate_extrude () {
    union() {
        difference () {
            translate([0,55,0 ]) circle(r=4);
            translate([-10,50,0]) square(10); 
        };
        
        difference () {
            square([4,55]);
            translate([10,37]) circle(6.7);
        };
    }; 
};

};


// HEAD

    rotate([90,0,0]) difference () {
            union (){
                linear_extrude(30){
                    translate ([0,0,77]) rotate([90,0,0 ]) circle(r=10);
                }
                linear_extrude(30){
                    translate ([10,0,71]) rotate([90,0,0 ]) circle(r=10);
                }
                linear_extrude(30){
                    translate ([-10,0,71]) rotate([90,0,0 ]) circle(r=10);
                }
                    
                    translate ([-15,0,45]) rotate([90,0,0 ]) square([30,30]);
                    translate ([4,0,44]) rotate([90,0,0 ]) circle(r=2);
                    translate ([-4,0,44]) rotate([90,0,0 ]) circle(r=2);
                    translate ([-6,0,44]) rotate([90,0,0 ]) square([12,12]);
                    translate ([-4,0,42]) rotate([90,0,0 ]) square([8,8]);
                };
            
linear_extrude(30){
        translate ([27,0,45]) rotate([90,0,0 ]) circle(r=21.1);
        translate ([-27,0,45]) rotate([90,0,0 ]) circle(r=21.1);
};
};
    
//Boundaries
/*
%translate([-20,-20,0]) cube([40,40,87]);