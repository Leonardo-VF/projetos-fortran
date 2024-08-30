      program tarefa_4
      implicit none

      integer i, n, j, o, p ,x , miny, minz, a, passos, local(2)
      integer pos(1000, 1000), y(1000000), z(1000000), add(0:3)
      real*8 aux, s, prob
      
      open(unit = 10, file = "tarefa-4-saida-1.out")

      add(0) = (1, 0) 
      add(1) = (-1, 0) 
      add(2) = (0, 1) 
      add(3) = (0, -1) 

      
      do passos = 1, 5000
            do n = 1, 10000
                  local = (0,0)
                  do p = 1, passos
                        do i = 1,2
                              local(i) = local(i) + add(int(rand()*4))
                        end do
                  end do
                  y(n) = local(1)
                  z(n) = local(2)
            end do

            pos = 0
            miny = abs(minval(y))
            minz = abs(minval(z))

            do i = 1,1000
                  o = int((y(i) + miny)/10)
                  p = int((z(i) + minz)/10)
                  pos(o, p) = pos(o, p) + 1.0e0
            end do
            
            s = 0.0e0

            do i = 1, 1000
                  do j = 1, 1000
                        if (pos(i,j).NE.0) then
                              aux = pos(i,j)
                              prob = aux/1000000.e0
                              s = s - (prob * log(prob))
                        end if
                  end do
            end do

            write(10,*)passos, s
      end do
      close(10)
      end program