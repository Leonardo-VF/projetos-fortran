      program tarefa_4c
      implicit none
      real*8 g, m, l, omega, teta, dt, PI, tFinal, a, t
      integer i, step

      open(unit = 10, file = "tarefa-4-saida-5.out")
      
      PI = dacos(-1.0d0)
      g = 9.8d0
      m = 1.0d0
      l = 1.0d0

      omega = 0.0d0
      teta = 0.0d0

      dt = 0.001d0
      tFinal = 50.0d0*2.0d0*PI
      step = tFinal/dt
      a = 1.5d0
      t = 2.0d0*PI/(2.0d0/3.0d0)

      do i = 0, 1000000000
          omega = omega + (-dsin(teta) - 1.0d0/2.0d0*omega +
     &    a*dsin(2.0d0/3.0d0*dt*i))*dt
          teta = teta + omega*dt
          
          if (teta.GT.PI) then
              teta = teta - 2.0d0*PI
          else if (teta.LT.-PI) then
              teta = teta + 2.0d0*PI
          end if

          if ((mod(dt*i, t).LT.0.001d0) .AND. (i.GT.10000)) then
                write(10,*)teta, omega
          end if
      end do
      end program