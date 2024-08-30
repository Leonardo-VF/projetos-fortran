      program tarefa_3
      implicit none
      real*8 x, f_1, f_2, f_3, tol, a, b, c, x_n, x_m1
      integer num, i, j
      
      open(unit = 10, file = "tarefa-3-saida-1.out")
      open(unit = 20, file = "tarefa-3-saida-2.out")
      open(unit = 30, file = "tarefa-3-saida-3.out")

      tol = 10.0e-6
      x = -10.0d0

      do while (x.LE.10.e0)
          call func(x, f_1)
          call func(x+0.1d0, f_2)

          if (f_1*f_2.LT.0.0d0) then
              write(*,*)x, x+0.1d0
          end if

          x = x + 0.1d0
      end do
      
      do i = 1,3
          write(*,*)"Insira os intervalos"
          read(*,*)a
          read(*,*)b

          c = (a + b)/2.0d0
      
          call func(c, f_3)

          do while (abs(f_3).GT.tol .OR. (b - a).GT.tol)
              c = (a + b)/2.0d0
      
              call func(a, f_1)
              call func(b, f_2)
              call func(c, f_3)

              if (f_1 * f_3.LT.0.0d0) then
                  b = c
              else
                  a = c
              endif

              write(10,*)c
          end do
      end do
      
      do j = -10, 10
          x_n = j

          call func(x_n, f_1)
          call dev_func(x_n, f_2)

          x = x_n - f_1/f_2

          if (abs(x_n - x).LT.tol) then
              write(20,*)"Valor real:", x
          else
              write(20,*)x
          end if
      end do

      do j = -10, 10
          x_n = j
          x_m1 = x_n - 1.0d0
          call func(x_n, f_1)
          call func(x_m1, f_2)

          x = x_n - f_1*(x_n - x_m1)/(f_1 - f_2)

          if (abs(x_n - x).LT.tol) then
              write(30,*)"Valor real:", x
          else
              write(30,*)x
          end if
      end do

      end program

      subroutine func(x, f)
      implicit none
      real*8 x, f
    
      f = x**3 -4*x**2 - 59*x + 126
      return
      end

      subroutine dev_func(x, f)
      implicit none
      real*8 x, f
    
      f = 3*x**2 -8*x - 59
      return
      end