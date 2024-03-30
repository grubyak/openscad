use <threadlib/threadlib.scad>
use <threads.scad>

$fn = 50;
mount_diameter = 39;
lens_diameter = 32.5;
lens_thread_lead_in = 0.415;

module adapter_base() {
  $fn = 8;
  cylinder(d = 55, h = 2);
}

module adapter() {  
  adapter_height = 5.5;

  difference() {
    union() {
      adapter_base();
      cylinder(d = mount_diameter - 1.6, h = adapter_height);
      translate([0, 0, 1]) thread("M39x1-ext", turns = 4, higbee_arc = 30);
    }

    translate([0, 0, 2.6]) cylinder(d = lens_diameter, h = adapter_height);
    translate([0, 0, -1]) metric_thread(diameter = lens_diameter + lens_thread_lead_in, pitch = 0.5, length = 4);
  }
}

adapter();