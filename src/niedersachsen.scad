include <../BOSL2/std.scad>

$fn=32;

module ni_wappen_part(part)
  scale([0.4, 0.4, 1])
    import(str("./lib/ni_wappen/ni_wappen_", part, ".stl"));

module ni_wappen_plate()
  color("red")
  union() {
    ni_wappen_part("plate");

    resize([0, 0, 1])
    ni_wappen_part("border");
  }

module ni_wappen_border()
  color("black")
  move([0, 0, 3])
  resize([0, 0, 0.16])
  ni_wappen_part("border");

module ni_wappen_horse()
  color("white")
  move([0, 0, 1])
  union() {
    move([0, 0, 0])
    ni_wappen_part("horse_l1");

    move([0, 0, 1])
    ni_wappen_part("horse_l2");

    move([0, 0, 0])
    ni_wappen_part("border");
  }

ni_wappen_plate();

ni_wappen_border();

ni_wappen_horse();
