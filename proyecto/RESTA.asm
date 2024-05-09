;Programa Tar04 

;Proposito: Resta de dos numeros desempacados 

;Elaborado por: Robles Rios Jacquelin 

 

        TITLE       RESTA 

        .MODEL      SMALL 

        .STACK 

         

        .DATA 

N1      DB          5H,2H,1H 

N2      DB          4H,8H,4H 

RES     DB          0H,0H,0H 

MSG     DB          'RESULTADO: $' 

 

        .CODE 

MAIN    PROC        FAR 

        .STARTUP 

         

        ;resta 

        MOV         AL, N1+2 

        SUB         AL, N2+2 

        AAS 

        MOV         RES+2, AL 

         

        ;restar con prestamo 

        MOV         AL, N1+1 

        SBB         AL, N2+1         

        AAS 

        MOV         RES+1, AL 

 

        MOV         AL, N1 

        SBB         AL, N2 

        AAS 

        MOV         RES, AL 

         

        ;digito por digito imprime 

        MOV         BX, 0001H 

        MOV         AH, 09H 

        LEA         DX, MSG 

        INT         21H 

         

        MOV         AH, 02H 

        MOV         DL, RES 

        ADD         DL, 30H 

        INT         21H 

         

        MOV         DL, RES+1 

        ADD         DL, 30H 

        INT         21H 

         

        MOV         AH, 02H 

        MOV         DL, RES+2 

        ADD         DL, 30H 

        INT         21H 

        .EXIT 

 

MAIN    ENDP 

END 

 