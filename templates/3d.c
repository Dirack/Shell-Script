/* Version 1.0 - Template 3d for lazymadaga
 
Programer: Rodolfo A. C. Neves (Dirack) 14/03/2020

Email:  rodolfo_profissional@hotmail.com 

License: GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>. 

*/

#include <stdio.h>
#include <stdlib.h>
#include <rsf.h>

int main(int argc, char* argv[])
{

	float*** vector3d;

	/* RSF files I/O */
	sf_file in, out;

	/* RSF files axis */

	sf_init(argc,argv);

	in = sf_input("in");
	out = sf_output("out");

	/* Read input file geometry */
	if(!sf_histint(in,"n1",&nt0)) sf_error("No n1= in input");
	if(!sf_histfloat(in,"o1",&ot0)) sf_error("No o1= in input");
	if(!sf_histfloat(in,"d1",&dt0)) sf_error("No d1= in input");
	if(!sf_histint(in,"n2",&nm0)) sf_error("No n2= in input");
	if(!sf_histfloat(in,"d2",&dm0)) sf_error("No d2= in input");
	if(!sf_histfloat(in,"o2",&om0)) sf_error("No o2= in input");
	if(!sf_histint(in,"n3",&nm0)) sf_error("No n3= in input");
	if(!sf_histfloat(in,"d3",&dm0)) sf_error("No d3= in input");
	if(!sf_histfloat(in,"o3",&om0)) sf_error("No o3= in input");

	/* Read auxiliary files geometry */

	if(!sf_getbool("verb",&verb)) verb=0;
	/* 1: active mode; 0: quiet mode */

	if(verb){
		sf_warning("Active mode on!!!");
		sf_warning("Input file parameters: ");
		sf_warning("n1=%d d1=%f o1=%f",n1,d1,o1);
		sf_warning("n2=%d d2=%f o2=%f",n2,d2,o2);
		sf_warning("n3=%d d3=%f o3=%f",n3,d3,o3);
	}

	/* Read input files */
	vector2d = sf_floatalloc3(n1,n2,n3);
	
	sf_floatwrite(vector3d[0][0],n1*n2*n3,out);
}
