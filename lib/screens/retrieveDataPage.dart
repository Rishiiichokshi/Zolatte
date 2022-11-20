import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:zolatte/widgets/app_drawer.dart';

class RetrieveDataPage extends StatefulWidget {
  const RetrieveDataPage({Key? key}) : super(key: key);

  @override
  State<RetrieveDataPage> createState() => _RetrieveDataPageState();
}

class _RetrieveDataPageState extends State<RetrieveDataPage> {

  Query dbRef = FirebaseDatabase.instance.ref().child('students');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('students');

  Widget listItem({required Map student}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 120,
      color: Colors.amberAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            student['address'].toString(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            student['phoneNumber'].toString(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            student['fullName'].toString(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () {
                  reference.child(student['key']).remove();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red[700],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fetching data'),
        ),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: dbRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

              Map student = snapshot.value as Map;
              student['key'] = snapshot.key;

              return listItem(student: student);

            },
          ),
        ),
        drawer: AppDrawer(),
    );
  }
}