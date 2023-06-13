import 'package:flutter/material.dart';
import 'package:user_crud/const/colors.dart';

import '../models/user.dart';
import '../services/user_controller.dart';
import '../widgets/drawer.dart';

class ListViewer extends StatefulWidget {
  const ListViewer({super.key});

  @override
  State<ListViewer> createState() => _ListViewerState();
}

class _ListViewerState extends State<ListViewer> {
  final UserController _userController = UserController();
  bool _isLoading = true;
  List<User> _users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllUsers();
  }

  Future<void> getAllUsers() async {
    _users = await _userController.getAll();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const buildDrawer(),
      appBar: AppBar(
        title: Text('Find All'),
        elevation: 0,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: PrimaryColor,
            ))
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) => ListCard(
                username: _users[index].username,
                email: _users[index].email,
              ),
            ),
    );
  }
}

class ListCard extends StatelessWidget {
  String username;
  String email;
  ListCard({
    required this.username,
    required this.email,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: PrimaryColorDark,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username),
                    Text(
                      email,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: PrimaryColor, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: PrimaryColorLight),
                    onPressed: () {},
                    child: Text('Edit')),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent),
                    onPressed: () {},
                    child: Text('Delete')),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
