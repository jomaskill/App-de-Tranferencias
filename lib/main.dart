import 'package:flutter/material.dart';

void main() => runApp(
   MaterialApp(
     home: Scaffold(
       body: Column(
         children: <Widget>[
           Card(
             child: ListTile(
               leading: Icon(Icons.monetization_on),
               title: Text('100.00'),
               subtitle: Text('34233-5'),
             ),
           ),
           Card(
             child: ListTile(
               leading: Icon(Icons.monetization_on),
               title: Text('100.00'),
               subtitle: Text('34233-5'),
             ),
           ),
         ],
       ),
       appBar: AppBar(title: Text('Tranferências'),),
       floatingActionButton: FloatingActionButton(
           child: Icon(Icons.add),
         ),
     ),
   )
);
