/* Rexx */                                                              
/* Advent of Code 2025 - Mainframe Edition */                           
/* Day : 02 / Part : 02 */                                              
/* Description : Given a list of input ProductIDs in a range form    */ 
/*               identify invalid IDs. They are the form of a repeat-*/ 
/*               -ed sequence of numbers like 55 or 11221122. This   */ 
/*               could be repeated sequence more than two times.     */ 
NUMERIC DIGITS 15                                                       
total = 0                                                               
/* Read file */                                                         
Address TSO                                                             
  "alloc da('RAMESHV.D2P1.TEXT') fi(prod) shr reuse"                    
  "execio * diskr prod (stem recs. finis"                               
  "free fi(prod)"                                                       
/* Outer loop for parsing the ranges */                                 
inpt = recs.1                                                        
Do while inpt <> ''                                                     
   parse var inpt range ',' inpt                                        
   parse var range strt '-' endn .                                   
/* say 'Record' range                                                
   say 'Starting' strt 'to' endn */                                     
   Do inL = strt to endn                                                
      /* Check possible repeating sequences */                          
      inLen = length(inL)                                               
      hpnt = inLen % 2 /* Get the half way point */                     
      /* Check if the sequence is the same set of numbers */            
      Do iloop = 1 to inLen - 1                                         
         If substr(inL, iLoop, 1) <> substr(inL, iLoop+1, 1) Then       
            Leave                                                       
         If iLoop = inLen - 1 Then Do                                   
          /*Say 'Invalid ProductID' inL */                              
            total = total + inL                                         
            Iterate inL                                                 
         End                                                            
      End                                                               
      /* Max prod ID length is 10, so max repeats is 4 */               
      If inLen // 2 = 0 & inLen > 2 Then Do /* Check for one repeat */ 
      /* This is for 4, 6, 8 & 10 lengths. Check if the following */   
      /* 2 & 2, 3 & 3, 4 & 4, 5 & 5 */                                 
         fhalf = left(inL,inLen/2)                                     
         shalf = right(inL,inLen/2)                                    
         If fhalf = shalf Then Do                                      
          /*say 'Invalid ProductID' inL */                             
            total = total + inL                                        
            Iterate inL                                                
         End                                                           
      End                                                              
      If inLen // 3 = 0 & inLen > 3 Then Do /* Check for two repeat */ 
                                                                       
      /* This is for 6 & 9 length. Check if 2 & 2 & 2 match */         
         f3rd = left(inL,inLen/3) /* Could be 2 or 3 */                
         s3rd = substr(inL,1+inLen/3,inLen/3) /* Start could be 3/4 */ 
         t3rd = right(inL,inLen/3) /* Could be 2 or 3 */               
         If f3rd = s3rd & s3rd = t3rd Then Do                          
          /*say 'Invalid ProductID' inL */                              
            total = total + inL                                         
            Iterate inL                                                 
         End                                                            
      End                                                               
      If inLen // 4 = 0 & inLen > 4 Then Do /* Check for 3 repeats */   
      /* This is for 8 length. Check if 2 & 2 & 2 & 2 match */          
      /* The 4 & 4 match is done as part of inLen // 2 */               
         f4th = left(inL,2)                                             
         s4th = substr(inL,3,2)                                         
         t4th = substr(inL,5,2)                                         
         l4th = right(inL,2)                                            
         If f4th = s4th & s4th = t4th & t4th = l4th Then Do             
          /*say 'Invalid ProductID' inL */                              
            total = total + inL                                         
            Iterate inL                                                 
         End                                                            
      End                                                               
      If inLen // 5 = 0 & inLen > 5 Then Do /* Check for 4 repeats */   
      /* This is for 10 length. Check if 2 & 2 & 2 & 2 & 2 match */     
      /* The 5 & 5 match is part of inLen // 2 */                       
         f5th = left(inL,2)                                             
         s5th = substr(inL,3,2)                                         
         t5th = substr(inL,5,2)                                         
         o5th = substr(inL,7,2)                                         
         l5th = right(inL,2)                                            
         If f5th = s5th & s5th = t5th & t5th = o5th & o5th = l5th Then  
         Do                                                             
          /*say 'Invalid ProductID' inL */                              
            total = total + inL                                         
            Iterate inL                                                 
         End                                                            
      End                                                               
   End                                                                  
End                                                                     
say 'Total of Invalid Product IDs' total                                
Exit
