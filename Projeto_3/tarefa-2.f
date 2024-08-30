      program tarefa_2
      implicit none
      
      real*8 I_s, I_t, I_b, h, a, b, c, f, f_a, f_b, resp
      integer j, rep, i

      open(unit = 10, file = "tarefa-2-saida-1.out")
      
      resp = 0.015616236904490

      do j = 2,12
          rep = 0
          a = 0.0d0
          b = 1.0d0
          call func(f_a, a)
          call func(f_b, b)
          I_t = 1.0d0/2.0d0 * (f_a +  f_b)
          I_s = f_a + f_b
          I_b = 0.0d0
          h = 1.0d0/(3.0d0*(2.0d0**j))

          do while (a.LE.b)
              a = a + h
              
              call func(f, a)

              I_t = I_t + f

              if (mod(rep, 2).EQ.0) then
                  I_s = I_s + 2.0d0*f
              else
                  I_s = I_s + 4.0d0*f
              end if

              rep = rep + 1
          end do
          
          a = 0.0d0
          b = 1.0d0

          do while (a.LE.b)
              do i = 0,4
                  call func(f, a+i*h)
                  
                  if (i.EQ.0 .OR. i.EQ.4) then
                      I_b = I_b + 7.0d0*f
                  else if (i.EQ.2) then
                      I_b = I_b + 12.0d0*f
                  else if (i.EQ.1 .OR. i.EQ.3) then
                      I_b = I_b + 32.0d0*f
                  end if
              end do
              a = a + 4.0d0*h
          end do

          write(10,*)resp-h*I_t, resp-(h/3.0d0)*I_s, 
     &    resp - (2.0d0*h/45.0d0)*I_b
      end do
      end program
    

      subroutine func (f, x)
          implicit none
          real*8 f, x, PI
  
          PI = acos(-1.0d0)
  
          f = exp(-x) * cos(2.0d0*PI*x)
          return
      end