#define SEVSEG 320
#define ACCEL_BASE 128
#define RES_BASE 256

#define PRINT(i, j) *((int *)(i)) = (j)
#define STOR_TO_AI(i, j) *((int *)(ACCEL_BASE+i)) = (j)
#define GET_FROM_AI(i) PRINT(SEVSEG, *((int *)(RES_BASE + i)))
#define STOP while(1)


int main(){
	
	 *((int*)128) =  *((int*)0);
	 *((int*)132) =  *((int*)4);
	 *((int*)136) =  *((int*)8);
	 *((int*)140) =  *((int*)12);
	 *((int*)144) =  *((int*)16);
	 *((int*)148) =  *((int*)20);
	 *((int*)152) =  *((int*)24);
	 *((int*)156) =  *((int*)28);
	 *((int*)160) =  *((int*)32);
	 *((int*)164) =  *((int*)36);
	 *((int*)168) =  *((int*)40);
	 *((int*)172) =  *((int*)44);
	 *((int*)176) =  *((int*)48);
	 *((int*)180) =  *((int*)52);
	 *((int*)184) =  *((int*)56);
	 *((int*)188) =  *((int*)60);
	 *((int*)192) =  *((int*)64);
	 *((int*)196) =  *((int*)68);
	 *((int*)200) =  *((int*)72);
	 *((int*)204) =  *((int*)76);
	 *((int*)208) =  *((int*)80);
	 *((int*)212) =  *((int*)84);
	 *((int*)216) =  *((int*)88);
	 *((int*)220) =  *((int*)92);
	 *((int*)224) =  *((int*)96);
	 *((int*)228) =  *((int*)100);
	 *((int*)232) =  *((int*)104);
	 *((int*)236) =  *((int*)108);
	 *((int*)240) =  *((int*)112);
	 *((int*)244) =  *((int*)116);
	 *((int*)248) =  *((int*)120);
	 *((int*)252) =  *((int*)124);
	 
	 START:
	 
	 *((int*)320) = 256;
	 *((int*)320) =  *((int*)256);
	 *((int*)320) = 260;
	 *((int*)320) =  *((int*)260);
	 *((int*)320) = 264;
	 *((int*)320) =  *((int*)264);
	 *((int*)320) = 268;
	 *((int*)320) =  *((int*)268);
	 *((int*)320) = 272;
	 *((int*)320) =  *((int*)272);
	 *((int*)320) = 276;
	 *((int*)320) =  *((int*)276);
	 *((int*)320) = 280;
	 *((int*)320) =  *((int*)280);
	 *((int*)320) = 284;
	 *((int*)320) =  *((int*)284);
	 *((int*)320) = 288;
	 *((int*)320) =  *((int*)288);
	 *((int*)320) = 292;
	 *((int*)320) =  *((int*)292);
	 *((int*)320) = 296;
	 *((int*)320) =  *((int*)296);
	 *((int*)320) = 300;
	 *((int*)320) =  *((int*)300);
	 *((int*)320) = 304;
	 *((int*)320) =  *((int*)304);
	 *((int*)320) = 308;
	 *((int*)320) =  *((int*)308);
	 *((int*)320) = 312;
	 *((int*)320) =  *((int*)312);
	 *((int*)320) = 316;
	 *((int*)320) =  *((int*)316);
	 
	 *((int*)320) = 15658734;
	
	goto START;
	
	/*STOR_TO_AI(0, *((int*)0));
	STOR_TO_AI(4, *((int*)4));
	STOR_TO_AI(8, *((int*)8));
	STOR_TO_AI(12, *((int*)12));
	STOR_TO_AI(16, *((int*)16));
	STOR_TO_AI(20, *((int*)20));
	STOR_TO_AI(24, *((int*)24));
	STOR_TO_AI(28, *((int*)28));
	STOR_TO_AI(32, *((int*)32));
	STOR_TO_AI(36, *((int*)36));
	STOR_TO_AI(40, *((int*)40));
	STOR_TO_AI(44, *((int*)44));
	STOR_TO_AI(48, *((int*)48));
	STOR_TO_AI(52, *((int*)52));
	STOR_TO_AI(56, *((int*)56));
	STOR_TO_AI(60, *((int*)60));
	STOR_TO_AI(64, *((int*)64));
	STOR_TO_AI(68, *((int*)68));
	STOR_TO_AI(72, *((int*)72));
	STOR_TO_AI(76, *((int*)76));
	STOR_TO_AI(80, *((int*)80));
	STOR_TO_AI(84, *((int*)84));
	STOR_TO_AI(88, *((int*)88));
	STOR_TO_AI(92, *((int*)92));
	STOR_TO_AI(96, *((int*)96));
	STOR_TO_AI(100, *((int*)100));
	STOR_TO_AI(104, *((int*)104));
	STOR_TO_AI(108, *((int*)108));
	STOR_TO_AI(112, *((int*)112));
	STOR_TO_AI(116, *((int*)116));
	STOR_TO_AI(120, *((int*)120));
	STOR_TO_AI(124, *((int*)124));*/

	
	
	/*PRINT(SEVSEG, *((int*)256));
	PRINT(SEVSEG, *((int*)260));
	PRINT(SEVSEG, *((int*)264));
	PRINT(SEVSEG, *((int*)268));
	PRINT(SEVSEG, *((int*)272));
	PRINT(SEVSEG, *((int*)276));
	PRINT(SEVSEG, *((int*)280));
	PRINT(SEVSEG, *((int*)284));
	PRINT(SEVSEG, *((int*)288));
	PRINT(SEVSEG, *((int*)292));
	PRINT(SEVSEG, *((int*)296));
	PRINT(SEVSEG, *((int*)300));
	PRINT(SEVSEG, *((int*)304));
	PRINT(SEVSEG, *((int*)308));
	PRINT(SEVSEG, *((int*)312));
	PRINT(SEVSEG, *((int*)316));*/

	
	
	
	/*for(i=0;i<ACCEL_BASE;i+=4){
		//PRINT(SEVSEG, 99999);
		//PRINT(SEVSEG, i);
		//PRINT(SEVSEG, *((int*)i));
		STOR_TO_AI(i, *((int*)i));
	}
	
	
	
	for(i=0;i<64;i+=4){
		//PRINT(SEVSEG, 88888);
		GET_FROM_AI(i);
	}
	
	
	STOP;*/
}
