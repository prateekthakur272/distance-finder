import 'package:distance_finder/result.dart';
import 'package:distance_finder/widgets/button.dart';
import 'package:distance_finder/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Distance Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  final TextEditingController addressInput1 = TextEditingController();
  final TextEditingController addressInput2 = TextEditingController();
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _enabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: const Text('Distance Finder'),
        backgroundColor: Colors.yellow.shade400,
        brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset('assets/img_logo.png',height: 180,width: 180,),
            const Text('Enter Addresses',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            TextInput(placeholder: 'Address 1', controller: widget.addressInput1,onChange: (value){
              setState(() {
                _enabled = widget.addressInput2.text.trim().isNotEmpty && value.trim().isNotEmpty;
              });
            },),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            TextInput(placeholder: 'Address 2', controller: widget.addressInput2,onChange: (value){
              setState(() {
                _enabled = widget.addressInput1.text.trim().isNotEmpty && value.trim().isNotEmpty;
              });
            },),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            Button(label:'Calculate Distance',onClick: _enabled?() async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Result(address1: widget.addressInput1.text.trim(), address2: widget.addressInput2.text.trim())));
            }:null)
          ],
        ),
      ),
    );
  }
}