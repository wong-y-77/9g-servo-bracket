use <sg90.scad>
//use <complex.scad>
$fn=20;
//sg90();

// TODO: join axis and side mounts

module sg90_hornplate() {
  difference() {
    translate([0,7,0])cube([24,30,4],center=true);
    translate([0,0,2])sg90_singlehorn_mask();
    translate([0,7,0])sg90_bracket_mount_holemask(h=6);
    cylinder(r=3.5,h=6,center=true);
  }
}

module sg90_axis_mount() {
	difference() {
		translate([5.5,0,0]){
			cube([34,12,5],center=true);
		}
		translate([0,0,0]){
			sg90_holemask(l=8);
		}
		translate([0,0,22.5])scale(1.02) #sg90();
		translate([-8,0,-1.5])cube([8,8,4],center=true);
		translate([19,0,-1.5])cube([8,8,4],center=true);
	}	
  
	 	translate([0,0,-3.5]) difference() {
        cylinder(r=3.9,h=5,center=true);
        cylinder(r=1.2,h=6,center=true);
    }
        
}

module sg90_axis_mount_2() {
    $fn=60;
	//translate([5.5,2,0]){
	//	#cube([20,16,5],center=true);
	//}
	difference() {
		translate([5.5,2,-1.5]){
            cube([20,16,4],center=true);
		}
		//translate([0,0,0]){
        //    sg90_holemask(l=8);
		//}
		//translate([0,0,22.5])scale(1.02) sg90();
        translate([0,0,22.5-1.2]) sg90();
		//translate([-9,0,-1.5])cube([8,8,4],center=true);
		//translate([20,0,-1.5])cube([8,8,4],center=true);
	}	
  
    translate([0,0,-4.5]) difference() {
        cylinder(r=3.9,h=4,center=true);
        cylinder(r=1.2,h=5,center=true);
    }        
}

module sg90_axis_mount_stopper() {
    difference(){
      union() {
        cylinder(r=3.9,h=2,center=true);
        translate([0,0,-0.5])cylinder(r=4.5,h=1,center=true);
      }
      cylinder(r=1.5,h=3,center=true);
    }
}

module sg90_bracket_mask(h=33, big=true) {
    mv=h/2 -10.5;
	translate([0,-mv,0]) cube([22,h,32],center=true);
	translate([0,0,-h/2]) cylinder(r=4.1,h/2,center=true);
    hcr = (big==true) ? 4.1 : 3.6;
    translate([0,0,h/2]) cylinder(r=hcr,h/2,center=true);
	translate([0,0,18.1])
		rotate([180,0,0])
			sg90_singlehorn_mask(big=big);	
}

module sg90_bracket_mask_2(h=36, t=15, big=true) {    
    //mv=h/2 -12;
    rounded_end_r = t/2;
    cube_h = h - rounded_end_r;
    mv=h/2 - rounded_end_r - 3; //9 
    
	translate([0,-mv,0]) cube([22,h,32],center=true);
	translate([0,0,-15]) cylinder(r=4.1,15,center=true);
    hcr = (big==true) ? 4.4 : 3.85;
    translate([0,0,15]) cylinder(r=hcr,15,center=true);
	translate([0,0,18.1])
		rotate([180,0,0])
			sg90_singlehorn_mask(big=big);	
    
    //translate([6,-6,18.1]) cylinder(r=1.5,h=5,center=true);
    //translate([-6,6,18.1]) cylinder(r=1.5,h=5,center=true);
    //translate([-6,-6,18.1]) cylinder(r=1.5,h=5,center=true);
    //translate([6,6,18.1]) cylinder(r=1.5,h=5,center=true);
}

module sg90_bracket_mount_holemask(radius=1.5,h=5,bracket=false,joinplate=false) {
    offset = 4.5;
    
	translate([offset,offset,0]) cylinder(r=radius,h=h,center=true);
	translate([offset*-1,offset,0]) cylinder(r=radius,h=h,center=true);
	translate([offset*-1,offset*-1,0]) cylinder(r=radius,h=h,center=true);
	translate([offset,offset*-1,0]) cylinder(r=radius,h=h,center=true);    
        
    if (bracket || joinplate) {
        translate([offset,0,0]) cylinder(r=radius,h=h,center=true);
        translate([offset*-1,0,0]) cylinder(r=radius,h=h,center=true);    
        translate([offset,offset*2,0]) cylinder(r=radius,h=h,center=true);
        translate([offset*-1,offset*2,0]) cylinder(r=radius,h=h,center=true);   
        translate([offset,offset*-2,0]) cylinder(r=radius,h=h,center=true);
        translate([offset*-1,offset*-2,0]) cylinder(r=radius,h=h,center=true);
    }
}

module sg90_bracket_mount_holemask_screw(radius=1.6,h=5) {
	translate([6.1,6.1,0]) cylinder(r=radius,h=h,center=true);
	translate([-6.1,6.1,0]) cylinder(r=radius,h=h,center=true);
	translate([-6.1,-6.1,0]) cylinder(r=radius,h=h,center=true);
	translate([6.1,-6.1,0]) cylinder(r=radius,h=h,center=true);
    
    //translate([0,0,0]) cylinder(r=2.05,h=h,center=true);
    translate([0,0,0]) cylinder(r=1.15,h=h,center=true);
    translate([0,0,5]) cylinder(r=2.1,h=h,center=true);
    //translate([5.5,8,3.5])rotate([90,0,0]) sg90_bracket_mount_holemask(h=h*3);
	//translate([5.5,7.5,3.5])rotate([90,0,0]) sg90_bracket_mount_holemask(radius=4,h=3.1);
}

// TODO: arg to set the thickness
module sg90_bracket_nomounts(h=33) {
	mv=h/2 - 7.5;
	difference() {
		translate([0,-mv,0])
//			roundedcube([20,h,38], r=2, center=true);
			cube([20,h,38], center=true);

		sg90_bracket_mask(h=h, big=false);
	}
}

// cube + cylinder
// h = total
module sg90_bracket_nomounts_2(t=18, h=36) {
    $fn=60;
    
    //t = 18; // thickness  
    rounded_end_r = t/2;   
    cube_h = h - rounded_end_r;
    mv=cube_h/2; //9  
	difference() {
        union() {
            difference() {
                translate([0,-mv,0]) cube([t,cube_h,38], center=true);
                //translate([0,rounded_end_r/2,0]) cube([t+0.1,rounded_end_r+0.1,38.1], center=true);
            }
            cylinder(r=rounded_end_r,38,center=true);
        }
        
		sg90_bracket_mask_2(h=h, t=t, big=false);
	}
     
}

module sg90_bracket_test(h=36) {
	//mv=h/2 - 7.5;
	difference() {
        sg90_bracket_nomounts_2(h);		
        translate([0,-10,-5]) cube([20+4,h+4,38+4], center=true);
        translate([0,-41,0]) cube([20+4,h+4,38+4], center=true);
        translate([0,25,0]) cube([20+4,h+4,38+4], center=true);
        translate([-17,-5,0]) cube([20+4,h+4,38+4], center=true);
        translate([17,-5,0]) cube([20+4,h+4,38+4], center=true);
	}
}

module sg90_bracket(h=33) {
	//mv=h/2 - 7.5;
	difference() {
        sg90_bracket_nomounts(h);		
		translate([0, 9.51 - h,0])
			rotate([90,0,0]) {
				//# sg90_singlehorn_mask();
				//# cylinder(r=4.1,h=5,center=true);
				sg90_bracket_mount_holemask(bracket=true);
			}
	}
}

module sg90_bracket_2(t=18, h=36) {
	//mv=h/2 - 7.5;
	difference() {
        sg90_bracket_nomounts_2(t, h);		
		translate([0, 9.51 - h,0])
			rotate([90,0,0]) {
				//# sg90_singlehorn_mask();
				//# cylinder(r=4.1,h=5,center=true);
				sg90_bracket_mount_holemask(radius=1.4,h=10,bracket=true);
			}
        //translate([0,19.5 - h - 1,-18])
        translate([0,19.5 - h,-18])
            sg90_bracket_mount_holemask(radius=1.4,h=10,bracket=false);
        translate([0,19.5 - h,18])
            sg90_bracket_mount_holemask(radius=1.4,h=10,bracket=false);
	}
}

module sg90_bracket_mount_raiser(t=15, h=3) {
    rotate([0,90,0]) {
        difference() {
            cube([t, t, h], center=true);
            sg90_bracket_mount_holemask(radius=1.5,h=10,bracket=false);
        }
    }
}

module sg90_bracket_servomount(t=15, h=41) {
	//mv=h/2 - 7.5;
	difference() {
        union() {
            sg90_bracket_nomounts_2(t, h);
            translate([0,-h + t/2 + 4.5,0])cube([t,3,38],center=true);  
        }
        translate([0,9.51 - h,5.5]) rotate([180,90,90]) sg90_holemask(r=0.9, l=15);
		translate([0, 9.51 - h - 8.5,5.5])
			rotate([180,90,90]) {
                sg92r();           
			}          
	}
}

module sg90_bracket_servomount_v(t=15, h=41) {
	//mv=h/2 - 7.5;
	difference() {
        union() {
            sg90_bracket_nomounts_2(t, h);
            //translate([0,-h + t/2 + 4.5 - 1.5,0])cube([t,6,38],center=true);  
            translate([5.5,-h + t/2 + 4.5 - 1.5,0])rotate([0,90,0])cube([t,6,34],center=true);  
        }
        translate([0,9.51 - h,0]) rotate([90,0,0]) sg90_holemask(r=0.9, l=15);
		translate([11, 9.51 - h - 9.5,0])
			rotate([90,180,0]) {
                sg92r();           
			}          
	}
}

module sg90_bracket_angled(t=18, h=36) {
	//mv=h/2 - 7.5;
	difference() {
        sg90_bracket_nomounts_2(h);		
		translate([0, 9.51 - h,0])
			rotate([90,0,0]) {
				//# sg90_singlehorn_mask();
				//# cylinder(r=4.1,h=5,center=true);
				sg90_bracket_mount_holemask(h=10,bracket=true);
			}
	}
}

module sg90_servobracket(r=90,h=33) {
	sg90_bracket(h);
	translate([0,0,-12.5]) rotate([0,0,r])sg90_axis_mount();
	translate([0,0,-20]) rotate([0,0,r])sg90_axis_mount_stopper();
  
}

module sg90_servobracket_2(r=90,t=18, h=36) {
	//rotate([0,0,-90])
    sg90_bracket_2(t, h);
	//translate([0,0,-12.5]) rotate([0,0,r])sg90_axis_mount();
	//translate([0,0,-20]) rotate([0,0,r])sg90_axis_mount_stopper();
  
}

module sg90_sidemount(r=90,h=4) {
	rotate([0,0,r]) {  
		translate([0,0,-3.6])
		difference() {
			translate([5.5,1,2])union() {
				cube([34,14,9],center=true);
				translate([0,5+h/2,1.5])cube([34,h,24],center=true);
			}
			translate([5.5,-1,2])cube([24,14,11],center=true);
			sg90_holemask(l=15);
			translate([5.5,8,3.5])rotate([90,0,0]) sg90_bracket_mount_holemask(h=h*3);
			translate([5.5,7.5,3.5])rotate([90,0,0]) sg90_bracket_mount_holemask(radius=4,h=3.1);
		}
	}
}

module sg90_sidemount_2(r=90,h=4) {
    $fn=60;
    
	rotate([0,0,r]) {  
		translate([0,0,-3.6])
		difference() {
			translate([5.5,1,2])union() {
                translate([0,h/2-2,1])cube([34,14,7],center=true);                
				translate([0,5+h/2,1.5])cube([34,h,24],center=true);
			}
			translate([5.5,-1,2])cube([24,14,11],center=true);
			sg90_holemask(r=0.9, l=15);
			translate([5.5,7.5,3.5])rotate([90,0,0]) sg90_bracket_mount_holemask(h=h*3);
			translate([5.5,7.5,3.5])rotate([90,0,0]) sg90_bracket_mount_holemask(radius=4,h=3.1);
            
            //translate([5.5,7.5,3.5])rotate([90,0,0])rotate([0,0,45]) sg90_bracket_mount_holemask_screw(h=h*3);
            //#translate([16,9+0.1,3.5]) rotate([0,90,90]) sg90_singlehorn_mask(big=big);
		}
        
        translate([0,0,-12.5]) {
            difference() {
                translate([5.5,2,-1.5]){
                    cube([20,16,4],center=true);
                }
                translate([0,0,22.5-1.2]) sg90();
            }	
  
            translate([0,0,-4.5]) difference() {
                cylinder(r=3.9,h=4,center=true);
                cylinder(r=1.2,h=5,center=true);
            }
        }    
	}      
}


module sg90_sidemount_join_arm(h=4) {
	difference() {
		translate([5.5,1,2])
            cube([34,14,7],center=true); 
        translate([5.5+0.1,5+h/2+1,1.5+2])cube([34,h,24],center=true); 
		translate([5.5-3,1,2])cube([30,14.1,11],center=true);
        translate([7.51,0,-2])cube([30,14.1,11],center=true);
		sg90_holemask(l=15);	 		
	}
}

module sg90_mount(r=r,h=33) {
    sg90_servobracket(r=r,h=h);
    sg90_sidemount(r=r);
}

module sg90_mount_2(r=r,t=18,h=36) {
    // base
    //color([0.5,0,0]) translate([29,-30,0]) rotate([0,270,0]) sg90_servomount();
    color([0,0,0.5]) translate([29,-27,0]) rotate([180,90,0]) sg90_servobracket_2(r=r,t=t,h=h+11);
    // level 1
    color([1,1,1]) rotate([0,0,270]) sg90_servomount();
    color([0,0,1]) sg90_servobracket_2(r=r,t=t,h=h+11);
    
    color([1,0,0]) translate([-24.5,-47.5,0]) sg90_servomount();
    color([0,0,1]) translate([-24.5,-47.5,0]) rotate([0,0,180]) sg90_servobracket_2(r=r,t=t,h=h+11);
    
    color([1,1,1]) translate([-28.5,-4,0]) rotate([180,0,0]) sg90_servomount();
    color([0,0,1]) translate([-28.5,-4,0]) rotate([180,0,0]) sg90_servobracket_2(r=r,t=t,h=h+11);
    //color([0,1,0]) sg90_plate_join();
    //color([1.5,0,0]) translate([-10,25,0]) rotate([180,0,90]) sg90_servobracket_2(r=r,t=t,h=h);
    translate([-28.5,36.5,5]) rotate([0,90,90]) sg90();
	//translate([0,0,-12.5]) rotate([0,0,r])sg90_axis_mount_2();	
    //sg90_sidemount_2(r=r);
    //translate([0,-5.5,25]) rotate([0,270,0]) sg90_sidemount_2(r=r);
}

module sg92r_arm(r=r,t=15,h=30) {
    // arm base
    color([0,0,1]) translate([47,-50.5,0]) sg90_arm_base();
    
    // servo base
    translate([33,-31,0]) rotate([270,0,90]) sg90_servomount_base();
    //color([1,1,0]) translate([32,-43.5,0]) rotate([90,0,90]) sg90_plate_join();
    //color([0,0,1]) translate([29,-27,0]) rotate([180,270,0]) sg90_bracket_2(r=r,t=t,h=h+11);
    color([0,0,1]) translate([33+0.2,-31,0]) rotate([180,90,0]) sg90_bracket_2(r=r,t=t,h=h+11);
    
    translate([12.5+0.2,-9.5,0]) sg90_bracket_mount_raiser();
    
    //rotate([180,0,0]) translate([0,19,0]) {
    // level 1
    color([1,1,1]) translate([1+0.2,-4,0]) rotate([0,0,270]) sg90_servomount();
    color([0,0,1]) translate([1+0.2,-4,0-0.1]) sg90_bracket_2(r=r,t=t,h=h+11);
        
    color([1,1,1]) translate([-24,-47.5,0]) sg90_servomount_ext();
    color([0,0.5,0.5]) translate([-24,-47.5,0]) rotate([0,0,180]) sg90_bracket_2(r=r,t=t,h=h+11+11);
    
    
    
    color([1,1,1]) translate([-18,-4+11,0]) rotate([0,0,180]) sg90_servomount();
    //color([0,1,1]) translate([-19,-4+11,0]) rotate([0,0,180]) sg90_bracket_servomount(r=r,t=15+2,h=h+11);
    //#translate([-19,36.5+11,5]) rotate([0,90,90]) sg90();        
    //translate([-14.5,40,-7]) rotate([90,0,0])gripper_mount();
    
    // using servomount_v
    //color([0,1,1]) translate([-19,-4+11,0]) rotate([0,0,180]) sg90_bracket_servomount_v(r=r,t=15+2,h=h+11);
    //#translate([-19,36.5+10,0]) rotate([90,0,180]) sg90();        
    //translate([-14.5,40,-12.5]) rotate([90,0,0])gripper_mount();
    //#translate([-10,66.5,0]) rotate([90,0,90]) sg90(); 
    
    union() translate([-10.2,-10.6,0]) rotate([0,0,-45]) {
    color([0,1,1]) translate([-18,-4+11,0]) rotate([0,0,180]) sg90_bracket_servomount(r=r,t=15+2,h=h+11);
    #translate([-18,36.5+10,-5]) rotate([90,270,180]) sg90();        
    translate([-15,40,-17.5]) rotate([90,0,0])gripper_mount();
    }
    //#translate([-10,66.5,0]) rotate([90,0,90]) sg90(); 
     
    
    //color([0,1,0]) sg90_plate_join();
    //color([1.5,0,0]) translate([-10,25,0]) rotate([180,0,90]) sg90_servobracket_2(r=r,t=t,h=h);
    
	//translate([0,0,-12.5]) rotate([0,0,r])sg90_axis_mount_2();	
    //sg90_sidemount_2(r=r);
    //translate([0,-5.5,25]) rotate([0,270,0]) sg90_sidemount_2(r=r);
    //}
}


module sg92r_quadrapod(r=r,t=15,h=30) {
    color([0,0,1]) sg90_servomount();
    color([0,0,1]) translate([0,0,0]) rotate([0,0,0]) sg90_bracket_2(r=r,t=t,h=h+11);
    
    translate([5.5,20,5.5]) rotate([0,90,180]) sg90_servomount();
    translate([5.5,20,5.5]) rotate([0,90,180]) sg90_bracket_2(r=r,t=t,h=h);
    
    // servo base
    //translate([33,-31,0]) rotate([270,0,90]) sg90_servomount_base();
    //color([1,1,0]) translate([32,-43.5,0]) rotate([90,0,90]) sg90_plate_join();
    //color([0,0,1]) translate([29,-27,0]) rotate([180,270,0]) sg90_bracket_2(r=r,t=t,h=h+11);
    //color([0,0,1]) translate([33,-31,0]) rotate([180,270,0]) sg90_bracket_2(r=r,t=t,h=h+11);
    
    //translate([12.5,-10,0]) sg90_bracket_mount_raiser();
    
    //rotate([180,0,0]) translate([0,19,0]) {
    // level 1
    //color([1,1,1]) translate([1,-4,0]) rotate([0,0,270]) sg90_servomount();
    //color([0,0,1]) translate([1,-4,0]) sg90_bracket_2(r=r,t=t,h=h+11);    
}


module sg90_servomount(r=r,h=4) {
    $fn=60;
    
	rotate([0,0,r]) {  
		translate([0,0,-3.6])
		difference() {
			translate([5.5,1,2])union() {
                translate([0,h/2-2,1])cube([34,14,7],center=true);                
				translate([0,5+h/2,1.5])cube([34,h,24],center=true);
			}
            // cut corners
            translate([-9.01,6+h/2,-4.51])cube([5,h+0.1,8],center=true);
            translate([-9.01,6+h/2,11.01])cube([5,h+0.1,9],center=true);
            translate([20.01,6+h/2,-4.51])cube([5,h+0.1,8],center=true);
            translate([20.01,6+h/2,11.01])cube([5,h+0.1,9],center=true);
            
			translate([5.5,-1,2])cube([24,14,11],center=true);
			sg90_holemask(r=0.85, l=15);
			translate([5.5,7.5,3.5])rotate([90,0,0]) sg90_bracket_mount_holemask(h=h*3);
			translate([5.5,7.5,3.5])rotate([90,0,0]) sg90_bracket_mount_holemask(radius=4,h=3.1);
		}
        
        translate([0,0,-12.5]) {
            difference() {
                translate([5.5,2,-1.5]){
                    cube([20,16,4],center=true);
                }
                translate([0,-0.2,22.5-0.2]) sg92r();
            }	
  
            translate([0,0,-4.5]) difference() {
                cylinder(r=3.9,h=4,center=true);
                cylinder(r=1.2,h=5,center=true);
            }
        }    
	}      
}

module sg90_servomount_ext(r=r,h=4) {
    $fn=60;
    
	rotate([0,0,r]) {  
		translate([0,0,-3.6])
		difference() {
			translate([5.5,1,2])union() {
                translate([0,h/2-2,1])cube([34,14,7],center=true);                
				translate([0,5+h/2,1.5])cube([34,h,24],center=true);
                translate([22,5+h/2,1.5])cube([10,h,24],center=true);
			}
            // cut corners
            translate([-9.01,6+h/2,-4.51])cube([5,h+0.1,8],center=true);
            translate([-9.01,6+h/2,11.01])cube([5,h+0.1,9],center=true);
            //translate([20.01,6+h/2,-4.51])cube([5,h+0.1,8],center=true);
            //translate([20.01,6+h/2,11.01])cube([5,h+0.1,9],center=true);
            
			translate([5.5,-1,2])cube([24,14,11],center=true);
			sg90_holemask(r=0.85, l=15);
			translate([5.5,7.5,3.5])rotate([90,0,0]) sg90_bracket_mount_holemask(h=h*3);
			translate([5.5,7.5,3.5])rotate([90,0,0]) sg90_bracket_mount_holemask(radius=4,h=3.1);
            
            translate([25,10.99,3.5])rotate([90,0,0]) sg90_bracket_mount_holemask(radius=1.4,h=10,bracket=false);
		}
        
        translate([0,0,-12.5]) {
            difference() {
                translate([5.5,2,-1.5]){
                    cube([20,16,4],center=true);
                }
                translate([0,-0.2,22.5-0.2]) sg92r();
            }	
  
            translate([0,0,-4.5]) difference() {
                cylinder(r=3.9,h=4,center=true);
                cylinder(r=1.2,h=5,center=true);
            }
        }    
        //difference() {
        //    translate([27.5,5+h/2+1,-0.1])cube([10,h,24],center=true);
        //    translate([25,8,-0.1])rotate([90,0,0]) sg90_bracket_mount_holemask(radius=1.4,h=10,bracket=false);
        //}
        translate([22.5, -6, 0])
        linear_extrude(height = 3, center = true, convexity = 10, twist = 0)
        polygon(points=[[0,0],[0,12],[10,12]]);
	}      
}

// screw 10mm;
// nut and rings 3.6mm
// nut 2.6mm 5.3 6.1
// thickness 6.4
module sg90_servomount_base(r=0,h=4) {
    $fn=60;
    
	rotate([0,0,r]) {  
		translate([0,0,-3.6])
		difference() {
			translate([5.5,1,2])union() {
                // arm block
                translate([0,h/2-2-1,1])cube([34,14,7],center=true);
                // back block
                //color([1,0,0]) translate([0,5+h/2,1.5])cube([34,h,24],center=true);
				translate([0, 5+h/2, 1.5-4.5-2])cube([34,h,19],center=true);
                // front block
                translate([0, 5+h/2 -12-h, 1.5-4.5-2])cube([34,h,19],center=true);
                // bottom
                translate([0,h/2-2.5,-12.5])cube([23,18,4],center=true);
                //join
                translate([-18.5,h/2-3,-5])cube([3,20,19],center=true);
			}
            // cut corners
            //#translate([-9.01,6+h/2,-4.51])cube([5,h+0.1,8],center=true);
            //#translate([-9.01,6+h/2,11.01])cube([5,h+0.1,9],center=true);
            translate([19.76,6+h/2,-4.51-2])cube([5.6,h+0.1,12],center=true);
            //#translate([20.01,6+h/2,11.01])cube([5,h+0.1,9],center=true);
            translate([19.76,6+h/2-12-h,-4.51-2])cube([5.6,h+0.1,12],center=true);
                        
            //screw hold and slot for nut
            //translate([-10,6+h/2-12-h+2,1.5])cube([3,8,5.35],center=true);
            translate([-10,6+h/2-12-h+8,-7.5])cube([3,22,5.35],center=true);
            //translate([-13.5,6+h/2-12-h+1.5,-8])cube([4,8.1,8],center=true);
            translate([-10,0,-3]) rotate([0,90,0]) sg90_bracket_mount_holemask(radius=1.4,h=10,bracket=false);
            
			//translate([5.5,-1,2])cube([24,14,11],center=true);
			sg90_holemask(r=0.9, l=15);
			//translate([5.5,7.5,3.5])rotate([90,0,0]) sg90_bracket_mount_holemask(h=h*3);
			//translate([5.5,7.5,3.5])rotate([90,0,0]) sg90_bracket_mount_holemask(radius=4,h=3.1);
            translate([0,-0.2,22.5-0.2-9]) sg92r_x();
		}
        
        translate([0,0,-12.5]) {
            difference() {
                
                //#translate([0,-0.1,22.5-0.2]) sg92r_x();
            }	
  
            translate([0,0,-4.5]) difference() {
                cylinder(r=3.9,h=4,center=true);
                cylinder(r=1.2,h=5,center=true);
            }
        }    
	}      
}

module sg90_arm_base(r=r) {
    $fn=60;
    
	rotate([0,0,r]) {  
		difference() {
			union() {
                // arm block
                translate([-1, 0, 0]) cube([31.8,10,20],center=true);
                translate([12.5,5,0]) cube([5,60,20],center=true);
                translate([12.5,0,0]) cube([5,20,60],center=true);
                translate([7.5,1.5,0]) cube([10.8,13,20],center=true);                  
			}
            translate([-7.5,0,0])rotate([90,0,0]) sg90_bracket_mount_holemask(radius=1.4,h=12);
			translate([-7.5,-2.01,0])rotate([90,0,0]) sg90_bracket_mount_holemask(radius=4,h=6);
        }
	}      
}

module bracket_ring(t=14) {
    $fn=60;
    rotate ([0,90,0]) difference() {
        cylinder(r=t/2,0.4,center=true);
        cylinder(r=4.1,0.41,center=true);        
    }
    
    //translate([0,0,-16]) rotate ([0,90,0]) difference() {
    //    cylinder(r=t/2,0.2,center=true);
    //    cylinder(r=4.1,0.21,center=true);  
    //}
}

module sg90_servomount_join_arm(r=r) {
    //sg90_servobracket_2(r=r,h=h);
	//translate([0,0,-12.5]) rotate([0,0,r])sg90_axis_mount_2();
    rotate([0,90,0]) {
        sg90_sidemount_join_arm();
        mirror([1,0,0]) translate([-34-11,0,0]) sg90_sidemount_join_arm();
    }
}

module sg90_servomount_join_side(r=r) {
    //sg90_servobracket_2(r=r,h=h);
	//translate([0,0,-12.5]) rotate([0,0,r])sg90_axis_mount_2();
    rotate([0,90,0]) {
        sg90_sidemount_join_arm();
        mirror([1,0,0]) translate([-34-11,0,0]) sg90_sidemount_join_arm();
    }
}

module sg90_plate_join(l=34, w=24, t=4) {
    rotate([0,90,0]) 
        difference() {
            cube([l,w,t],center=true); 
            rotate([0,0,90]) {// sg90_bracket_mount_holemask(radius=1.4,h=10,joinplate=true);
                offset = 4.5;
                radius=1.4;
                h=12;
    
                translate([offset,5,0]) cylinder(r=radius,h=h,center=true);
                translate([offset*-1,5,0]) cylinder(r=radius,h=h,center=true);    
                translate([offset,offset*2+5,0]) cylinder(r=radius,h=h,center=true);
                translate([offset*-1,offset*2+5,0]) cylinder(r=radius,h=h,center=true);   
                translate([offset,offset*-2+4,0]) cylinder(r=radius,h=h,center=true);
                translate([offset*-1,offset*-2+4,0]) cylinder(r=radius,h=h,center=true);
                translate([offset,offset*-4+4,0]) cylinder(r=radius,h=h,center=true);
                translate([offset*-1,offset*-4+4,0]) cylinder(r=radius,h=h,center=true);
            }
        }
}

module gripper_mount(big=false) {
    $fn=60;
    difference() {
        translate([-0.15,-0.15,0]) rotate([0,90,0]) import("E:/3d/models/EEZYbotARM - 1015238/files/EBA_01.00.012_R01_claw_support.STL", convexity=5);
        translate([0,0,-15]) cube([10,30,15]);
        translate([10,0,-30]) cube([35,30,30]);
    }
    difference() {
        translate([-9.5,-4,-15]) cube([14,33,3]);    
        translate([-3.9,12.5,-14.01]) union() {
            sg90_singlehorn_mask(big=big);	
            rotate([180,0,0]) sg90_singlehorn_mask2(big=big);
            rg = (big==true) ? 4.4 : 3.75;
            cylinder(r=rg,15,center=true);
        }
        //translate([-10.5,14,-16]) rotate([0,0,85]) cube([20,15,5]); 
        //translate([-25.5,10,-16]) rotate([0,0,-85]) cube([20,15,5]); 
        //translate([4.5,25,-16]) rotate([0,0,35]) cube([15,15,5]); 
        //translate([-4.1,-12.2,-16]) rotate([0,0,-35]) cube([15,15,5]); 
        translate([0,12.55,-27.55])rotate([0,90,0]) sg90_holemask(r=0.85, l=15);
    }
    
    translate([-9.5,-4,-15]) cube([14,2,3]); 
    translate([-9.5,27,-15]) cube([14,2,3]);  
      
}

module gripper_015_drive_gear(big=false) {
//EBA_01.00.015_drive_gear.STL
    $fn=60;
    difference() {
        translate([0,0,0]) rotate([0,270,0]) import("E:/3d/models/EEZYbotARM - 1015238/files/EBA_01.00.015_drive_gear.STL", convexity=5);
        translate([-2.06,10.1,10.1]) rotate([90,0,90]) sg90_singlehorn_mask2(big=big);
        translate([-4.06,10.1,10.1]) rotate([90,0,90]) sg90_singlehorn_mask2(big=big);
        rg = (big==true) ? 4.4 : 3.75;
        translate([-4.06,10.1,10.1]) rotate([90,0,90]) cylinder(r=rg,15,center=true);
    }
}

// sg90_mount(r=90);
 rotate([0,90,0]) {
    //rotate([0,180,0]) sg90_bracket_test();
    //translate([0,0,50])
    //rotate([0,180,0]) sg90_bracket_2(t=15,h=30+11);
    ///sg90_bracket_mount_raiser();
    //rotate([0,180,0]) sg90_bracket_2(t=15,h=30+11+11);
    //rotate([0,180,0]) sg90_bracket_2(t=15,h=30+11+11+11); not in use
    //rotate([0,180,0])  sg90_bracket_servomount(t=15+2,h=30+11);
    //rotate([90,90,90]) sg90_bracket_2(h=36+11); // long bracket is 11mm longer    
    ///color([0,0,1.5]) translate([29.1,-27,0]) rotate([180,270,0]) sg90_servobracket_2(t=15,h=30+11);
    // level 1
    //color([1,1,1]) rotate([0,0,270]) sg90_servomount();
    //color([1,1,1]) rotate([0,0,270]) sg90_servomount_ext();
    //rotate([0,180,0]) sg90_bracket_angled(h=36);
    //sg90_axis_mount();
    //sg90_sidemount();
    //sg90_mount();    
    //sg90_mount_2(t=15, h=30);
    //translate([0,0,50])
    //sg92r_arm();
    //color([0.1,0.1,0.1]) translate([13.5,-40,20]) rotate([90,0,45]) cube([1,1,30],center=true);
    //sg90_bracket_servomount_v();
    //sg90_arm_base();
    sg90_servomount_base(r=270);
    //sg90_plate_join();
    //rotate([0,180,0])sg90_servomount(r=90);
    //sg90_servomount_join_arm(h=36);
    //rotate([0,90,0])sg90_axis_mount_stopper();
    ///bracket_ring();
    //gripper_mount(big=false);
    //gripper_015_drive_gear();
    //sg92r_quadrapod();
}
