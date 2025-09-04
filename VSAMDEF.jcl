//JCLVSAM  JOB (ACCOUNT),'DEFINE VSAM',NOTIFY=&SYSUID, 
//          MSGCLASS=Q,CLASS=A,MSGLEVEL=(1,1),REGION=0M,TIME=(0,7) 
//**************************************************************** 
//* BORRADO Y CREACION FICHERO VSAM 
//**************************************************************** 
//DEFVSAM  EXEC PGM=IDCAMS 
//SYSPRINT DD SYSOUT=* 
//SYSIN    DD * 
  DEL FELIX.CURSO.SALID             - 
  CLUSTER 
  SET MAXCC = 0 
  DEFINE CLUSTER(                   - 
         NAME(FELIX.CURSO.SALID)    - 
         INDEXED                    - 
         UNIQUE                     - 
         VOL(ZVOL00)                - 
         TRACKS(15 15)              - 
         RECSZ(80 80)               - 
         CISZ(27972)                - 
         KEY(6 0)                   - 
         SHR(2 3)                   - 
         FSPC(15 15)                - 
         ) 
/* 
