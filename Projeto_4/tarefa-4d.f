      program tarefa_3
      implicit none
      real*8 g, m, l, omega1, teta1, omega2, teta2, dt, PI, tFinal
      real*8 a, y, y2
      integer i, step

      open(unit = 10, file = "tarefa-4-saida-6.out")
      open(unit = 20, file = "tarefa-4-saida-7.out")
      open(unit = 30, file = "tarefa-4-saida-8.out")
      open(unit = 40, file = "tarefa-4-saida-9.out")

      PI = acos(-1.0d0)
      g = 9.8d0
      m = 1.0d0
      l = 1.0d0

      omega1 = 0.0d0
      teta1 = 0.0d0
      omega2 = 10.0d-5
      teta2 = 0.0d0

      dt = 0.001d0
      tFinal = 20.0d0
      step = tFinal/dt
      y = 0.0d0
      y2 = 0.0d0
      a = 1.5d0

      do i = 0, step
          omega1 = omega1 + (-sin(teta1) - 1.0d0/2.0d0*omega1 +
     &    a*sin(2.0d0/3.0d0*dt*i))*dt
          teta1 = teta1 + omega1*dt

          omega2 = omega2 + (-sin(teta2) - 1.0d0/2.0d0*omega2 +
     &    a*sin(2.0d0/3.0d0*dt*i))*dt
          teta2 = teta2 + omega2*dt
          
          if (teta1.GT.PI) then
              teta1 = teta1 - 2.0d0*PI
          else if (teta1.LT.-PI) then
              teta1 = teta1 + 2.0d0*PI
          end if

          if (teta2.GT.PI) then
              teta2 = teta2 - 2.0d0*PI
          else if (teta2.LT.-PI) then
              teta2 = teta2 + 2.0d0*PI
          end if

          write(10,*)dt*i, abs(teta1-teta2)
          write(20,*)dt*i, abs(omega1-omega2)
          
          if (i.GT.5000) then
              y = y + log(abs(teta1-teta2))/(dt*i)
              y2 = y2 + log(abs(omega1-omega2))/(dt*i)
          end if
      end do

      write(30,*)y/(step-5000)
      write(40,*)y2/(step-5000)
      end program