/* Rexx */                                                              
/* Advent of Code 2025 - Mainframe Edition */                           
/* Day : 02 / Part : 01 */                                              
/* Description : Given a list of input ProductIDs in a range form    */ 
/*               identify invalid IDs. They are the form of a repeat-*/ 
/*               -ed sequence of numbers like 55 or 11221122. Add the*/ 
/*               invalid IDs to get the clue for Part 2              */ 
/* Algo : Read input file (single record)                               
          Parse into individual ranges                                  
          Split range into lower & upper index to check                 
          If length of number is odd, it can't be invalid! Skip         
          If even, split it into half and compare both sides            
          If same, InvalidID. Add to total                              
          Display total */                                              
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */ 
NUMERIC DIGITS 15                                                       
total = 0                                                               
/* Read file */                                                         
Address TSO                                                             
  "alloc da('D2P1.TEXT') fi(prod) shr reuse"                                  
  "execio * diskr prod (stem recs. finis"                               
  "free fi(prod)"                                                       
/* Outer loop for parsing the ranges */                                 
inpt = recs.1 
parse var inpt range ',' inpt                                                       
Do while inpt <> ''                                                                                                
   parse var inpt strt '-' endn . /* Drop any extra stuff, should be nothing */                                  
   say 'Range' inpt || '. Starting' strt 'to' endn                                               
   Do inL = strt to endn                                                
      If length(inL) // 2 = 1 Then Iterate                              
      fhalf = left(inL,length(inL)/2)                                   
      shalf = right(inL,length(inL)/2)                                  
      If fhalf = shalf Then Do                                          
      /* say 'Invalid ProductID' inL */                                 
         total = total + inL                                            
      End                                                               
   End                                                                  
   parse var inpt range ',' inpt
End                                                                  