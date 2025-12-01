/* Rexx */                                                             
/* Advent of Code 2025 - Mainframe Edition */                          
/* Day : 01 / Part : 01 */                                             
/* Description : Identify the password to open a safe based on the   */
/*               instructions given in a file (Left/Right movements) */
/*               The password is the number of times, the dial move- */
/*               -ment results in the dial pointing at 0.            */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
currPoint = 50                                                         
pass = 0                                                               
Address TSO                                                            
  "alloc da('RAMESHV.AOC25.D1P1') fi(inst) shr reuse"                  
  "execio * diskr inst (stem cmds. finis"                              
  "free fi(inst)"                                                      
Say "Dial on safe starts at" currPoint||". Now processing" cmds.0,     
    "instructions"                                                     
/* Begin processing the file */                                        
Do idx = 1 to cmds.0                                                    
   todo = space(cmds.idx)                  /* Trim spaces from input */ 
   op = left(todo,1)                      /* Operation is first char */ 
   amt = right(todo,length(todo)-1)       /* Rest is the # of clicks */ 
   Select                                                               
      when op = 'L' Then                                                
         currPoint = currPoint - amt                                    
      when op = 'R' Then                                                
         currPoint = currPoint + amt                                    
      Otherwise Do                               /* If not L/R. Exit */ 
         say 'Operation is invalid' op 'on line' idx                    
         exit                                                           
      End                                                               
   End                                                                  
   /* If movement of dial is greater than 99, reduce 100 to get value*/ 
   If currPoint > 99 Then                                               
      currPoint = currPoint - 100                                       
   /* If movement of dial is lesser than 0, add 100 to get value     */
   If currPoint < 0 Then                                               
      currPoint = currPoint + 100                                      
   /* If point is at 0, increase the password count                  */
   If currPoint = 0 Then                                               
      pass = pass + 1                                                  
End                                                                    
Say 'Drumroll! Password is' pass                                       
Exit                                                                   