      program tarefa8
      implicit none

      integer d, i
      real*8 PI, R, gamma

      PI = acos(-1.0e0)

      write(*,*)"Insira o raio esfera"
      read(*,*)R

      write(*,*)"Insira a dimensão"
      read(*,*)i
      
      open(unit=10, file="tarefa-8a-saida-1.out")

      do d=0,i
        write(10,*)(PI**(d/2.0e0)/gamma(1.0e0+real(d/2.0e0)))*R**d, d
      end do
      end program