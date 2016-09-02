// mathgrrl trigonometric bracelet

///////////////////////////////////////////////////////////////////////
// resolution parameters

$fn = 12;	// larger means finer (and slower!) - don't change
step = .5; 	// smaller means finer, larger can be cool low-poly

///////////////////////////////////////////////////////////////////////
// size parameters

diameter = 60; 	// measure your wrist and hand to determine this
radius = diameter/2;
height = 14;	// length/tallness of the design
thickness = .6;	// width/heaviness of the design

///////////////////////////////////////////////////////////////////////
// design parameters

degrees = 10;	// 0 = straight, more = twisted
oval = 1; 	// 1 = circle, less = inside oval, more = outside oval
cut = 5; 	// 0 = closed circle, more = open gap
flare = 1;	// 1 = straight up, less = closes up, more = opens up

///////////////////////////////////////////////////////////////////////
// function parameters

amplitude = 8;	// low = smaller bumps, high = taller bumps
frequency = .34;	// low = fewer bumps, high = more bumps

// for simple sine curve choose s=1, c=0
s = 6;		// sine freq multiplier; use 1, 2, 3, 4, ... (not 0!)
c = 10;		// cosine freq multiplier; use 0, 1, 2, 3, 4, ...

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
// DO NOT CHANGE BELOW THIS LINE 
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
// define the wave function

function f(t) = 1+sin(s*frequency*t)*cos(c*frequency*t);

///////////////////////////////////////////////////////////////////////
// define the wrapped wave function

function g(t) =  
   [ oval*(radius+amplitude*f(t))*cos(t),
     (radius+amplitude*f(t))*sin(t),
     0
   ];

///////////////////////////////////////////////////////////////////////
// renders

// the bracelet
rotate(-90/frequency,[0,0,1])
mirror([0,0,1])
translate([0,0,-height])
linear_extrude(
	height=height, 
	twist=degrees, 
	slices=height/.4, 
	scale=flare)
function_trace(
	rad=thickness, 
	start=0+90/frequency+cut, 
	step=step, 
	end=360+90/frequency-cut);

rotate(-90/frequency,[0,0,1])
linear_extrude(
	height=height, 
	twist=degrees, 
	slices=height/.4, 
	scale=flare)
function_trace(
	rad=thickness, 
	start=0+90/frequency+cut, 
	step=step, 
	end=360+90/frequency-cut);
	
///////////////////////////////////////////////////////////////////////
// module for tracing out a function

module function_trace(rad, start, step, end) {
 for (t=[start: step: end-step]) {
  hull() {
   translate(g(t)) circle(rad);
   translate(g(t+step)) circle(rad);
       }
   }
};