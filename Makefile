triangle.exe: triangle.f90
	gfortran -o $@ -O2 $^
