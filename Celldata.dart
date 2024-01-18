// ignore: file_names
import 'package:flutter/material.dart';
import 'emploi.dart';
class TimetableHelper {
  static Widget createTimetableInfo(  s,    d,g) {
if(s=="Séance 1") {s="S1" ;} else if(s=="Séance 2") {s="S2" ;}  else if(s=="Séance 3") {s="S3" ;}  else if(s=="Séance 4") {s="4";}


Widget information =const Text(""); // Initialize k with a default value

for (int i = 0; i < TimetableViewState.timetableData.length; i++) {
  // Get the current timetableData[i]
  
  if(TimetableViewState.timetableData[i].toString()!="[]" && TimetableViewState.timetableData[i]['Groupe'] == g && TimetableViewState.timetableData[i]['jour'] == d && TimetableViewState.timetableData[i]['Seance'] == s) 
  {
    if(TimetableViewState.timetableData[i]['Module']!="")
  {



 information=Column(
  children: <Widget>[
    // ignore: prefer_interpolation_to_compose_strings
    Text(TimetableViewState.timetableData[i]['Creneau_Horaire'],style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
    Container(height: 1), // Use Container with a specific height for Divider
    const Divider(),
    Container(height: 1), // Use Container with a specific height for Divider
    Padding(padding: const EdgeInsets.only(left: 10),
    child: Text(TimetableViewState.timetableData[i]['Module'],style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal))),
    Container(height: 1), // Use Container with a specific height for Divider
    const Divider(),
     Padding(padding: const EdgeInsets.only(left: 10),
    child: Text(TimetableViewState.timetableData[i]['Formateur'],style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal))),
    Container(height: 1), // Use Container with a specific height for Divider
    const Divider(),
   Padding(padding: const EdgeInsets.only(left: 10),
   child: Text(TimetableViewState.timetableData[i]['Mode_formation']+' / '+' '+TimetableViewState.timetableData[i]['EF'],style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal)))
   
  ],
);

     
  

  }
   break;
  }
  else 
  {
    information= const Text("");
  }
}
 
{

}

return TableCell(child: information);




}}
