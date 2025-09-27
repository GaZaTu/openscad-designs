include <../BOSL2/std.scad>
include <../BOSL2/screws.scad>

$fn=16;

// move([106, -30, -21.6])
// import("lib/sd-bp-clip.stl");

module steamdeck_backpack_clip_terminal()
  diff("steamdeck_backpack_clip_terminal_remove", "_")
  cuboid([4, 85.5, 7]) {
    tag("steamdeck_backpack_clip_terminal_remove")
    attach(RIGHT, BOT, align=BACK+BOT, inside=true)
      move([2, 3, 0])
      screw_hole("m3,4", thread=true);

    tag("steamdeck_backpack_clip_terminal_remove")
    attach(RIGHT, BOT, align=BACK+BOT, inside=true)
      move([14, 3, 0])
      screw_hole("m3,4", thread=true);

    tag("steamdeck_backpack_clip_terminal_remove")
    attach(RIGHT, BOT, align=FRONT+BOT, inside=true)
      move([-2, 3, 0])
      screw_hole("m3,4", thread=true);

    // tag("steamdeck_backpack_clip_terminal_remove")
    // attach(RIGHT, BOT, align=FRONT+BOT, inside=true)
    //   move([-14, 3, 0])
    //   screw_hole("m3,4", thread=true);
  }

diff()
cuboid([20, 96, 2]) {
  // attach(BOT, BOT, align=CENTER, inside=true)
  //   move([0, 0, 2])
  //   cuboid([14, 94, 12]);

  tag("keep")
  attach(TOP, BOT, align=RIGHT+CENTER)
    steamdeck_backpack_clip_terminal();
}
