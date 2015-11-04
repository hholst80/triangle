ALL: triangle1.exe triangle2.exe
	
%.exe: %.f90
	gfortran -o $@ $^
	
tests: triangle1.exe triangle2.exe
	triangle1.exe Triangle4.txt
	triangle2.exe Triangle4.txt
	triangle1.exe Triangle15.txt
	triangle2.exe Triangle15.txt
	triangle2.exe Triangle100.txt
	triangle1.exe Triangle100.txt
	
