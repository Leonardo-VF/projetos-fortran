      program tarefa1
      implicit none
      real*8 a, b, c, d, x1, x2, ai1, ai2, bi1, bi2
      complex i1, i2

      write(*,*)"Insira os valores dos coeficientes"
      read(*,*)a,b,c

      d = b**2 - (4*a*c)

      if (d .GT. 0) then
            x1 = (-b + sqrt(d))/(2*a)
            x2 = (-b - sqrt(d))/(2*a)
            write(*,*)"Os valores de x são:",x1, x2

      else if (d .EQ. 0) then
            x1 = -b/(2*a)
            write(*,*)"O valor de x é:",x1
      
      else
            ai1 = (-b)/(2*a)
            bi1 = sqrt(abs(d))/(2*a)
            ai2 = (-b)/(2*a)
            bi2 = - sqrt(abs(d))/(2*a)
            write(*,*)"Os coeficientes complexos dos valores de x são"
            write(*,*)complex(ai1, bi1), complex(ai2, bi2)
      endif
      end program
