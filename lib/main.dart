// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, prefer_typing_uninitialized_variables, sort_child_properties_last

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: SimpleProject(),
    );
  }
}

class SimpleProject extends StatelessWidget {
  const SimpleProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 100, 182),
        toolbarHeight: 60,
        elevation: 20,
        title: Text(
          "ASLAMA👋",
          style: TextStyle(
            fontFamily: 'itaalic', // Replace with your font family name
            fontSize: 20, // Adjust font size as desired
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              size: 50,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                size: 50,
              )),
        ],
      ),
 body: Center(
  child: Container(
    color: Color.fromARGB(255, 97, 159, 246),
    width: double.infinity,
    padding: EdgeInsets.all(20),
    child: Row(
      children: [
        // First column
        Expanded(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("beach", style: TextStyle(fontSize: 19)),
                  decoration: BoxDecoration(
                  color:  Color.fromARGB(255, 49, 201, 248),
                  border: Border.all(color: Color.fromARGB(255, 0, 0, 220), width: 4.0), // Add border
                  borderRadius: BorderRadius.circular(10.0), // Add border radius
                ),
            
                  width: 170,
                  height: 92,
                ),
              ),
               SizedBox(height: 20),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("cuisine", style: TextStyle(fontSize: 19, color: Colors.white)),
                  decoration: BoxDecoration(
                  color:  Color.fromARGB(255, 49, 201, 248),
                  border:  Border.all(color: Color.fromARGB(255, 0, 0, 220), width: 4.0), // Add border
                  borderRadius: BorderRadius.circular(10.0), // Add border radius
                ),
                  width: 170,
                  height: 92,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Hiking", style: TextStyle(fontSize: 19, color: Colors.white)),
                  decoration: BoxDecoration(
                  color: Color.fromARGB(255, 49, 201, 248),
                  border: Border.all(color: Colors.blue, width: 4.0), // Add border
                  borderRadius: BorderRadius.circular(10.0), // Add border radius
                ),
            
                  height: 92,
                ),
              ),
                SizedBox(height: 20),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Ice", style: TextStyle(fontSize: 19, color: Colors.white)),
                  decoration: BoxDecoration(
                  color:  Color.fromARGB(255, 49, 201, 248),
                  border:  Border.all(color: Color.fromARGB(255, 0, 0, 220), width: 4.0), // Add border
                  borderRadius: BorderRadius.circular(10.0), // Add border radius
                ),
                  width:170,
                  height: 92,
                ),
              ),
            ],
          ),
        ),

        // Space between columns
        SizedBox(width: 20), // Adjust the width as needed

        // Second column (similar structure as the first)
        Expanded(
          child: Column(
            children: [
              // ... (Replace with your content for the second column)
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("desert", style: TextStyle(fontSize: 19)),
                  decoration: BoxDecoration(
                  color:  Color.fromARGB(255, 49, 201, 248),
                  border:  Border.all(color: Color.fromARGB(255, 0, 0, 220), width: 4.0), // Add border
                  borderRadius: BorderRadius.circular(10.0), // Add border radius
                ),
                  width: 170,
                  height: 92,
                ),
              ),
                SizedBox(height: 20),
              Expanded(
                flex: 1,  
                child: Container(
                  alignment: Alignment.center,
                  child: Text("old cities", style: TextStyle(fontSize: 19, color: Colors.white)),
                 decoration: BoxDecoration(
                  color:  Color.fromARGB(255, 49, 201, 248),
                  border:  Border.all(color: Color.fromARGB(255, 232, 0, 0), width: 4.0), // Add border
                  borderRadius: BorderRadius.circular(10.0), // Add border radius
                ),
                  width: 170,
                  height: 92,
                ),
              ),
                SizedBox(height: 20),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Historical places", style: TextStyle(fontSize: 19, color: Colors.white)),
                  decoration: BoxDecoration(
                  color:  Color.fromARGB(255, 49, 201, 248),
                  border:  Border.all(color: Color.fromARGB(255, 0, 0, 220), width: 1.0), // Add border
                  borderRadius: BorderRadius.circular(10.0), // Add border radius
                ),
                  width: 170,
                  height: 92,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("River", style: TextStyle(fontSize: 19, color: Colors.white)),
                  decoration: BoxDecoration(
                  color:  Color.fromARGB(255, 49, 201, 248),
                  border:  Border.all(color: Color.fromARGB(255, 0, 0, 220), width: 4.0), // Add border
                  borderRadius: BorderRadius.circular(10.0), // Add border radius
                ),
                  width: 170,

                 
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
),

    );
  }
}




    
    

