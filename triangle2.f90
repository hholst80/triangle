program triangle_dynamic_programming
  implicit none
  integer       height, max_height, ires
  parameter   ( max_height = 100 )
  integer       triangle(max_height,max_height)
  integer       memory(max_height,max_height)
  character*256 filename

  print*, '*************************************************************'
  print*, '* Dynamic programming (memory function) using memorization. *'
  print*, '* https://en.wikipedia.org/wiki/Dynamic_programming         *'
  print*, '*************************************************************'
  print*,

  height = 0
  triangle(:,:) = 0
  memory(:,:) = 0

  ! Read data

  do
    height = height + 1
    read (*, *, iostat=ires) triangle(height,1:height)
    if (ires /= 0) then
      height = height - 1
      exit
    end if
  end do

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
    if (memory(i,j) > 0) then
      mincost = memory(i,j)
      return
    end if
    mincost = triangle(i,j) + min(cost(i+1,j),cost(i+1,j+1))
    memory(i,j) = mincost
  end function cost
  
end program triangle_dynamic_programming
