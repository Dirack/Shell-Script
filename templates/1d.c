/* Version 1.0 - Template 1d for lazymadaga
 
Programer: Rodolfo A. C. Neves (Dirack) 14/03/2020

Email:  rodolfo_profissional@hotmail.com 

License: GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>. 

*/

#include <stdio.h>
#include <stdlib.h>
#include <rsf.h>

int main(int argc, char* argv[])
{

	float* vector1d;

	/* RSF files I/O */
	sf_file in, out;

	/* RSF files axis */

	sf_init(argc,argv);

	in = sf_input("in");
	out = sf_output("out");

	/* Read input file geometry */
	if(!sf_histint(in,"n1",&n1)) sf_error("No n1= in input");
	if(!sf_histfloat(in,"o1",&o1)) sf_error("No o1= in input");
	if(!sf_histfloat(in,"d1",&d1)) sf_error("No d1= in input");

	/* Read auxiliary files geometry */

	if(!sf_getbool("verb",&verb)) verb=0;
	/* 1: active mode; 0: quiet mode */

	if(verb){
		sf_warning("Active mode on!!!");
		sf_warning("Input file parameters: ");
		sf_warning("n1=%d d1=%f o1=%f",n1,d1,o1);
	}

	/* Read input files */
	vector1d = sf_floatalloc(n1);
	
	sf_floatwrite(vector1d,n1,out);
}
