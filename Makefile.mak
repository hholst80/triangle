all: triangle1.exe triangle2.exe
	
.f90.exe:
	gfortran -o $@ $<

clean:
	if exist triangle1.exe del triangle1.exe
	if exist triangle2.exe del triangle2.exe
	
test: triangle1.exe triangle2.exe
	triangle1.exe < Triangle4.txt
	triangle2.exe < Triangle4.txt
	triangle1.exe < Triangle15.txt
	triangle2.exe < Triangle15.txt
	triangle2.exe < Triangle100.txt
	triangle1.exe < Triangle100.txt
	
