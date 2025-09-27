include <../../BOSL2/std.scad>

module pflege_logo()
  tag_scope("pflege_logo")
  cuboid([120, 52, 2], chamfer=1.8, edges=[BOT]) {
    attach(TOP, BOT, align=LEFT)
    diff()
    color("green")
    move([1, 0, 0])
    cylinder(h=1.4, r=25) {
      attach(TOP, BOT, align=LEFT)
      tag("remove")
      color("white")
      resize([45.5, 0, 0])
      move([-4.6, -11, -1.4])
      linear_extrude(1.5)
      text("Pflege", 11.2, "Noto Sans:style=Bold");
    }

    color("black")
    attach(TOP, BOT, align=LEFT)
      color("white")
      resize([65.5, 0, 0])
      move([62.5, -11.6, 0])
      linear_extrude(1.4)
      text("Stützpunkt", 12.4, "Noto Sans");
  }

module pflege_logo_face(cube_face)
  attach(cube_face, BACK, align=CENTER, shiftout=-1)
  move([0, 26, 0])
  xrot(90)
  pflege_logo();

module pflege_cube(partial)
  diff()
  cuboid([140, 64, 80], chamfer=6, edges=[BOT, LEFT+FRONT, RIGHT+FRONT, LEFT+BACK, RIGHT+BACK]) {
    tag(partial ? "remove" : "")
    pflege_logo_face(FRONT);
    tag(partial ? "remove" : "")
    pflege_logo_face(BACK);

    attach(BOT, BOT, align=CENTER, inside=true)
    tag("keep")
    diff("fdm")
    cuboid([4, 56, 68], chamfer=4, edges=[BOT+FRONT, BOT+BACK]);

    tag("remove")
    attach(TOP, TOP, align=CENTER, inside=true, shiftout=24)
    cuboid([132, 56, 100], chamfer=4);

    tag("remove")
    attach(TOP, TOP, align=CENTER, inside=true, shiftout=24)
    xrot(-10)
    cuboid([142, 76, 30]);
  }
