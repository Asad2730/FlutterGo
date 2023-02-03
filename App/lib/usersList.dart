import 'package:app/db.dart';
import 'package:flutter/material.dart';


class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {

  late Future _future;
  @override
  Widget build(BuildContext context) {
    _future = Db().getUsers();
    return Scaffold(
      appBar: AppBar(),
      body: _futureList(),
    );
  }

  Widget _futureList(){
     return FutureBuilder(
         future: _future,
         builder: (context,snapshot){
           if(!snapshot.hasData){
             return const Center(
               child: CircularProgressIndicator(),
             );
           }else{
             return _list(snapshot: snapshot);
           }
         }
     );
  }

  Widget _list({required AsyncSnapshot snapshot}){
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: snapshot.data.length,
        itemBuilder: (context,i){
          Map data = snapshot.data[i];
          return Card(
            color: Colors.white70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: ListTile(
              leading: Text(data['email']),
              title: Text('${data['name']}'),
            ),
          );
        }
    );
  }

}
