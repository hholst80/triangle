ALL: triangle1.exe triangle2.exe
	
.f90.exe:
	gfortran -o $@ $<
	
tests: triangle1.exe triangle2.exe
	triangle1.exe < Triangle4.txt
	triangle2.exe < Triangle4.txt
	triangle1.exe < Triangle15.txt
	triangle2.exe < Triangle15.txt
	triangle2.exe < Triangle100.txt
	triangle1.exe < Triangle100.txt
	
