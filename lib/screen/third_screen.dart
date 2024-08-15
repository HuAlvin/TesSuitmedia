import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:belajar_1/models/account.dart';

class ThirdScreen extends StatefulWidget {
  final List<Account> listAccount;

  const ThirdScreen({Key? key, required this.listAccount}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
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
              'Third Screen',
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
      body: ListView.builder(
        itemCount: widget.listAccount.length,
        itemBuilder: (context, index) {
          final account = widget.listAccount[index];
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(account.avatar),
                  ),
                  title: Text("${account.first_name} ${account.last_name}"),
                  subtitle: Text(account.email),
                  onTap: () {
                    Navigator.pop(
                        context, "${account.first_name} ${account.last_name}");
                  },
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1.0,
                indent: 10.0,
                endIndent: 10.0,
              ),
            ],
          );
        },
      ),
    );
  }
}
