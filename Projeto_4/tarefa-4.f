      program tarefa_4
      implicit none
      real*8 g, m, l, omega, teta, dt, PI, tFinal, a
      integer i, step

      open(unit = 10, file = "tarefa-4-saida-1.out")
      open(unit = 20, file = "tarefa-4-saida-2.out")
      open(unit = 30, file = "tarefa-4-saida-3.out")
      open(unit = 40, file = "tarefa-4-saida-4.out")
      
      PI = acos(-1.0d0)
      g = 9.8d0
      m = 1.0d0
      l = 1.0d0

      omega = 0.0d0
      teta = 0.0d0

      dt = 0.001d0
      tFinal = 50.0d0
      step = tFinal/dt
      a = 1.5d0

      do i = 0, step
          omega = omega + (-sin(teta) - 1.0d0/2.0d0*omega +
     &    a*sin(2.0d0/3.0d0*dt*i))*dt
          teta = teta + omega*dt
          
          if (teta.GT.PI) then
              teta = teta - 2.0d0*PI
          else if (teta.LT.-PI) then
              teta = teta + 2.0d0*PI
          end if

          write(10,*)dt*i, teta
          write(20,*)dt*i, omega
          write(30,*)dt*i, 1.0d0 - cos(teta) + 1.0d0/2.0d0*omega**2.0d0
          write(40,*)teta, omega
      end do
      end program