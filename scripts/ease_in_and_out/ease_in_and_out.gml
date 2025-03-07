function ease_in_and_out() {


	var t = argument[0];
	var b = argument[1];
	var c = argument[2];
	var d = argument[3]; 


	 t /= d/2;
 
	  if (t < 1) {  return c/2 *t*t + b; }
	 t--;
 
	  return -c/2 * (t * (t-2) -1) + b;


}
