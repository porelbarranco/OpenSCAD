intersection() {
for (a=[0:60:360]) {
    rotate([90,0,a]) cube([500,500,2],center=true);
    };
    
shell(3){
    rotate_extrude() {
        translate([0,0,0]) union () {
            difference () {
                hand ();
                translate([-500,0,0])square (1000,center=true);
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