import 'package:belajar_1/data/list_account.dart';
import 'package:belajar_1/screen/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String? _selectedUserName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.blue,
                size: 20.0,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Spacer(),
            Text(
              'Second Screen',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: Colors.grey,
                  height: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_selectedUserName != null) ...[
              Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              Text(
                _selectedUserName!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ] else
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 270.0),
                  child: Text(
                    'Selected User Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () async {
                  final selectedName = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThirdScreen(
                        listAccount: listAccount,
                      ),
                    ),
                  );
                  if (selectedName != null) {
                    setState(() {
                      _selectedUserName = selectedName;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  fixedSize: const Size(350, 41),
                ),
                child: Text(
                  'Choose a User',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}