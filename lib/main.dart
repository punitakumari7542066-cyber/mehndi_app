import 'package:flutter/material.dart';
void main() => runApp(MehndiApp());
class MehndiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mehndi Reel Maker AI',
      home: Scaffold(
        appBar: AppBar(title: Text('Mehndi Reel Maker AI'), backgroundColor: Colors.pink, centerTitle: true),
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(12),
          children: [
            designCard('Bridal ❤️'), designCard('Arabic 🌙'),
            designCard('Simple 🌸'), designCard('Full Hand ✨'),
            designCard('Leg Mehndi 🦶'), designCard('Eid Special 🌟'),
          ],
        ),
      ),
    );
  }
  Widget designCard(String name) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name.split(' ').last, style: TextStyle(fontSize: 50)),
          SizedBox(height: 8),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: Colors.pink), child: Text('Reel Banao'))
        ],
      ),
    );
  }
}
