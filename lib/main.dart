import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xo/button.dart';
import 'package:xo/cubit.dart';
import 'package:xo/states.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XO',
      initialRoute:Home.routeName,
      routes:{
        'XOScreen':(context)=>XOScreen(),
        'Home':(context)=>Home(),
      } ,
    );
  }
}

class XOScreen extends StatelessWidget {
  
  static final String routeName='XOScreen';


  @override
  Widget build(BuildContext context) {
    var dataFromHome = ModalRoute.of(context).settings.arguments as Map<String,String>;
    String first= dataFromHome['1'];
    String second=dataFromHome['2'];

    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var c = AppCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text('X-O'),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Text(
                          '${first}: ${c.playerXscore} ',
                          style: TextStyle(fontSize: 30),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '${second}: ${c.playerOscore}  ',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          buildButton(c.buttons[0],onPlay:()=>c.changeButton(0)),
                          buildButton(c.buttons[1],onPlay:()=>c.changeButton(1)),
                          buildButton(c.buttons[2],onPlay:()=>c.changeButton(2)),
                        ],
                      )),
                  Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          buildButton(c.buttons[3],onPlay:()=>c.changeButton(3)),
                          buildButton(c.buttons[4],onPlay:()=>c.changeButton(4)),
                          buildButton(c.buttons[5],onPlay:()=>c.changeButton(5)),
                        ],
                      )),
                  Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          buildButton(c.buttons[6],onPlay:()=>c.changeButton(6)),
                          buildButton(c.buttons[7],onPlay:()=>c.changeButton(7)),
                          buildButton(c.buttons[8],onPlay:()=>c.changeButton(8)),
                        ],
                      )),
                  Container(
                    height: 100,
                  )
                ],
              ),
            );
          }),
    );
  }
}

class Home extends StatelessWidget {
  static final String routeName='Home';
  String player1='';
  String player2='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Please Enter Players\' Names'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: 'Player 1 name:',
                labelStyle: TextStyle(fontSize: 30),
                hintStyle: TextStyle(fontSize: 20),
                hintText: 'Enter First Player Name',
              ),
              onChanged: (text){
                player1=text;
              },
            ),
            SizedBox(height: 120,),
            TextFormField(

              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: 'Player 2 name:',
                labelStyle: TextStyle(fontSize: 30),
                hintStyle: TextStyle(fontSize: 20),
                hintText: 'Enter Second Player Name',
              ),
              onChanged: (text){
                player2=text;
              },
            ),
            SizedBox(height: 200,),
            Container(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, XOScreen.routeName,arguments: {'1':player1,'2':player2});
              }, child: Text('Start Playing')),
            ),
          ],
        ),
      ),
    );
  }
}


