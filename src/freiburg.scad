include <../BOSL2/std.scad>

$fn=32;

module wappen_part(part)
  scale([0.4, 0.4, 1])
    import(str("./lib/freiburg/", part, ".stl"));

module wappen_plate()
  color("white")
  union() {
    wappen_part("plate");

    wappen_part("border");
  }

module wappen_cross()
  color("red")
  move([0, 0, 1])
  union() {
    wappen_part("cross");

    wappen_part("cross_border");

    wappen_part("border");
  }

module wappen_border()
  color("black")
  move([0, 0, 2])
  resize([0, 0, 0.16])
  union() {
    wappen_part("border");

    wappen_part("cross_border");
  }

wappen_plate();

wappen_cross();

wappen_border();
