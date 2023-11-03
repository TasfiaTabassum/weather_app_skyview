import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final _textFieldController = TextEditingController();
  String searchText = "auto:ip" ;
  //
  // _showTextInputDialog(BuildContext context)async{
  //   return showDialog(context: context, builder: (context){
  //     return AlertDialog(
  //       backgroundColor: Colors.white24,
  //       title: Text("Search Location"),
  //       content: TextField(
  //         controller: _textFieldController,
  //         decoration: InputDecoration(
  //             hintText: "search by city, zip, lat, lang"
  //         ),
  //       ),
  //       actions: [
  //         ElevatedButton(
  //             onPressed: (){
  //               Navigator.pop(context);
  //
  //             },
  //             child: Text("Cancel")),
  //         ElevatedButton(
  //             onPressed: (){
  //               if(_textFieldController.text.isEmpty){
  //                 return;
  //               }
  //               Navigator.pop(context, _textFieldController.text);
  //             },
  //             child: Text("Ok")),
  //       ],
  //     );
  //   });
  // }

  _showTextInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent, // Set dialog background to transparent
          contentPadding: EdgeInsets.zero, // Remove default padding

          content: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black, // Set container color to black
              borderRadius: BorderRadius.circular(10), // Set border radius
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5), // White glow effect
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Search Location",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _textFieldController,
                    style: TextStyle(color: Colors.white), // Set text color to white
                    decoration: InputDecoration(
                      hintText: "search by city, zip, lat, lang",
                      hintStyle: TextStyle(color: Colors.white70), // Set hint text color to white with opacity
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_textFieldController.text.isEmpty) {
                          return;
                        }
                        Navigator.pop(context, _textFieldController.text);
                      },
                      child: Text("Ok"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark
          ),
          title: Row(
            children: [
              Image.asset(
                'assets/app_icon.png',
                width: 40,
                height: 40,
              ),
              SizedBox(
                  width: 8
              ),
              Text(
                'SkyView',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: () async{
              _textFieldController.clear();
              String text = await _showTextInputDialog(context);
              setState(() {
                searchText = text ;
              });
            }, icon: Icon(Icons.search, color: Colors.white,)),
            IconButton(onPressed: (){
              searchText = "auto:ip";
              setState(() {

              });
            }, icon: Icon(Icons.my_location, color: Colors.white,)),
          ],
        ),

      );
  }
  
}