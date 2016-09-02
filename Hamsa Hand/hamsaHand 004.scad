
for (a=[0:90:360]) {
    rotate ([0,0,a])
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