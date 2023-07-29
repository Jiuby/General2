program convex_hull

implicit none

integer :: n, i, j, k
real :: x(100), y(100)

read *, n

do i = 1, n
    read *, x(i), y(i)
end do

k = 1

do i = 1, n
    if (y(i) .gt. y(k)) then
        k = i
    end if
end do

j = k

do i = 1, n
    if (i .ne. k) then
        do while (j .gt. 1 .and. cross(x(j-1)-x(j), y(j-1)-y(j)) .lt. 0) then
            j = j - 1
        end do
        if (j .eq. 1) then
            j = 2
        end if
        if (i .eq. n) then
            print *, j
        end if
    end if
end do

end program
