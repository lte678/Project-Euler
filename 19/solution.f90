! Run with `gfortran solution.f90 -o solution && ./solution`

program main
    ! We are seeking the number of sundays that fell on the first of the month between
    ! 1. Jan 1901 and 31. Dec 2000
    integer :: day = 1
    integer :: month = 1
    integer :: year = 1901
    integer :: weekday = 2  ! Mo := 1, Su := 7
    integer :: sunday_count = 0
    logical :: leap_year

    do while (.not. (day == 1 .and. month == 1 .and. year == 2001))
        if (weekday == 7 .and. day == 1) then
            sunday_count = sunday_count + 1
        end if

        leap_year = (mod(year, 4) == 0 .and. .not. mod(year, 100) == 0) .or. mod(year, 400) == 0
        if ((month == 9 .or. month == 4 .or. month == 6 .or. month == 11) .and. day == 30) then
            day = 1
            month = month + 1
        else if (month == 2 .and. ((day == 28 .and. .not. leap_year) .or. (day == 29 .and. leap_year))) then
            day = 1
            month = month + 1
        else if (month == 12 .and. day == 31) then
            day = 1
            month = 1
            year = year + 1
        else if (day == 31) then
            day = 1
            month = month + 1
        else
            day = day + 1
        end if

        weekday = weekday + 1
        if (weekday == 8) then
            weekday = 1
        end if
    end do
    print *, "The the number of Sundays is ", sunday_count
end program main