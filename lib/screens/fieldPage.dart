import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:zolatte/screens/retrieveDataPage.dart';
import 'package:zolatte/widgets/app_drawer.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {

  TextEditingController address = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController fullName = new TextEditingController();
  TextEditingController age = new TextEditingController();
  TextEditingController freeText = new TextEditingController();

  late DatabaseReference dbRef;

  void clearText() {
    address.clear();
    phoneNumber.clear();
    fullName.clear();
    age.clear();
    freeText.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('students');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zolatte'),
      ),
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 140, left: 40, right: 40),
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Address'),
              controller: address,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 40, right: 40),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Phone number'),
              controller: phoneNumber,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 40, right: 40),
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Full name'),
              controller: fullName,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 40, right: 40),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter your age'),
              controller: age,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 40, right: 40),
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Enter your text here'),
              controller: freeText,
            ),
          ),
          SizedBox(
            height: 150,
            width: 150,
            child: Padding(
              padding: EdgeInsets.only(top: 90),
              child: ElevatedButton(
                onPressed: () {
                  Map <String, String> students = {
                    'address': address.text,
                    'phoneNumber': phoneNumber.text,
                    'fullName': fullName.text,
                    'age': age.text,
                    'freeText': freeText.text,
                  };
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => RetrieveDataPage(),
                  //   ),
                  // );
                  dbRef.push().set(students);
                  clearText();
                },
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          )
        ],
      ),
    ),
      drawer: AppDrawer(),
    );
  }
}
