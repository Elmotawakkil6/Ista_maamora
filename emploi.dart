
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Celldata.dart';
import 'package:collection/collection.dart';

class TimetableView extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  TimetableViewState createState() => TimetableViewState();
}

class TimetableViewState extends State<TimetableView> {
    static var timetableData = [];
    List<dynamic> groupdata = [];
    List<dynamic> groupdataAll = [];
    List<dynamic> groupdataFill = [];
  List<dynamic> groupdataGrouo = [];
  @override
  void initState() {
    super.initState();
    fetchData();
    fetchDatag();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://istamaamora.000webhostapp.com/emp/in.php'));
    if (response.statusCode == 200) {
      setState(() {
        TimetableViewState.timetableData = json.decode(response.body);
      });
    }
  }
//https://istamaamora.000webhostapp.com


  Future<void> fetchDatag() async {
    final response = await http.get(Uri.parse('https://istamaamora.000webhostapp.com/emp/apig.php'));
    if (response.statusCode == 200) {
      setState(() {
        groupdataAll = json.decode(response.body);
        groupdata=groupdataAll;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    List<String> days = ['LUNDI', 'MARDI', 'MERCREDI', 'JEUDI', 'VENDREDI', 'SAMEDI'];
    List<String> sessions = ['Séance 1', 'Séance 2', 'Séance 3', 'Séance 4'];


    return groupdata.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            SingleChildScrollView(child: filter() ),
             Expanded(
               child: ListView.builder(
                           
                physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                itemCount: groupdata.length,
                itemBuilder: (context, index) {
                  //var weekData = timetableData[index];
                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      
                         
                        children: [
                          
                         Card(
                           
                shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                           ),
                           child:Column(children: [
                          headerapp('EFP : ','ISTA MAAMORA KENITRA'),
                          headerapp('Filliére : ',groupdata[index]['filière'].toString()),
                          headerapp('Année : ',groupdata[index]['Année'].toString()),
                          headerapp('Groupe : ',groupdata[index]['Groupe']),
                         // Entete d'app
                     // @weAb654++df6 web site
                        ]),),
                          SingleChildScrollView(
                         
                           scrollDirection: Axis.horizontal,
                         
                         
                         
                            child: Table(
                            border: TableBorder.all(),
                          columnWidths: {
                0: FixedColumnWidth(MediaQuery.of(context).size.width * 0.25), // Width for the first column
               1: FixedColumnWidth(MediaQuery.of(context).size.width * 0.4),
                2: FixedColumnWidth(MediaQuery.of(context).size.width * 0.4),
                 3: FixedColumnWidth(MediaQuery.of(context).size.width * 0.4),  
                4: FixedColumnWidth(MediaQuery.of(context).size.width * 0.4),     // Flexible width for the second column
                // Add more columns as needed
                           },
                            
                              children: [
                                TableRow(
                                                  
                                      
                                  children: [
                                       const TableCell(child: Padding(padding:  EdgeInsets.all(10),child: Center(child: Text(' Séances \\ Jours',style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))))),
                                    for (var session in sessions)
                                        TableCell(child: Padding(padding: const EdgeInsets.all(10),
                                       child: Center(child: Text(session,style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold))))),
                                  ],
                                ),
                                for (String day in days)
                                  TableRow(
                                    children: [
                                      TableCell(child:  Container(
                                         padding: const EdgeInsets.all(2.0)
                                        ,child: Align(alignment: Alignment.center,child: Text(day,style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold))))),
                                      
                                      for (var session in sessions)
                                       
                                           TimetableHelper.createTimetableInfo(session,day,groupdata[index]['Groupe'])
                            
                                            
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                           ),
             ),
          ]
        )
  
        ;

          
  }


headerapp(title,data)
{
  return  Row(children: [Expanded(flex: 4,child: Text(title,style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),),
  Expanded(flex: 4,child: Text(data,style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),),],  );
}
String selectedFiliere = '';
String selectedGroupe = '';

  
List<String> annee = [];
List<String> fil = [];


functioGetgroup()
{

for (var item in groupdata) {
  var anneeValue = item['Année']?.toString();
  if (anneeValue != null && anneeValue.isNotEmpty && !annee.contains(anneeValue)) {
    annee.add(anneeValue);
  }
}
return annee;
}


functioGeFil()
{

for (var item in groupdata) {
  var fileValue = item['FIL_SGRP']?.toString();
  if (fileValue != null && fileValue.isNotEmpty && !annee.contains(fileValue)) {
    fil.add(fileValue);
  }
}
return fil;
}


  
  // List of items in our dropdown menu 

var d='';
 String?  selectedAnnee;
    String? selectFil="sélectionne fil"; // Declare dropdownValue here
      String? dropdownGrou; // Declare dropdownValue here
filter() {
functioGetgroup();
  return Padding(
    padding: EdgeInsets.all(2.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //// For Years 
    Expanded(
      flex:1,
      child: DropdownButton<String>(
        value: selectedAnnee,
        onChanged: (String? newValue) {
      setState(() {
        selectedAnnee = newValue;
         
        updateFilteredData(selectedAnnee);
        //functioGetgroup();
      });
        },
        items: annee.map((String item) {
      return DropdownMenuItem<String>(
        value: item.toString(),
        child: Text(item.toString()),
      );
        }).toList(),
        hint: Text('Seléctionne Année'), 
      ),
    ),

// For Filiere 
    Expanded(
      flex: 2,
      child: DropdownButton<String>(
        //value: selectFil ,
        onChanged: (String? newValues) {
      setState(() {
        
        selectFil = newValues;
      
         
        updateFilteredDataFil(selectedAnnee,selectFil);
        //functioGetgroup();
      });
        },
        items: groupdataFill.toSet().map<DropdownMenuItem<String>>((dynamic item) {
      return DropdownMenuItem<String>(
        value: item['Abr_Filière'].toString(),
        child: Text(item['filière'].toString()),
      
      
      );
        }).toList(),
        hint: Text(selectFil.toString()), 
      ),
    ),


// For Groupe
    Expanded(
      flex: 1,
      child: DropdownButton<String>(
        //value: selectFil ,
        onChanged: (String? newValues) {
      setState(() {
        
        dropdownGrou = newValues;
      
         
        updateFilteredDataG(selectedAnnee,selectFil,dropdownGrou);
        //functioGetgroup();
      });
        },
        items: groupdataGrouo.toSet().map<DropdownMenuItem<String>>((dynamic item) {
      return DropdownMenuItem<String>(
        value: item['Groupe'].toString(),
        child: Text(item['Groupe'].toString()),
      
      
      );
        }).toList(),
        hint: Text(dropdownGrou.toString()), 
      ),
    ),
      ],
    ),
  );
}


  void updateFilteredData(newaan) {
   
    setState(() {
     
      groupdata = groupdataAll
          .where((item) => item['Année'] == newaan).toSet()
          .toList();
      groupdataFill=groupdata.map((e) =>  {'Abr_Filière': e['Abr_Filière'], 'filière': e['filière']},).toList();


  Set uniqueAbrFiliereValues = groupdataFill.map((e) => e['Abr_Filière']).toSet();

    groupdataFill = groupdataFill
      .where((e) => uniqueAbrFiliereValues.remove(e['Abr_Filière']))
      .toList();


        
    });

   // print(groupdata);
  }


    void updateFilteredDataFil(newaan,selcfil) {
   
    setState(() {
      groupdataGrouo=groupdata =groupdataAll
          .where((item) => item['Année'] == newaan && item['Abr_Filière']==selcfil).toList();

          
    });

   // print(groupdata);
  }


    void updateFilteredDataG(newaan,selcfil,  dropdownGrou) {
   
    setState(() {
      groupdata =groupdataAll
          .where((item) => item['Année'] == newaan && item['Abr_Filière']==selcfil && item['Groupe']==dropdownGrou).toList();

          
    });

   // print(groupdata);
  }

}








/// 
/// 