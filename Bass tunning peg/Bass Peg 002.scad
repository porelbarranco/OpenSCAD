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
linear_extrude (3) {
    union () {
        difference () {
            union () {
                    translate ([0,77,0])  circle(r=10);
                    translate ([10,71,0])  circle(r=10);
                    translate ([-10,71,0])  circle(r=10);
                    translate ([-15,45,0])square([30,30]);
                    translate ([4,44,0]) circle(r=2);
                    translate ([-4,44,0]) circle(r=2);
                    translate ([-6,44,0]) square([12,12]);
                    translate ([-4,42,0]) square([8,8]);
                };
                
            union () {
                translate ([27,45,0]) circle(r=21.1);
                translate ([-27,45,0]) circle(r=21.1);
            };
        };
    };
};
//Boundaries
/*
%translate([-20,-20,0]) cube([40,40,87]);