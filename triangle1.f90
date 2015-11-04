program triangle_brute_force
  implicit none
  integer       height, max_height, ires
  parameter   ( max_height = 100 )
  integer       triangle(max_height,max_height)
  character*256 filename

  print*, '*************************************************************'
  print*, '* Brute force method.                                       *'
  print*, '*************************************************************'
  print*,

  if (iargc() == 0) then
    print*, 'Please supply a data file as first argument'
    return
  end if

  height = 0
  triangle(:,:) = 0

  ! Read data

  call getarg(1,filename)
  open (1, file=filename, iostat=ires, status='old')
  if (ires /= 0) then
    print*, 'Failed to open file'
    return
  end if
  do
    height = height + 1
    read (1, *, iostat=ires) triangle(height,1:height)
    if (ires /= 0) then
      height = height - 1
      exit
    end if
  end do
  close (1)

  ! Compute cost

  print*, 'Shortest path'
  print*, cost(1,1)

contains

  recursive integer function cost(i,j) result(mincost)
    integer i, j
    if (i == height) then
      mincost = triangle(i,j)
      return
    end if
    mincost = triangle(i,j) + min(cost(i+1,j),cost(i+1,j+1))
  end function cost
  
end program triangle_brute_force
