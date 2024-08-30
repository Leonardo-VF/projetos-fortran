      program tarefa_2
      implicit none

      real*8 p, sum, sum2
      integer x, m, n, i, j

      open(unit = 10, file = "tarefa-2-saida-1.out")
      
      !utilizado 1000000
      write(*,*)"Insira o número de andarilhos"
      read(*,*)m

      !utilizado 1000
      write(*,*)"Insira o número de passos"
      read(*,*)n

      !probabilidades
      p = 1.0/2.0
      !p = 1.0/3.0
      !p = 1.0/4.0
      !p = 1.0/5.0

      !calcular as médias
      sum = 0

      do i = 1,m
          x = 0
          do j = 1, n
              x = x + 2*(int(rand() + p))-1
          end do
          sum = sum + x
          sum2 = sum2 + x**2
          write(10,*) i, x
      end do

      write(*,*)sum/m
      write(*,*)sum2/m

      close(unit = 10)
      
      end program