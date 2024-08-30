      program tarefa9
      implicit none

      integer d
      real*8 PI, R, gamma, Vc

      PI = acos(-1.0e0)

      write(*,*)"Insira o raio esfera"
      read(*,*)R
      
      open(unit=10, file="tarefa-9-saida-1.out")

      Vc = 1.0e0

      do d=0,25
        write(10,*)Vc/(PI**(d/2.0e0)/gamma(1.0e0+real(d/2.0e0)))*R**d, d
      end do
      end program