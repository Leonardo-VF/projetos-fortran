      program projeto1_4
      implicit none

      integer i,n,d,j,v

      write(*,*)"Insira um número"
      read(*,*)n

      open(unit=10, file="tarefa-4-saida-1.out")

      d = 0

      do i=1,n 
        do j=2,n
          if (i.EQ.j) then
            write(10,*)i
          end if
          
          if (mod(i,j).EQ.0) then
            exit
          end if
        end do
      end do 
      close(10)
      end program