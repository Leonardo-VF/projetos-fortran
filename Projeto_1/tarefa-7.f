      program tarefa7
      implicit none

      integer k, d, m, i, j
      real*8 PI, V, l, R

      PI = acos(-1.0e0)

      write(*,*)"Insira quantas dimensões"
      read(*,*)d

      write(*,*)"Insira a quantidade de interações"
      read(*,*)m

      l = 0.0e0
      V = 0.0e0
      R = 1.0e0

      do i=1,m
        do j=1,d
            l = l+rand()**2.0e0
        end do

        if (sqrt(l).LT.1 .OR. sqrt(l).EQ.1) then
            V = V+1.0e0
        end if
            l=0.0e0
      end do 
    
      write(*,*)((2.0e0*R)**d*(V*1.0e0/m*1.0e0))
      end program