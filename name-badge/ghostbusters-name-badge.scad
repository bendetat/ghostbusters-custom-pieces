color("black")
cube([120, 50, 4]);

color("red")
translate([10,6.5,0.01])
linear_extrude(height=5)
resize([93,36,0])
text(
    text="rookie",
    font="Ghostbusters Nametag"
);