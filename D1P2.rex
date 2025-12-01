/* Rexx */                                                             
/* Advent of Code 2025 - Mainframe Edition */                          
/* Day : 01 / Part : 02 */                                             
/* Description : Identify the password to open a safe based on the   */
/*               instructions given in a file (Left/Right movements) */
/*               New protocol - 0x434C49434B. Count the number of    */
/*               times the operation crosses the 0 point whether or  */
/*               not it was during the movement or the end.          */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
currPoint = 50                                                         
pass = 0                                                               
Address TSO                                                            
  "alloc da('RAMESHV.D1P1.TEXT') fi(inst) shr reuse"                   
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
      when op = 'L' Then Do                                             
         /* Use Do loop to simulate each movement. Check after each */
         /* movement to see if 0 is reached                         */
         Do inLoop = 1 to amt                                           
            currPoint = currPoint - 1                                   
            If currPoint // 100 = 0 Then Do                             
               pass = pass + 1                                          
            End                                                         
         End                                                            
      End                                                               
      when op = 'R' Then Do                                             
         /* Use Do loop to simulate each movement. Check after each */
         /* movement to see if 0 is reached                         */
         Do inLoop = 1 to amt                                           
            currPoint = currPoint + 1                                   
            If currPoint // 100 = 0 Then Do                             
               pass = pass + 1                                          
            End                                                         
         End                                                            
      End                                                               
      Otherwise Do                               /* If not L/R. Exit */ 
         say 'Operation is invalid' op 'on line' idx                    
         exit                                                           
      End                                                               
   End                                                                  
End                                                                     
Say 'Drumroll! Password is' pass                                        
Exit                                                                    