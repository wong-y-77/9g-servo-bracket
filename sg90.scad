// 12 w
// 23 l
// 32.5 l
// 20 arm to base
//  2.5 arm
// 31.5 h
// 28.5 h2
// 24 h3
// diff 2.5mm - use 1mm
// horn len 21.6 ... 18
// round 7.3 ... 6.9
module sg90_holemask(r=1.15, l=5) {
  translate([-11,-6,0]) {
  translate([2.3,5.9,-0.1 ]) cylinder(r=r, h=l, center=true, $fn=20);
  translate([33-2.3,5.9,-0.1 ]) cylinder(r=r, h=l, center=true, $fn=20);
  }
}


module sg92r_x() {
    $fn=30;
    color([0.2,0.3,0.8]) translate([-6,-6,-24]) cube([23.2,12.4,24]);
}
      
module sg92r() {
	$fn=30;
   color([0.2,0.3,0.8]){
      translate([-6,-6,-24]) {
      cube([23,12.2,24]);
      translate([-5,0,17]){
        difference() {
          cube([33,12,2.5]);
          translate([-0.1,5.9-.65,-0.1]) cube([2.4,1.3,3]);
          translate([33-2.3,5.9-.65,-0.1]) cube([2.4,1.3,3]);
          translate([2.3,5.9,-0.1 ]) cylinder(r=1.15, h=3);
          translate([33-2.3,5.9,-0.1 ]) cylinder(r=1.15, h=3);
        }
      }
    }
      cylinder(r=6,h=4.5);
      translate([5.5,0,0]) cylinder(r=2,h=4);
      cylinder(r=2.3,h=7.2);
      cylinder(r=2.5,h=4);
    
    translate([-7,-2,-18.5]) cube([2,4,1.5]);
  }
}

module sg90() {
	$fn=30;
  color([0.2,0.3,0.8]){
      translate([-6,-6,-23]) {
      cube([23,12,23]);
      translate([-5,0,15.9]){
        difference() {
          cube([33,12,2.5]);
          translate([-0.1,5.9-.65,-0.1]) cube([2.4,1.3,3]);
          translate([33-2.3,5.9-.65,-0.1]) cube([2.4,1.3,3]);
          translate([2.3,5.9,-0.1 ]) cylinder(r=1.15, h=3);
          translate([33-2.3,5.9,-0.1 ]) cylinder(r=1.15, h=3);
        }
      }
    }
      cylinder(r=6,h=4);
      translate([5.5,0,0]) cylinder(r=2,h=4);
      cylinder(r=2.3,h=7.2);
      cylinder(r=2.5,h=4);
    
    translate([-7,-2,-18.5]) cube([2,4,1.5]);
  }
}

module sg90_singlehorn_mask(h=2, big=true) {
$fn=30;
	h2 = h/2;
	//rg = (big==true) ? 4.4 : 3.95;
    rg = (big==true) ? 4.4 : 3.85;
	//rk = (big==true) ? 2.8 : 2.5;
    rk = (big==true) ? 2.8 : 2.5;
    //points=[[-rg,0,-h2],[-rk,13.55,-h2],[ rk,13.55,-h2],[ rg,0,-h2],
	//		 [-rg,0,h2],[-rk,13.55, h2],[ rk,13.55,h2],[ rg,0,h2]
	//];
	points=[[-rg,0,-h2],[-rk,17,-h2],[ rk,17,-h2],[ rg,0,-h2],
			 [-rg,0,h2],[-rk,17, h2],[ rk,17,h2],[ rg,0,h2]
	];
	faces = [[0,2,1],[0,3,2],[4,5,6],[4,6,7],[0,1,4],[1,5,4],
			  [2,3,6],[3,7,6],[0,4,7],[0,7,3], [1,2,5], [5,2,6]
			  ];


		cylinder (r=rg,h=h,center=true);
		//translate([0,13.55,0])cylinder(r=rk,h=h,center=true);
        translate([0,17,0])cylinder(r=rk,h=h,center=true);
  		polyhedron(points,faces);
    //translate([0,8,-5])cylinder(r=1,h=10);
    translate([0,11,-5])cylinder(r=1,h=10); 
    //translate([0,14,-5])cylinder(r=1,h=10);  
}


module sg90_singlehorn_mask2(h=2, big=true) {
$fn=30;
	h2 = h/2;
	//rg = (big==true) ? 4.4 : 3.95;
    rg = (big==true) ? 4.4 : 3.75;
	//rk = (big==true) ? 2.8 : 2.5;
    rk = (big==true) ? 2.8 : 2.3;
    //points=[[-rg,0,-h2],[-rk,13.55,-h2],[ rk,13.55,-h2],[ rg,0,-h2],
	//		 [-rg,0,h2],[-rk,13.55, h2],[ rk,13.55,h2],[ rg,0,h2]
	//];
	points=[[-rg,0,-h2],[-rk,17,-h2],[ rk,17,-h2],[ rg,0,-h2],
			 [-rg,0,h2],[-rk,17, h2],[ rk,17,h2],[ rg,0,h2]
	];
	faces = [[0,2,1],[0,3,2],[4,5,6],[4,6,7],[0,1,4],[1,5,4],
			  [2,3,6],[3,7,6],[0,4,7],[0,7,3], [1,2,5], [5,2,6]
			  ];


		cylinder (r=rg,h=h,center=true);
		//translate([0,13.55,0])cylinder(r=rk,h=h,center=true);
        translate([0,17,0])cylinder(r=rk,h=h,center=true);
  		polyhedron(points,faces);
    //translate([0,8,-5])cylinder(r=1,h=10);
    translate([0,11,-5])cylinder(r=1,h=10); 
    //translate([0,14,-5])cylinder(r=1,h=10);  
}

module sg90_singlehorn_holemask(l=6) {
	translate([0,0,0])cylinder(r=1.5, h=l, center=true);
	translate([0,4,0])cylinder(r=.8, h=l, center=true);
	translate([0,6,0])cylinder(r=.8, h=l, center=true);
	translate([0,8,0])cylinder(r=.8, h=l, center=true);
	translate([0,10,0])cylinder(r=.8, h=l, center=true);
	translate([0,12,0])cylinder(r=.8, h=l, center=true);
	translate([0,14,0])cylinder(r=.8, h=l, center=true);
}

module sg90_singlehorn() {
$fn=30;


difference() {
  	union() {
		cylinder (r=3.95,h=5,center=true);
		translate([0,0,1.5])sg90_singlehorn_mask(big=false);
   }
	translate([0,0,2])cylinder(r2=3, r1=2.5, h=1.5, center=true);
	translate([0,0,-2])cylinder(r2=3, r1=2.75, h=4, center=true);
	sg90_singlehorn_holemask();
 } 

}

translate([0,0,10]) sg90_singlehorn();
//sg90();
sg92r();
