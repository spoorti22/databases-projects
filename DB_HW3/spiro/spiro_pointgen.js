/*
This file generates all the spiro points which are then saved in a CSV file.
The python script: generate_kml_from_csv.py is then used to generate the final kml file from the points
*/
var R=5, r=1, a=4;
var x0=R+r-a, y0=0;
var bovardx, bovardy;
var cos=Math.cos, sin=Math.sin, pi=Math.PI, nRev=10;

for(var t=0.0;t<(pi*nRev);t+=0.01)
{
	var x=(R+r)*cos((r/R)*t) - a*cos((1+r/R)*t);
  	var y=(R+r)*sin((r/R)*t) - a*sin((1+r/R)*t);
  	bovardx=-118.285553+0.0001*x;
 	bovardy=34.020857+0.0001*y;
  	console.log(bovardx+","+bovardy);
}