      program tarefa_1
      implicit none
      real*8 g, m, l, omega_0, teta_0
      real*8 omega, teta, dt, PI, tFinal, tau, x
      integer step
      
      open(unit = 10, file = "tarefa-2-saida-1.out")

      PI = dacos(-1.0d0)
      g = 9.8d0
      m = 1.0d0
      l = 1.0d0

      dt = 0.01d0
      tFinal = 4.0d0
      step = tFinal/dt
      x = 1.0d0
      
      do while(x.LT.15)
             tau = 0.0d0
             teta_0 = PI/(x*2.0d0)
             omega = omega_0
             teta = teta_0

             do while(teta.GT.0.0d0)
                 omega = omega - sin(teta)*dt
                 teta = teta + omega*dt
                 
                 tau = tau + dt
             end do

             tau = 4.0d0*tau
             x = x + 0.01d0

             write(10,*)teta_0, tau
      end do 
      end program