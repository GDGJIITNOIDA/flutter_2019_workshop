import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget{
  @override
  _ListScreenState createState() => _ListScreenState();
}

List<String> favourites = [];

class _ListScreenState extends State<ListScreen>{

  List<String> _list = [];

  @override
  Widget build(BuildContext context) {

    for(int i=0; i<100; i++){
      _list.add("List item " + (i+1).toString());
    }

    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: (BuildContext context, int index){
          return _buildRow(_list, index);
      },
    );
  }

  Widget _buildRow(List<String> _list, index){
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 16.0, bottom: 8.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                _list[index],
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              IconButton(
                icon: Icon(
                  favourites.contains(_list[index])? Icons.favorite : Icons.favorite_border,
                  color: Colors.lightGreen,
                ),
                onPressed: (){
                  setState(() {
                    if(favourites.contains(_list[index])){
                      favourites.remove(_list[index]);
                    } else{
                      favourites.add(_list[index]);
                    }
                  });
                },
              )
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}

//FavouritesScreen

class FavouritesScreen extends StatefulWidget{
  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourites",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body: (favourites.isEmpty)?
      Center(
        child: Text(
          "It's all empty in here!",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.w600
          ),
        ),
      )
      :
      ListView.builder(
        itemCount: favourites.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 16.0, bottom: 8.0, right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  favourites[index],
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                Divider(),
              ],
            ),
          );
        },
      ),
    );
  }

}