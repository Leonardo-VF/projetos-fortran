      program tarefa_1
      implicit none
      
      real*8 x, h, f, f_2f, f_2t, f_5p, f_5m, d_1, d_2, d_3
      
      open(unit = 10, file = 'tarefa-1-saida-1.out')

      h = 0.1e0

      x = 1.0e0/2.0e0
      
      d_1 = 9.79678201384
      d_2 = 64.09832454947
      d_3 = 671.51461345787

      do while (h.GT.1.0e-8)
          call func (f, x)
          call func (f_2f, x + h)
          call func (f_2t, x - h)
          call func (f_5p, x + 2*h)
          call func (f_5m, x - 2*h)
  
          write(10,*)h, d_1-(f_2f - f)/h, d_1-(f - f_2t)/h + h**2,
     &    d_1-(f_2f - f_2t)/(2*h) + (h**2)**2,
     &    d_1-(f_5m - 8*f_2t + 8*f_2f - f_5p)/(12*h) + (h**4)**2,
     &    d_2-(f_2f - 2*f + f_2t)/(h**2) + (h**2)**2,
     &    d_2-((-f_5m + 16*f_2t-30*f+16*f_2f-f_5p)/(12*h**2)+(h**4)**2),
     &    d_3-((-f_5m + 2*f_2t - 2*f_2f + f_5p)/(2*h**3) + (h**2)**2)

          h = h/10.0e0
      end do

      end program

      subroutine func (f, x)
          implicit none
          real*8 f, x
          f = exp((x)/2)*tan(2*(x))
          return
      end