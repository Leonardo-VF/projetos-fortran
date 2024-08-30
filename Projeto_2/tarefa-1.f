      program tarefa_1
      implicit none 
      integer N, i
      real*8 x, x1, x2, x3, x4

      write(*,*)"Insira um número grande de interações"
      read(*,*)N

      open(unit = 1, file = "tarefa-1-saida-1.out")
      open(unit = 2, file = "tarefa-1-saida-2.out")
      open(unit = 3, file = "tarefa-1-saida-3.out")
      open(unit = 4, file = "tarefa-1-saida-4.out")
      
      x1 = 0
      x2 = 0
      x3 = 0
      x4 = 0
      
      do i = 0, N
          x = rand()
          x1 = x1 + x**1
          x2 = x2 + x**2
          x3 = x3 + x**3
          x4 = x4 + x**4

          write(1,*)x**1
          write(2,*)x**2
          write(3,*)x**3
          write(4,*)x**4
      end do

      write(*,*)x1/N
      write(*,*)x2/N
      write(*,*)x3/N
      write(*,*)x4/N
      
      close(unit = 1)
      close(unit = 2)
      close(unit = 3)
      close(unit = 4)
      end program