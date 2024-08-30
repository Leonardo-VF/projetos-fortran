      program tarefa_3
      implicit none
      real*8 g, m, l, omega, teta, dt, PI, tFinal
      integer i, step

      open(unit = 10, file = "tarefa-3-saida-1.out")
      
      PI = acos(-1.0d0)
      g = 9.8d0
      m = 1.0d0
      l = 1.0d0

      omega = 0.0d0
      teta = PI/25.0d0

      dt = 0.01d0
      tFinal = 10.0d0
      step = tFinal/dt

      do i = 0, step
          omega = omega + (-sin(teta) - 1.0d0/2.0d0*omega)*dt*sqrt(g/l)
          teta = teta + omega*dt*sqrt(g/l)

          write(10,*)dt*i, teta
      end do
      end program