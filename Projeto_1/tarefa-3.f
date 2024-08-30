      program tarefa3
      implicit none

      integer M, i, j, io, t
      real*8 min, vet(1000000)

      open(unit=10, file="tarefa-3-entrada-1.in")
      open(unit=20, file="tarefa-3-saida-1.out")

      t=0

      do i=1,1000000
        read(10,*,IOSTAT=io)vet(i)

        if (io < 0) then
            exit
        else
            t = t+1
        end if
      end do

      write(*,*)"O tamanho do arquivo é:", t

      write(*,*)"Insira o valor de M"
      read(*,*)M

      min = 0

      do i=1,M
        min = minval(vet(1:t))
        write(20,*)min

        do j=1,t
            if (vet(j).EQ.min) then
                  vet(j) = vet(j)+1000
            end if
        end do
      end do

      close(10)
      close(20)
      end program