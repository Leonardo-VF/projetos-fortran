      program tarefa_3
      implicit none

      integer m, n, p, i, a, pos(2), add(0:3)

      !vetores de posição para somar ao total
      add(0) = (1, 0) 
      add(1) = (-1, 0) 
      add(2) = (0, 1) 
      add(3) = (0, -1) 

      open(unit = 10, file = "tarefa-3-saida-6.out")

      write(*,*)"Insira o número de passos"
      read(*,*)m
      
      do n = 1, 1000000
          pos = (0,0)
          do p = 1, m
              do i = 1,2
                  pos(i) = pos(i) + add(int(rand()*4))
              end do
          end do
          write(10,*) n, pos
      end do
      
      close(unit = 10)
      end program