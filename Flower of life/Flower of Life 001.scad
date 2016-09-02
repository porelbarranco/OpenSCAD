$fn=50;


rotate([60,0,0]) plane(.55,9);
rotate([120,0,0]) plane(.55,9);

rotate([0,0,90])
union(){
rotate([60,0,0]) plane(.55,9);
rotate([120,0,0]) plane(.55,9);
}

module plane (thickness,radius) {
    
    for (b=[0:60:180])
        rotate([0,0,b])
        for (a=[-radius:radius:radius]) {
            translate([a,0,0])
            union(){
            rotate_extrude()
            translate ([radius,0,0])
            circle (thickness);
            };
            
        };
    
};