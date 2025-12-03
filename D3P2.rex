/* Rexx */                                                              
/* Advent of Code 2025 - Mainframe Edition */                           
/* Day : 03 / Part : 02 */                                              
/* Description : Calculate the total joltage from a series of         */
/*               battery banks. The max joltage from one bank is the  */
/*               highest twelve numbers in the series                 */
/*                                                                    */
NUMERIC DIGITS 20                                                       
Address TSO                                                             
  "alloc da('D3P1.TEXT') fi(batt) shr reuse"                      
  "execio * diskr batt (stem bank. finis"                               
  "free fi(batt)"                                                       
totJolt = 0                                                             
chkpoint = 0                                                            
nbr2Find = 12                                                           
Do idx = 1 to bank.0                                                    
   bank.idx = space(bank.idx)                                           
    lenrec = length(bank.idx)                                            
    linejolt = ''                                                        
    hloc = 0                                                             
    Do nbr2Find = 12 to 1 by -1                                          
       high = 0                                                          
       Do iLoop = hloc + 1 to lenrec - nbr2Find + 1                      
          If substr(bank.idx, iLoop, 1) > high Then Do                   
             hloc = iLoop                                                
             high = substr(bank.idx, iLoop, 1)                           
          End                                                            
       End                                                               
       linejolt = linejolt || high                                       
       high = 0                                                          
    End                                                                  
    Say 'Bank #' idx 'Joltage' lineJolt                                  
   totJolt = totJolt + lineJolt                                         
End                                                                     
say ' Total Joltage is' totJolt                                         
