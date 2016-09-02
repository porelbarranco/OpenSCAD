
for (a=[0:60:360]) {
    rotate ([0,a,0])
    linear_extrude (height=3,center=true) {
        shell(3) {   
            union () {
                difference () {
                    hand ();
                };
            };
        };
    };
};

shell(3){
    translate ([0,30,0]) circle (r=30);
};

translate ([0,30,0]) circle (r=15);

shell(3){
    circle (r=60);
};

shell(3){
    intersection () {
        translate([0,60,0]) circle (r=60);
        circle (r=60);
    };
};

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