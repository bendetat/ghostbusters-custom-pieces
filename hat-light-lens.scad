$fn = 100;

main_diam = 12.0;
skirt = 2.0;
rise = 1.0;
led_cavity_diam = 6.0;
led_cavity_height = 6.0;

hat_light_lens();

module hat_light_lens() {
    difference() {
        union() {
            // main cylinder
            cylinder(d = main_diam, h = main_diam*0.8);
            
            // skirt
            difference() {
                cylinder(d = main_diam + skirt*2, h = skirt + rise);
                translate([0, 0, skirt + rise])
                rotate_extrude(convexity=10)
                translate([(main_diam + skirt*2)/2, 0, 0])
                circle(d = skirt*2);
            }
        }
        
        // cavity for LED
        translate([0, 0, -0.001])
        cylinder(d = led_cavity_diam, h = led_cavity_height + 0.001);
    }
}