import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:english_words/english_words.dart';
import 'error.dart';
import 'result.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _length = TextEditingController();
  final TextEditingController _start = TextEditingController();
  final TextEditingController _end = TextEditingController();
  List<String> result = [];

  Widget instruction() {
    return
          Text.rich(
          TextSpan(
              style: GoogleFonts.poppins(
                  color: Colors.deepPurple,
                  fontSize: 18.0
              ),
              children: const <TextSpan>[
                TextSpan(
                  text: 'Find words that ',
                ),
                TextSpan(
                    text: 'start ',
                    style: TextStyle(
                        color: Colors.redAccent
                    )
                ),
                TextSpan(
                  text: 'and ',
                ),
                TextSpan(
                    text: 'end ',
                    style: TextStyle(
                        color: Colors.redAccent
                    )
                ),
                TextSpan(
                  text: 'with letters of your choice.',
                ),
              ]
          )
      ,
    );
  }
  Widget form(){
    return(
        Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Length of word (Optional)',
                    style: GoogleFonts.poppins(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: TextFormField(
                      controller: _length,
                      decoration: const InputDecoration(

                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  Text('Words start with:',
                    style: GoogleFonts.poppins(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: TextFormField(
                      controller: _start,

                      decoration: const InputDecoration(
                          hintText: 'Enter an alphabet',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          )
                      ),
                      validator: (value) {
                        if(value != null && value.isNotEmpty && value.length == 1){
                          return null;
                        }
                        return 'Enter one alphabet';
                      },
                    ),
                  ),
                  Text('Words end with:',
                    style: GoogleFonts.poppins(),
                  ),

                  TextFormField(
                    controller: _end,
                    decoration: const InputDecoration(
                        hintText: 'Enter an alphabet',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        )
                    ),
                    validator: (value) {
                      if(value != null && value.isNotEmpty && value.length == 1){
                        return null;
                      }
                      return 'Enter one alphabet';
                    },
                  ),

                ],
              ),
            )
        )
    );
  }
  void _search(){
    result = [];
    if(_formKey.currentState!.validate()){
      if(_length.text.isNotEmpty){
        all.take(5000).forEach((element) {
          if(element.length == int.parse(_length.text) && element.toString()[0] == _start.text && element.toString()[int.parse(_length.text)-1] == _end.text ) {
            result.add(element.toString());
          }
        });
      }else{
        all.take(5000).forEach((element) {
          if(element.length > 1 && element.toString()[0] == _start.text && element.toString()[element.toString().length-1] == _end.text ) {
            result.add(element.toString());
          }
        });
      }
      debugPrint(result.toString());
      if(result.isEmpty){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  const Error())
        );
      } else{
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  ResultPage(resultList: result))
        );
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                instruction(),
                Image.asset('assets/images/findword.png',
                  height: 200.0,
                  fit: BoxFit.contain,
                ),
                form(),
                Padding(
                  padding: const EdgeInsets.only(top:24.0),

                  child: MaterialButton(
                    height: 48.0,
                    color: Colors.deepPurple,
                    onPressed: _search,
                    child:  Text('Search',
                      style: GoogleFonts.poppins(
                          color: Colors.white
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
