checkWorkStatus(workStatus)
{
   if(workStatus=='Yes')
           {
             workStatus='Works from home';
           }
           else
           {
             workStatus='Goes to office'; 
           }
           return workStatus;
}
checkNumberofPets(numberofpets)
{
   if(numberofpets=='Yes')
           {
             numberofpets='Have other pets too';
           }
           else
           {
             numberofpets='No other pets'; 
           }
           return numberofpets;
}