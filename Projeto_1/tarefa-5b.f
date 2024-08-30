      program tarefa5a
        implicit none

        real*8 x, n, ln, e

        write(*,*)"Insira o valor de x para calcular ln(x)"
        read(*,*)x
        
        e=1
        n=1
        ln=0

        do while (abs(e).GT.(10e-18))
            e = ((1-x)**n)/n
            ln = ln-e
            n = n+1
        end do 

        write(*,*)"O log calculado é:",ln
        write(*,*)"Função dlog(x):", dlog(x)
        write(*,*)"A difença entre os logs é", ln-dlog(x)
      end program