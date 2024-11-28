! Run with `gfortran solution.f90 -o solution && ./solution`
! I can't believe that I will be accepting a job working with this god-forsaken language in a couple months.
! Death would be a mercy.


integer function reverse(n)
    implicit none
    integer, intent(in) :: n
    integer :: n_working

    reverse = 0
    n_working = n
    do while (n_working > 0)
        reverse = reverse * 10 + mod(n_working, 10)
        n_working = n_working / 10
    end do
end function reverse


program main
    ! We are seeking the largest palindrome that is the product of two three digit numbers
    ! Brute-forcing this without any clever assumptions incurs 1M checks.

    integer :: a, b, ab
    integer :: largest_palindrome

    integer :: reverse

    do a = 100, 999
        do b = 100, a
            ab = a * b
            if (reverse(ab) == ab .and. ab > largest_palindrome) then
                largest_palindrome = ab
            end if
        end do
    end do
    print *, "Largest palindrome: ", largest_palindrome
end program main