/* Rexx */                                                              
/* Advent of Code 2025 - Mainframe Edition */                           
/* Day : 04 / Part : 02 */                                              
/* Description : Identify the total number of paper rolls that can   */ 
/*               be moved based on a given puzzle map.               */ 
/*               A roll can only be moved if it is surrounded by less*/ 
/*               than 4 other paper rolls.                           */ 
/*               Repeat until no more rolls can be moved             */ 
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */ 
Address TSO                                                             
  "alloc da('D4P1.TEXT') fi(pmap) shr reuse"                    
  "execio * diskr pmap (stem lay. finis"                                
  "free fi(pmap)"                                                       
Say "There are" lay.0 "rows of paper rolls."                            
/* Define a stem of locations */                                        
loc. = '.' /* Any variable starting with loc will have value of '.' */  
out. = '.'                                                              
/* Begin processing the file. Load puzzle map into stem variables */    
Do idx = 1 to lay.0                                                     
   /* Processing the row */                                             
   Do col = 1 to length(lay.idx)                                        
      loc.idx.col = substr(lay.idx, col, 1)                             
      out.idx.col = substr(lay.idx, col, 1)                             
   End                                                                  
   loc.idx.lmt = length(lay.idx)                                        
End                                                                     
moveroll = 0                                                            
prevmroll = -1                                                          
/* Check puzzle map using the Stem variables */                         
/* trace ?r */                                                          
passnbr = 1                                                             
Do while moveroll <> prevmroll                                          
   prevmroll = moveroll                                                 
   say 'Running pass#' passnbr '. Current rolls moved' moveroll         
   Do idx = 1 to lay.0                                                  
      Do col = 1 to loc.idx.lmt                                         
         out.idx.col = loc.idx.col                                      
         If loc.idx.col = '@' Then Do                                   
            /* Count number of rolls around */                          
            rolls = 0                                                   
            nxtrow = idx + 1                                            
            prerow = idx - 1                                            
            nxtcol = col + 1                                            
            precol = col - 1                                            
            If loc.prerow.precol = '@' Then rolls = rolls + 1           
            If loc.prerow.col = '@' Then rolls = rolls + 1              
            If loc.prerow.nxtcol = '@' Then rolls = rolls + 1           
            If loc.idx.precol = '@' Then rolls = rolls + 1              
            If loc.idx.nxtcol = '@' Then rolls = rolls + 1              
            If loc.nxtrow.precol = '@' Then rolls = rolls + 1           
            If loc.nxtrow.col = '@' Then rolls = rolls + 1              
            If loc.nxtrow.nxtcol = '@' Then rolls = rolls + 1           
            If rolls < 4 Then Do                                       
               moveroll = moveroll + 1                                 
               out.idx.col = '.'                                       
            End                                                        
         End                                                           
      End                                                              
   End                                                                 
   passnbr = passnbr + 1                                               
   /* Move out. stem data into loc. stem */                            
   Do idx = 1 to lay.0                                                 
      Do col = 1 to loc.idx.lmt                                        
         loc.idx.col = out.idx.col                                     
      End                                                              
   End                                                                 
End                                                                    
/* Display number of movable rolls */                                  
Say 'Number of movable rolls' moveroll                                  
Exit                                                                    
