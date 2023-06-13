import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../models/user.dart';
import '../services/user_controller.dart';
import '../widgets/drawer.dart';

class GridViewer extends StatefulWidget {
  const GridViewer({super.key});

  @override
  State<GridViewer> createState() => _GridViewerState();
}

class _GridViewerState extends State<GridViewer> {
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
      appBar: AppBar(
        title: Text('Grid view'),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: PrimaryColor,
            ))
          : Builder(builder: (context) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4 / 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemCount: _users.length,
                itemBuilder: (context, index) => ListCard(
                  username: _users[index].username,
                  email: _users[index].email,
                ),
              );
            }),
    );
  }
}

class ListCard extends StatelessWidget {
  String username;
  String email;
  ListCard({
    required this.email,
    required this.username,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: PrimaryColorDark,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(username),
          Text(
            email,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: PrimaryColor, fontSize: 12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: PrimaryColorLight),
                  onPressed: () {},
                  child: Text('Edit')),
              SizedBox(
                width: 5,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent),
                  onPressed: () {},
                  child: Text('Edit')),
            ],
          )
        ]),
      ),
    );
  }
}
