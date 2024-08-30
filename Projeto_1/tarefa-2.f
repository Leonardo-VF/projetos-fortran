      program tarefa2
      implicit none 

      real*8 v1(3), v2(3), x, y, z, A

      write(*,*)"Insira os vetores"
      read(*,*) v1, v2
      
      x = v1(2)*v2(3) - v2(2)*v1(3)
      y = v1(3)*v2(1) - v1(1)*v2(3)
      z = v1(1)*v2(2) - v1(2)*v2(1)

      A = sqrt(x**2 + y**2 + z**2)/2

      write(*,*)"A área do triângulo é:",A
      end program 