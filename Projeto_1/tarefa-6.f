      program tarefa6
      implicit none

      real*8 PI, a, b
      integer n, i

      PI = acos(-1e0)

      write(*,*)"Insira o número de raizes"
      read(*,*)n
      
      do i = 1,n
         a = (3e0**(1e0/n))*cos((2e0*PI*i)/n)+2e0
         b = (3e0**(1e0/n))*sin((2e0*PI*i)/n)
         write(*,1)i,complex(a,b)
1        format("Z"i0,":"sp,f8.5," "sp,f8.5,"i")
      end do 
      end program