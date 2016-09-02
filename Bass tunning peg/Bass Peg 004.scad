$fn = 50;
union () {
translate ([0,0,-5])

scale(.5)
union () {
    // BODY
        
    rotate_extrude () {
        union() {
            difference () {
                translate([0,55,0 ]) circle(r=4);
                translate([-10,50,0]) square(10); 
            };
            
            difference () {
                translate([0,25]) square([4,30]);
                translate([10,37]) circle(6.7);
            };
        }; 
    };
    
    // HEAD 
    rotate([90,0,0])
    linear_extrude (2,center=true) {
        union () {
            difference () {
                union () {
                        translate ([0,77,0]) circle(r=10);
                        translate ([10,71,0]) circle(r=10);
                        translate ([-10,71,0]) circle(r=10);
                        translate ([-15,45,0]) square([30,30]);
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

};

// NEDDLE
union(){
    translate ([0,0,2 ])cylinder (r=.55 ,h=20);
    cylinder (r1=0,r2=.55 ,h=2);
};
};