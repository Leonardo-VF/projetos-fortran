      program tarefa5a
        implicit none

        real*4 x, n, ln, e

        write(*,*)"Insira o valor de x para calcular ln(x)"
        read(*,*)x
        
        e=1
        n=1
        ln=0

        do while (abs(e).gt.(10e-5))
            e = ((1-x)**n)/n
            ln = ln-e
            n = n+1
        end do 

        write(*,*)"Log calculado:",ln
        write(*,*)"Função log(x):",log(x)
        write(*,*)"A diferença entre os logs foi:", log(x)-ln
      end program