import 'dart:math';
import 'package:flutter/cupertino.dart';

import 'ig.dart';
import 'package:flutter/material.dart';

void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLACKPINK',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      home: Test(),
    );
  }
}

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  final List<Ig> InstaList = [
    Ig(imguser: 'assets/images/m.jpg', img: 'assets/images/lisa.png',
        userpost: 'lalalalisa_m', comments: [Comments(user: 'Barnaby', comment: "πππππππππ"),Comments(user: 'Alice', comment: 'I π you')],
        caption: "κ½μ λ  μ§μπ"),
    Ig(imguser: 'assets/images/jj.jpg', img: 'assets/images/jan.jpeg',
        userpost: 'jennierubyjane',comments: [Comments(user: 'Ella', comment: 'She was so hot πππ'),Comments(user: 'Emma', comment: 'π₯π₯π₯π₯')],
        caption: 'π μ±μ΄ κ±°μΈμμ μ°°μΉ΅ πͺ'),
    Ig(imguser: 'assets/images/frs.jpg', img: 'assets/images/rs.jpg',
        userpost: 'roses_are_rosie',comments: [Comments(user: 'Jacky', comment: 'Good job RosΓ©!'),Comments(user: 'Lucy', comment: 'SO CUTEE β€ππ')],
        caption: 'μλ¨Έλ¦¬ μμ§ μλ€ π'),
    Ig(imguser: 'assets/images/fjs.jpg', img: 'assets/images/js.jpg',
        userpost: 'sooyaaa__',comments: [Comments(user: 'Mina', comment: 'Omgggggπ₯β€οΈβ€οΈβ€οΈ'),Comments(user: 'Nora', comment: 'So pretty! π€ We missed you a lot')],
        caption: 'π μ€λλ§μ μ°°μΉ΅ μ°°μΉ΅ π'),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('BlackPing',
          style: TextStyle(fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,))),
      body: ListView.builder(
          itemCount: InstaList.length,
          itemBuilder: (context, index) =>
              MyCard(ig: InstaList[index])),

    );
  }
}
class MyCard extends StatefulWidget {
  final Ig ig;

  const MyCard({
    Key? key,
    required this.ig,
  }) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final controller = TextEditingController();
  var like = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Text(covid.date),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('${widget.ig.imguser}'),
                ),
                SizedBox(width: 10.0),
                Expanded(
                    child: Text(
                        '${widget.ig.userpost}'
                    )
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),)
              ],
            ),
          ),
          Image.asset('${widget.ig.img}',fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                /*SizedBox(width: 5.0),*/
                Expanded(
                    child: Text(
                        '${widget.ig.caption}'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0,left: 16.0,right: 16.0),
            child: Column(
              children: [
                for(int i=0;i<widget.ig.comments.length;i++)
                  Row(
                    children: [
                      SizedBox(height: 23.0,),
                      Text(
                        '${widget.ig.comments[i].user}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        '${widget.ig.comments[i].comment}',
                        style: TextStyle(

                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),

          Row(
            children: [
              IconButton(onPressed: (){
                setState(() {
                  like = !like;
                });
              }, icon: like? Icon(Icons.favorite,color: Colors.red,): Icon(Icons.favorite_border),),
              Expanded(
                child: TextField(
                  onSubmitted: (value){

                    setState(() {
                      widget.ig.comments.add(Comments(user: 'Flutter', comment: value));
                      controller.clear();

                    });
                  },
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Add a comment',
                  ),
                ),
              ),
            ],
          )


        ],
      ),
    );
  }
}