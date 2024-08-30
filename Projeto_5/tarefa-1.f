      program tarefa_1
      implicit none

      real*8 vx, vy, v, px, py, p, t, dt, PI, UA(8), del
      real*8 verx, very, oldx, oldy, aux1, aux2, pver, vvx, vvy, vver
      integer i

      open(unit = 10, file = "tarefa-1-saida-1.out")
      open(unit = 20, file = "tarefa-1-saida-2.out")
      open(unit = 30, file = "tarefa-1-saida-3.out")
      open(unit = 40, file = "tarefa-1-saida-4.out")
      open(unit = 50, file = "tarefa-1-saida-5.out")
      open(unit = 60, file = "tarefa-1-saida-6.out")
      open(unit = 70, file = "tarefa-1-saida-7.out")
      open(unit = 80, file = "tarefa-1-saida-8.out")

      PI = acos(-1.0d0)

      UA(1) = 0.39d0
      UA(2) = 0.72d0
      UA(3) = 1.0d0
      UA(4) = 1.52d0
      UA(5) = 5.20d0
      UA(6) = 9.58d0
      UA(7) = 19.2d0
      UA(8) = 30.1d0


      do i = 1,8
          vx = 0.0d0
          vy = sqrt(1.0d0/UA(i))
          px = UA(i)
          py = 0.0d0
          t = 0.0d0
          dt = 0.05d0/(2.0d0*PI)
          p = sqrt(px**2.0d0 + py**2.0d0)
      
          oldx = UA(i)
          oldy = 0.0d0
          vvx = vx
          vvy = vy
          vver = sqrt(vvx**2.0d0 + vvy**2.0d0)
          verx = oldx + vvx*dt
          very = oldy + vvy*dt
          pver = sqrt(verx**2.0d0 + very**2.0d0)
      
          do while (t.LT.30.0d0)
              vx = vx - px/(p**3.0d0) * dt
              vy = vy - py/(p**3.0d0) * dt
              px = px + vx * dt
              py = py + vy * dt
      
              aux1 = verx
              aux2 = very
              
              verx = 2.0d0*verx - oldx - verx/(pver**3.0d0) * dt**2.0d0
              very = 2.0d0*very - oldy - very/(pver**3.0d0) * dt**2.0d0
              vvx = vvx - verx/(pver**3.0d0) * dt
              vvy = vvy - very/(pver**3.0d0) * dt
      
              oldx = aux1
              oldy = aux2
      
              pver = sqrt(verx**2.0d0 + very**2.0d0)
              p = sqrt(px**2.0d0 + py**2.0d0)
      
              t = t + dt
      
              v = sqrt(vx**2.0d0 + vy**2.0d0)
              vver = sqrt(vvx**2.0d0 + vvy**2.0d0)

              write(i*10,*)t, px, py, p, v, oldx, oldy, pver, vver
          end do
      end do
      end program