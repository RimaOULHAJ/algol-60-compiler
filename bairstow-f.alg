DEBUT
PROCEDURE BAIRSTOW(N,A,S0,P0,EPS1,EPS2,MAXITER,X,Y,DIVERG) ;
	  VALEUR N,A ; ENTIER N,MAXITER ; REEL S0,P0,EPS1,EPS2;
	  TABLEAU A,X,Y ; ETIQUETTE DIVERG ;
  COMMENTAIRE
	BAIRSTOW CALCULE LES RACINES DE P(X)=A(0)X**N+A(1)X**(N-1)+..A(N)
	POLYNOME DE DEGRE N.SES COEFFICIENTS,REELS,SONT RANGES DANS LE
	TABLEAU A.LE TEST D'ARRET POUR UN COUPLE DE RACINES EST
	ABS(S(K1)=-S(K))' INFER'EPSI'ET'ABS(P(K#1)-P(K))'INFER'EPS1.S1I
	APRES MAXITER ITERATIONS CE TEST N'A PAS JOUE,ON FAIT EPS1=
	1O*EPSL TANT QUE EPSL'INFEG'EPS2,
	EN CAS DE NON CONVERGENCE ON SORT A DIVERG (ETIQUETTE QUI DOIT
	FIGURER DANS LE PROGRAMME]SO ET PO SONT LES VALEURS INITIALES
	DE S ET P,ON LES CHOISIRA,DE PREFERENCE,DE FAIBLE MODULE.IL EST
	INUTLLE DE PRENDRE MAXITER 'SUPER'50,.POUR EPS1,0N PRENDRA LA PRE=-
	CISION DE LA MACHINE UTILISEE.LA SOLUTION EST RANGEE DANS LES
	TABLEAUX X ET Y QUI CONTIENNENT RESPECTIVEMENT LES PARTIES REELLE
	ET IMAGINAIRE ;

DEBUT TABLEAU B,C[-2:N] ;
      REEL R,T1,Y1,Y2,S,P,S1,P1, DELTA, DISCR,S2,P2,X1,X2 ;

      ENTIER I,K,NITER ;

      B[-2]:= B[-1]:=0 ;
      C[-2]:= C[-1]:=0 ;
      T1 := EPS1;
     SI N=0 ALORS ALLERA BOUT ;
     SI N=1 ALORS DEBUT B[0]:=A[0]; B[1]:=A[1];
                  ALLERA DERZERO;
		  FIN ;

TESTO : I:=N+1 ;
      POUR I:= I-11 TANTQUE A[1]=0 ET I > 1 FAIRE
      DEBUT X[I]:=0 ;Y[I]:=0; N:=N-1 ;
      FIN ;

DEGTEST: SI N > 2 ALORS ALLERA BOUCLE ;
	 S2:=-A[1]/A[0] ;
	 P2:= A[2]/A[0] ;
	ALLERA ETIQ2 ;
	S:=S0 ;P:=P0;
BOUCLE : EPS1 :=T1 ; NITER :=0 ;
       SI A[N-2]=0 ALORS DEBUT
       SI (ABS(S)+ABS(P)=0) ALORS DEBUT
       S:=0.1 ; P:=0.2 ; FIN FIN ;
    ITER : NITER :=NITER+1 ;

        SI NITER > MAXITER ALORS DEBUT
	 EPS1:=10*EPS1 ;
	SI EPS1 > EPS2 ALORS
	ALLERA DIVERG ;
	  NITER :=1 FIN ;
	POUR I:=0 PAS 1 JUSQUA N FAIRE
	DEBUT B[I]:=A[I]+S*B[I-1]-P*B[I-2] ;
	      C[I] :=B[I]+S*C[I-1]-P*C[I-2] ;

	FIN ;
	
	C[N-1]:=C[N-1]-B[N-1] ;
	S1:=B[N] *C[N-3]-B[N-1]*C[N-2] ;

	P1:=B[N]*C[N-2]-B[N-1]*C[N-1] ;      
	DELTA := C[N-2] *C[N-2]-C[N-1]*C[N-3] ;
	S2 := S+S1/DELTA ;
	P2 := P+P1/DELTA ;
     SI (ABS(S2-S) < EPS1 ET ABS(P2-P) < EPS1) ALORS
     ALLERA ETIQ2 ;
       S:=S2 ; P:=P2 ;
     ALLERA ITER ;
     
ETIQ2 : DISCR :=S2*S2/4-P2 ;
        SI DISCR > 0 ALORS ALLERA SOLREEL ;
	SI DISCR = 0 ALORS DEBUT R:=S2/2 ;
	 X1:=X2:=R ; Y1:=Y2:=0 ;
	ALLERA SORTIE FIN
COMPLEX :X1:=2:=82/2 3;
	 Y1:=RAC2(-DISCR) ; Y2:=-Y1 ;
ALLERA SORTIE ;
SOLREEL :X1:=S2/2+SIGNE(S2)*RAC2(DISCR) ;
	 X2:=P2/X1;
	 Y1 :=0; Y2 :=0 ;
SORTIE : X[N]:=X1; Y[N] :=Y1 ;
       	 X[N-1]:=X2 ; Y[N-1]:=Y2;
	 N:=N-2 ;

	SI N=1 ALORS ALLERA DERZERO ;
	SI N=0 ALORS ALLERA BOUT ;
SUITE : POUR K:=0 PAS 1 JUSQUA N FAIRE
         A[K]:=B[K] ;_
	 ALLERA DEGTEST ;
DERZERO : X1:=B[1]/B[0] ;
          X[N]:=X1 ;Y[N]:= 0;
BOUT: FIN BAIRSTOW ;



DEBUT


ENTIER I,N,MAXITER; REEL S0,P0,EPS1,EPS2 ;
       COMMENTAIRE LIRE(N,MAXITER,S0,P0,EPS1,EPS2) ;
       N:=4;
       MAXITER:=50;
       S0:=0.0; P0:=0.0; EPS1:=0.000001; EPS2:=0.0; outstring(1,"\n");
     
DEBUT TABLEAU X,Y[1: N], A[0:N] ;
      COMMENTAIRE POUR I := 0 PAS 1 JUSQUA N FAIRE A[I]:=1.0 ;
      A[0]:=-2.; A[1]:=2; A[2]:=1; A[3]:=-2; A[4]:=1; 
      POUR I := 0 PAS 1 JUSQUA N FAIRE outreal(1,A[I]);

      COMMENTAIRE POUR I := 0 PAS 1 JUSQUA N FAIRE LIRE(A[I]) ;
      BAIRSTOW(N,A,S0,P0,EPS1,EPS2,MAXITER,X,Y,DIVERG);
      outstring(1,"\n");
      COMMENTAIRE POUR I := 1 PAS 1 JUSQUA N FAIRE ECRIRE(I,X[I],Y[I]) ;
       POUR I := 1 PAS 1 JUSQUA N FAIRE
          outreal(1,X[I]);
       outstring(1,"\n");
       POUR I := 1 PAS 1 JUSQUA N FAIRE
          outreal(1,Y[I]);
      outstring(1,"\n");
      ALLERA FINPROG ;
DIVERG : N :=0;
outstring(1, " DIVERGENCE BAIRSTOW");
FINPROG : FIN FIN ;
FIN;
