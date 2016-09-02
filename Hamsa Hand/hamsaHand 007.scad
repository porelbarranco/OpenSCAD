$fn = 50;
thickness = 2;

for (a=[0:72:360]) {
    rotate ([0,a,0])
    linear_extrude (height=thickness,center=true) {
        shell(thickness) {   
            union () {
                difference () {
                    hand ();
                };
            };
        };
    };
};

linear_extrude (height=thickness,center=true) {
    
    shell(thickness){
        difference () {
                intersection () {
                    translate([0,60,0]) circle (r=60);
                    circle (r=60);
                };
            translate ([0,30,0]) circle (r=34);
            };
    };
    
    shell(thickness) {
        translate ([0,30,0]) 
        circle (r=20);
    };
    
    translate ([0,30,0])
    square([1.1,59],center=true);
    
    for (b=[0:15:360]) {
        translate ([0,30,0])
        rotate ([0,0,b])
        square ([1.1,40],center=true);
    };

    translate ([0,30,0]) 
    circle (r=13);
    
    
    shell(thickness){
        circle (r=60);
    };
    

    
    
    shell(thickness){
        intersection () {
            translate([0,60,0]) circle (r=60);
            circle (r=60);
        };
    };
};



//translate([0,140,0]) rotate([90,0,0]) cylinder (r=1,h=200,$fn=50);


module shell(thickness) { 
   difference(){ 
     children(0); 
     offset(-thickness) child(0); 
   } 
} 

module hand () {
    union () {
        circle( r=60 );
        
        difference () {
            translate([-50,10,0]) circle( r=40 );
            translate([-100,0,0]) circle( r=40 );
            translate([-90,-80]) square(80);
        };
        
        difference () {
            translate([50,10,0]) circle( r=40 );
            translate([100,0,0]) circle( r=40 );
            translate([10,-80]) square(80);
        };
        
        hull () {
            translate([ 0,120,0])  circle( r=20 );
            translate([ 0,60,0])  circle( r=20 );
        };
        
        translate([35,-20,0])
        hull () {
            translate([ 0,120,0])  circle( r=20 );
            translate([ 0,60,0])  circle( r=20 );
        };
        
        translate([-35,-20,0])
        hull () {
            translate([ 0,120,0])  circle( r=20 );
            translate([ 0,60,0])  circle( r=20 );
        };
    };
};