use <threads.scad>

$fn = 360;
lead_in_height = 1.5;
thread_lead_in = 0.4;
cover_height = 1.5;
thread_height = 2;
delimited = 1.5;
ring_width = 4;

module splitzer(diameter, pitch) {
  // body
  difference() {
    cylinder(d = diameter, h = cover_height + thread_height);
    translate([0, 0, -1]) cylinder(d = diameter - ring_width, h = cover_height + thread_height + 2);

    // lead-in
    difference() {
      translate([0, 0, cover_height + thread_height - lead_in_height]) cylinder(d = diameter + 2, h = lead_in_height + 1);
      translate([0, 0, cover_height + thread_height - lead_in_height - 1]) cylinder(d = diameter - 2 * thread_lead_in, h = lead_in_height + 2);
    }

    // thread
    difference() {
      translate([0, 0, cover_height - 1]) cylinder(d = diameter + 3, h = thread_height);
      translate([0, 0, cover_height - 2]) metric_thread(diameter = diameter - thread_lead_in, pitch = pitch, length = thread_height + 2);
    }
  }

  // cover
  difference() {
    translate([0, 0, 0]) cylinder(d = diameter - thread_lead_in, h = cover_height);
    translate([diameter / 2, diameter / 2, -1]) cylinder(d = diameter * 2, h = cover_height + 2, $fn = 4);
  }

  rotate(-45)
  translate([-(diameter - 1) / 2, -delimited, cover_height]) cube([diameter - 1, delimited, thread_height]);
}

splitzer(67, 0.75);
