       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRA01.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ENTRADA ASSIGN TO ENTRADA
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS ENTRADA-ST.

           SELECT SALIDA ASSIGN TO SALIDA
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS SALIDA-ID
           FILE STATUS IS SALIDA-ST.

       DATA DIVISION.
       FILE SECTION.
       FD ENTRADA BLOCK CONTAINS 0 RECORDS
           RECORDING MODE IS F
           DATA RECORD IS ENTRADA-REG.
       01 ENTRADA-REG.
          05 ENTRADA-ID PIC 9(6).
          05 ENTRADA-DESC PIC X(35).
          05 ENTRADA-PRECIO PIC 9(4)V9(2).
          05 ENTRADA-STOCK PIC 9(6).
          05 ENTRADA-CADUCIDAD PIC X(8).
          05 ENTRADA-CRITICO PIC 9(6).
          05 FILLER PIC X(13).

       FD SALIDA
           DATA RECORD IS SALIDA-REG.
       01 SALIDA-REG.
          05 SALIDA-ID PIC X(6).
          05 SALIDA-CONTROL PIC 9(2).
          05 SALIDA-DESC PIC X(35).
          05 SALIDA-PRECIO PIC 9(4)V9(2).
          05 SALIDA-STOCK PIC 9(6).
          05 SALIDA-CADUCIDAD PIC X(8).
          05 SALIDA-CRITICO PIC 9(6).
          05 FILLER PIC X(11).

       WORKING-STORAGE SECTION.
       01 FICHEROS.
          05 ENTRADA-ST PIC 9(2).
          05 SALIDA-ST PIC 9(2).
          05 FIN-FICHERO PIC 9(2) VALUE 10.
       01 D-CONTROL.
          05 NUMERO PIC 9(6).
          05 DIGITO PIC 9.
          05 I PIC 9.
          05 SUMA PIC 9(2).
          05 MODULUS PIC 9(2).
          05 DIG-CONTROL PIC 9(2).

       LINKAGE SECTION.

       PROCEDURE DIVISION.

           OPEN INPUT ENTRADA.
           OPEN OUTPUT SALIDA.

           PERFORM UNTIL ENTRADA-ST = FIN-FICHERO
              INITIALIZE ENTRADA-REG
              READ ENTRADA NEXT RECORD
                   AT END
                      CONTINUE
                   NOT AT END
                      PERFORM CAL-DIG-CONTROL
                      DISPLAY ENTRADA-REG DIG-CONTROL

                      MOVE ENTRADA-ID TO SALIDA-ID
                      MOVE DIG-CONTROL TO SALIDA-CONTROL
                      MOVE ENTRADA-DESC TO SALIDA-DESC
                      MOVE ENTRADA-PRECIO TO SALIDA-PRECIO
                      MOVE ENTRADA-STOCK TO SALIDA-STOCK
                      MOVE ENTRADA-CADUCIDAD TO SALIDA-CADUCIDAD
                      MOVE ENTRADA-CRITICO TO SALIDA-CRITICO

                      WRITE SALIDA-REG
              END-READ
           END-PERFORM.

           CLOSE ENTRADA.
           CLOSE SALIDA.

           STOP RUN.

      *-------------------------------------------------------------
      * DIGITO CONTROL BASE 10
      *-------------------------------------------------------------
       CAL-DIG-CONTROL.
           MOVE ENTRADA-ID TO NUMERO.
           MOVE 0 TO SUMA.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 6
                 MOVE NUMERO(I:1) TO DIGITO
                 ADD DIGITO TO SUMA
           END-PERFORM.
           DIVIDE SUMA BY 10 GIVING DIG-CONTROL REMAINDER MODULUS.
           COMPUTE DIG-CONTROL = 10 - MODULUS.
      *-------------------------------------------------------------

       END PROGRAM PROGRA01.
