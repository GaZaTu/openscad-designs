include <../BOSL2/std.scad>
include <../BOSL2/screws.scad>
include <../BOSL2/walls.scad>

$fn = 32;

module jst2ph2p_socket()
  color("white")
  cube([7.5, 6, 7]);

module jst1sh4p_socket()
  color("white")
  cube([5, 6.6, 3.1]);

module sma_female()
  color("orange")
  cube([7, 7, 1.5])
    cylinder(h=2.5, d=6.7)
      attach(TOP, TOP, align=CENTER)
        screw("m7", l=5.5);

module sma_male()
  color("orange")
  diff("sma_male_remove")
  tag("")
  cylinder(h=8, d=8)
    tag("sma_male_remove")
      attach(TOP, TOP, align=CENTER, inside=true, shiftout=1)
        cylinder(h=8, d=7);

module sma_adapter_f2f()
  color("orange")
  diff("usb_c_remove")
  tag("")
  cylinder(h=5, d=6.7) {
    tag("")
      attach(TOP, BOT, align=CENTER)
        sma_male();
    tag("")
      attach(BOT, BOT, align=CENTER)
        sma_male();
  }

module usb_c()
  color("lightgray")
  cuboid([8.9, 3.3, 7.2], rounding=1);

module lipo_3V2Ah()
  color("silver")
  cuboid([54, 33.6, 10], rounding=5);

module lipo_3V2Ah_slot()
  diff("lipo_3V2Ah_slot_remove")
  tag("")
  cuboid([54-30, 34+2, 10], anchor=BOTTOM) {
    tag("lipo_3V2Ah_slot_remove")
      attach(TOP, TOP, inside=true, align=CENTER)
        lipo_3V2Ah();

    children();
  }

module lora_amp()
  cube([49, 26, 1]) {
    attach(TOP, TOP, align=CENTER)
      color("black")
        cube([19, 19.1, 4]);

    // attach(TOP, TOP, align=LEFT+FWD)
    //   move([7, 12, 0])
    //     color("gray")
    //       screw("m2", l=3);

    // attach(TOP, TOP, align=LEFT+FWD)
    //   move([41, 12, 0])
    //     color("gray")
    //       screw("m2", l=3);

    attach(BOT, TOP, align=LEFT+FWD)
      move([-46, 25, 6])
        xrot(-90) yrot(-90)
          jst2ph2p_socket();

    attach(TOP, TOP, align=LEFT+FWD)
      move([-1.5, 10, 1.8])
        xrot(-90) yrot(90)
          sma_female();

    attach(TOP, TOP, align=LEFT+FWD)
      move([50.5, 3, 1.8])
        xrot(-90) yrot(-90)
          sma_female();

    // attach(TOP, TOP, align=LEFT+FWD, inside=true)
    //   move([-2, 12, -0.1])
    //     cube([2, 4, 2]);

    // attach(TOP, TOP, align=LEFT+FWD, inside=true)
    //   move([-45, 12, -0.1])
    //     cube([2, 4, 2]);
  }

module lilygo_t3s3()
  cube([64, 27, 1]) {
    attach(TOP, TOP, align=CENTER)
      move([5.5, -1, 0])
        color("darkviolet")
          cube([25, 17.5, 5]);

    attach(TOP, TOP, align=LEFT+FWD)
      move([-4, 16, 0])
        xrot(90) yrot(90)
        usb_c();

    attach(BOT, TOP, align=LEFT+FWD)
      move([4, 0.5, 0])
        jst1sh4p_socket();

    attach(BOT, TOP, align=LEFT+FWD)
      move([4, 7.5, 0])
        jst1sh4p_socket();

    attach(BOT, TOP, align=LEFT+FWD)
      move([0, 0, 3])
        color("black")
        cube([11, 20, 7.4]);

    attach(BOT, TOP, align=LEFT+FWD)
      move([-18, 1, 3])
        xrot(90) yrot(180)
        sma_female();

    attach(BOT, TOP, align=LEFT+FWD)
      move([-7, 26, -0.4])
        color("black")
        cube([7.4, 4, 4]);

    attach(BOT, TOP, align=LEFT+FWD)
      move([-20, 26, -0.4])
        color("black")
        cube([5, 4, 2.4]);

    attach(TOP, TOP, align=LEFT+FWD)
      move([14.5, 16, 0])
        color("black")
        cylinder(h=6, r=3);
  }

// cuboid([44, 36, 1], anchor=BOTTOM) {
//   // attach(TOP, RIGHT, align=BACK, inset=1)
//   //   xrot(-90)
//   //   sparse_wall(h=10, l=74, thick=1, strut=1.5);
//   attach(TOP, TOP, align=CENTER)
//     lipo_3V2Ah_slot();
// }

// diff()
//   cuboid([74, 36, 10], anchor=BOTTOM) {
//     attach(TOP, TOP, inside=true, align=CENTER, shiftout=6)
//       cube([74-4, 36-4, 15]) {
//         attach(BOT, BOT, align=RIGHT+FWD)
//           move([1.55, 0, -3.2])
//             lora_amp();
//       }
//     attach(TOP, TOP, inside=true, align=CENTER)
//       move([0, 17, -6])
//       cube([74-4, 4, 15]);
//   }

module lora_box()
  diff()
  hex_panel([107, 72.5, 1], strut=12, spacing=16, frame=4, anchor=BOTTOM) {
    attach(TOP, TOP, align=FWD+RIGHT)
      cube([1, 72.5, 17])
        attach(BOT, TOP, align=FRONT+RIGHT)
          move([0, 0, -2])
          zrot(90)
          wedge([72.5, 2, 2]);
    attach(TOP, TOP, align=FWD+LEFT)
      cube([1, 72.5, 17])
        attach(BOT, TOP, align=FRONT+LEFT)
          move([0, 0, -2])
          zrot(-90)
          wedge([72.5, 2, 2]);
    attach(TOP, RIGHT, align=FWD+LEFT)
      cube([17, 32, 1]);
    attach(TOP, RIGHT, align=FWD+LEFT, inset=1)
      move([30, 0, 0])
      xrot(90)
      sparse_wall(h=17, l=76, thick=1, strut=2)
        attach(TOP, TOP, align=FRONT+RIGHT)
          move([0, 0, -2])
          zrot(-90)
          wedge([107, 2, 2]);
    attach(TOP, RIGHT, align=BACK+LEFT, inset=1)
      xrot(-90)
      sparse_wall(h=17, l=106, thick=1, strut=2)
        attach(BOT, TOP, align=FRONT+RIGHT)
          move([0, 0, -2])
          zrot(90)
          wedge([107, 2, 2]);

    diff("removexd")
    tag("")
    attach(TOP, TOP, align=CENTER)
      move([0, 0, 17])
      cuboid([107, 72.5, 1.1], anchor=BOTTOM)
        tag("removexd")
        attach(TOP, TOP, align=CENTER, inside=true)
          move([0, 0, -0.05])
          cuboid([105, 74.5, 1.2], chamfer=0.58, edges=[BOT]);

    // attach(TOP, TOP, align=FWD+LEFT)
    //   move([0, 0, 16])
    //     cube([4, 72.5, 1]);
    // attach(TOP, TOP, align=FWD+LEFT)
    //   move([0, 0, 18])
    //     cube([4, 72.5, 1]);

    // attach(TOP, TOP, align=FWD+RIGHT)
    //   move([0, 0, 16])
    //     cube([4, 72.5, 1]);
    // attach(TOP, TOP, align=FWD+RIGHT)
    //   move([0, 0, 18])
    //     cube([4, 72.5, 1]);

    attach(TOP, TOP, align=BACK+LEFT)
      move([2, -6, 0])
        cube([27, 4, 8]);

    attach(TOP, TOP, align=RIGHT+FWD)
      move([-16, 36.5, 0])
        lipo_3V2Ah_slot()
          attach(BOT, TOP, align=FRONT+RIGHT)
            move([0, 0, 0])
            cube([12, 5.4, 6.9]);

    tag("remove")
      # attach(TOP, TOP, align=RIGHT+FWD)
        move([-2.5, 10, 2.1])
          lora_amp();

    tag("remove")
      # attach(TOP, TOP, align=RIGHT+FWD)
        move([-78, 2, 11.5])
          xrot(180) zrot(90)
          lilygo_t3s3();
  }

lora_box();

diff()
  move([0, 80, 0])
  cuboid([105, 73.5, 1.16], chamfer=0.58, edges=[TOP], anchor=BOTTOM)
    tag("remove")
    # attach(TOP, TOP, align=LEFT+FWD)
      move([28, 14, 3])
        xrot(0) zrot(90)
        lilygo_t3s3();
