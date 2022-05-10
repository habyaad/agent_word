import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.resultList}) : super(key: key);

  final List resultList;
  Widget displayResult(){
    return ListView.builder(
      itemCount: resultList.length,
      itemBuilder: (
              (context, index){
            return resultItem(resultList[index]);
          }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        foregroundColor: Colors.deepPurple,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Words found',
        style: GoogleFonts.poppins(
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold
    ),
      ),),
        body: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Column(
              children: <Widget>[
                Expanded(child: displayResult()),
              ]
          ),
        )
    );
  }
}


Widget resultItem(string){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 48.0, top: 4.0, bottom: 4.0),
        child: Text(string,
        style: GoogleFonts.poppins(),),
      ),
      const Divider()
    ],
  );
}