import 'package:belajar_1/screen/second_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _palindromeController = TextEditingController();

  bool isPalindrome(String text) {
    String cleanedText = text.replaceAll(RegExp(r'[\W_]+'), '').toLowerCase();
    String reversedText = cleanedText.split('').reversed.join('');
    return cleanedText == reversedText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(32.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/emptyprofile.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  _gap(),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  _gap(),
                  TextFormField(
                    controller: _palindromeController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      if (isPalindrome(value)) {
                        return null;
                      } else {
                        return '';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Palindrome',
                      //hintText: '',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          fixedSize: const Size(310, 41),
                          backgroundColor: Colors.blue),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'CHECK',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('isPalindrome')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('not palindrome')),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          fixedSize: const Size(310, 41),
                          backgroundColor: Colors.blue),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'NEXT',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}