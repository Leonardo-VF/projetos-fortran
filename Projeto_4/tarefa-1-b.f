      program tarefa_1
      implicit none
      real*8 g, m, l, omega_0, teta_0
      real*8 omega, teta, dt, PI, tFinal, E, o, t
      integer i, step

      open(unit = 10, file = "tarefa-1-saida-3.out")
      open(unit = 20, file = "tarefa-1-saida-4.out")
      open(unit = 30, file = "tarefa-1-saida-7.out")
      open(unit = 40, file = "tarefa-1-saida-8.out")
      
      PI = acos(-1.0d0)
      g = 9.8d0
      m = 1.0d0
      l = 1.0d0

      omega_0 = 0.0d0
      teta_0 = PI/100.0d0
      E = 0.0d0
      omega = omega_0
      teta = teta_0
      
      dt = 0.01d0
      tFinal = 10.0d0
      step = tFinal/dt

      do i = 0, step
          omega = omega - teta*dt*sqrt(g/l)
          teta = teta + omega*dt*sqrt(g/l)
          E = 1.0d0 - cos(teta) + 1.0d0/2.0d0*omega**2.0d0

          t = PI/25.0d0*cos(i*dt*sqrt(g/l))

          write(10,*)dt*i, teta
          write(20,*)dt*i, E
          write(30,*)dt*i, t
          write(40,*)dt*i, 1.0d0 - cos(PI/25.0d0)
      end do
      end program