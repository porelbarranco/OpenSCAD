// simple custom polybowl

radius =40;
sides = 10;
bodyHeight = 50;
baseHeight = 2;
rimHeight = 0;
bodyTwist = 10;
bodyFlare = .9;
thickness = 5;

////////////////////////////////////////////////////
/// RENDERS

// base
linear_extrude( height = baseHeight )
    polyShape( solid="yes" );
    
    
// body
translate([0,0,baseHeight])
linear_extrude( height=bodyHeight, twist=bodyTwist, scale = bodyFlare, slices = 2*bodyHeight )
    polyShape( solid="no");
    
    
// bodymirror
mirror([0,0,1])
translate([0,0,(-2*bodyHeight-baseHeight-rimHeight*bodyFlare)])
//rotate(2*(bodyTwist))
linear_extrude( height=bodyHeight, twist=bodyTwist, scale = bodyFlare, slices = 10*bodyHeight )
    polyShape( solid="no");
    
// rim 
translate([0,0,baseHeight+bodyHeight])
rotate(-bodyTwist)
scale(bodyFlare)
linear_extrude( height=rimHeight )
    polyShape( solid="no" );
    
    
////////////////////////////////////////////////////
// MODULES

module polyShape(solid){
    difference(){
        //start with outside shape
        offset( r=5, $fn=48 )
            circle( r=radius, $fn=sides );
        // take away inside shape
        if (solid == "no"){
            offset( r=5-thickness, $fn=48 )
                circle( r=radius, $fn=sides );
        }
    }
}