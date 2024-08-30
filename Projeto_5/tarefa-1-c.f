      program tarefa_1
      implicit none

      real*8 vx, vy, v, px, py, p, t, dt, PI, UA(8)
      real*8 verx, very, oldx, oldy, aux1, aux2, pver
      real*8 del, vdel, max, min, vmax, vmin
      integer i

      open(unit = 10, file = "tarefa-1-saida-9.out")

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
          dt = 0.5d0/(2.0d0*PI)
          p = sqrt(px**2.0d0 + py**2.0d0)
          max = p
          min = p
          del = 3.0d0
      
          oldx = UA(i)
          oldy = 0.0d0
          verx = oldx + vx*dt
          very = oldy + vy*dt
          pver = sqrt(verx**2.0d0 + very**2.0d0)
          vmax = pver
          vmin = pver
          vdel = 3.0d0
      
          do while (del.GT.10.0d-3)
              vx = vx - px/(p**3.0d0) * dt
              vy = vy - py/(p**3.0d0) * dt
              px = px + vx * dt
              py = py + vy * dt
      
              aux1 = verx
              aux2 = very
              
              verx = 2.0d0*verx - oldx - verx/(pver**3.0d0) * dt**2.0d0
              very = 2.0d0*very - oldy - very/(pver**3.0d0) * dt**2.0d0
      
              oldx = aux1
              oldy = aux2
      
              pver = sqrt(verx**2.0d0 + very**2.0d0)
              p = sqrt(px**2.0d0 + py**2.0d0)
      
              t = t + dt
      
              v = sqrt(vx**2.0d0 + vy**2.0d0)

              if (p.GT.max) then
                  max = p
              else if (p.LT.min) then
                  min = p
              end if  

              if (pver.GT.vmax) then
                  vmax = pver
              else if (pver.LT.vmin) then
                  vmin = pver
              end if
              
              del = max/min - 1.0d0
              vdel = vmax/vmin - 1.0d0

              write(*,*)t, del, p, max, min
          end do
          
          write(*,*)t, vdel
      end do
      end program