layer_height = 1.5; //layer height in mm
bottom_layers = 1;
closed_layers_b = 1;
open_layers= 2;
closed_layers_t = 2;
switchplate_layers = 1;
top_layers = 1;
if(bottom_layers > 0) {
    for(i = [0:bottom_layers-1]){
    translate([0,0,layer_height*i]) color("red") linear_extrude(layer_height) import("Bottom.dxf");
    }
}
if(closed_layers_b > 0) {
    for(i = [0:closed_layers_b-1]){
    translate([0,0,layer_height*(i+bottom_layers)]) color("green") linear_extrude(layer_height) import("ClosedLayer.dxf");
    }
}
if(open_layers > 0) {
for(i = [0:open_layers-1]){
    
        translate([0,0,layer_height*(i+bottom_layers+closed_layers_b)]) 
            color("blue") linear_extrude(layer_height) import("OpenLayer.dxf");
}
}

if(closed_layers_t > 0) {
for(i = [0:closed_layers_t-1]){
    translate([0,0,layer_height*(i+bottom_layers+closed_layers_b + open_layers)]) color("green")linear_extrude(layer_height) import("ClosedLayer.dxf");
}
}

if(switchplate_layers > 0){
for(i= [0:switchplate_layers-1]){
translate([0,0,layer_height*(bottom_layers+closed_layers_b+open_layers+closed_layers_t)]) color("orange") linear_extrude(layer_height) import("Switchplate.dxf");
}
}

if(top_layers > 0) {
for(i= [0:top_layers-1]){
translate([0,0,layer_height*(bottom_layers+closed_layers_b+open_layers+closed_layers_t+switchplate_layers)]) linear_extrude(layer_height) import("Top.dxf");
}
}

//translate([-35,216.3,15]) color("red") import("q6-base.stl");

