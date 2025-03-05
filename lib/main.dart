import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/two': (context) => const SecondPage(),
        '/three': (context) => const ThirdPage(),

      },

      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page' ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.web, color: Colors.orange[900]),
              onPressed: () {
                launchUrl(Uri.parse('https://www.cs.uic.edu/'));
              }
          ),

          IconButton(
              icon: Icon(Icons.phone, color: Colors.orange[900]),
              onPressed: (){
                launchUrl(Uri.parse('tel:312-996-3422'));
              }
          ),


          IconButton(
              icon: Icon(Icons.email, color: Colors.orange[900]),
              onPressed: (){
                launchUrl(Uri.parse('mailto:hvu28@uic.edu'));
              }
          ),

        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/csky.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,

        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title, style: TextStyle(fontSize: 32, color: Colors.orange[900]),),
      ),
      backgroundColor: Colors.grey[850],
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
//mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(20.0)),
            Hero(
                tag: 'city sky',
                child: ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/two');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // Removes white background
                  shadowColor: Colors.transparent, // Removes shadow if needed
                  padding: EdgeInsets.zero, // Removes extra padding
                  elevation: 0, // Removes elevation if not needed
                ),
                    child: Image(image: AssetImage('images/csky.jpg'), fit: BoxFit.cover)
                )
            ),
            Padding(padding: EdgeInsets.all(50.0)),
            Hero(
              tag: 'teams',
              child: GestureDetector(onTap: (){
                Navigator.pushNamed(context, '/three');
              },
                  child: Image(image: AssetImage('images/cteam.jpg'), fit: BoxFit.cover)
              )
            ),

          ],
        ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Center(
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(35.0)),
            Text('Welcome to the Chicago Skyline', style: TextStyle(fontSize: 24, color: Colors.orange[900])),
            const Padding(padding: EdgeInsets.all(75.0)),
            Hero(
              tag: 'city sky',
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // Removes white background
                  shadowColor: Colors.transparent, // Removes shadow if needed
                  padding: EdgeInsets.zero, // Removes extra padding
                ),
                child: Image.asset(
                  'images/csky.jpg',
                  fit: BoxFit.contain, // Ensures the image stays centered without pushing content
                ),
              ),
            ),
          ],
        )
      )
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: Hero(
                    tag: 'teams',
                    child: Image.asset(
                      'images/cteam.jpg',
                      fit: BoxFit.contain, // Ensures the image stays centered without pushing content
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}