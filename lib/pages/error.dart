import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
            children: <Widget>[
              Row(
                children: [
                  IconButton(
                    iconSize: 24.0,
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back,
                        color: Colors.deepPurple,
                      ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/error.png',
                    height: 200.0,
                    fit: BoxFit.contain,
                  ),
                  Text('No word matches your request!',
                      style: GoogleFonts.poppins(
                          color:Colors.redAccent
                      )
                  ),
                ],
              )

            ],
          ),
      ),
    );
  }
}
