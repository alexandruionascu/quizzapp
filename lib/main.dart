import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Challenge {
  List<String> options;
  String content;
  String tag;

  Challenge({this.content, this.options, this.tag});
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup name generator',
      home: QuizzScreen(),
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: const Color(0xff252c4c),
        textTheme: TextTheme(
            bodyText1: GoogleFonts.firaSans(color: Colors.white),
            bodyText2: GoogleFonts.firaSans(color: Colors.white)),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              primary: Colors.black,
              padding:
                  EdgeInsets.only(left: 20, top: 12, right: 20, bottom: 12),
              textStyle: GoogleFonts.firaSans(
                  color: Colors.white, fontSize: 18, letterSpacing: -0.25)),
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 9, dashSpace = 5, startX = 0;
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class QuizzScreen extends StatefulWidget {
  @override
  _QuizzScreenState createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            brightness: Brightness.dark),
        body: Container(
            padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
            decoration: BoxDecoration(),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 0.05 * height),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding:
                                EdgeInsets.only(left: 0, right: 0, bottom: 10),
                            child: Text('Subiectul 1/10',
                                style: GoogleFonts.firaSans(
                                    color: Color(0xff8a93bd),
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.0,
                                    fontSize: 30))),
                        Row(
                          children: List.generate(
                              1000 ~/ 10,
                              (index) => Expanded(
                                    child: Container(
                                      color: index % 2 == 0
                                          ? Colors.transparent
                                          : Colors.grey,
                                      height: 2,
                                    ),
                                  )),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                        width: 5.0, color: const Color(0xff23496d)),
                                    color: const Color(0xffef5480),
                                  ),
                                  margin: EdgeInsets.only(top: 30),
                                  padding: EdgeInsets.only(left: 12.0, right: 12, top: 5, bottom: 5),
                                  child: Text('Matematica',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.0))),
                              Padding(
                                  padding: EdgeInsets.only(left: 10, right: 0, top: 15),
                                  child: Text(
                                    'Cat face un milion + un milion?',
                                    style: TextStyle(fontSize: 27),
                                  ))
                            ]),]),


                  Row(children: [
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.05, right: width * 0.05),
                            child: Container(
                                padding: EdgeInsets.only(right: width * (20 - _text.length) * 0.01),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(25.0),
                                  ),
                                  border: Border.all(
                                      color: const Color(0xff3f476a),
                                      width: 5.0),
                                ),
                                child: Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(20.0),
                                        ),
                                        gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              Color(0xfff94f6b),
                                              Color(0xffb26ffd)
                                            ]))))))
                  ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(top: 0),
                                padding: EdgeInsets.only(left: 0, right: 0),
                                child: TextField(
                                    textAlign: TextAlign.center,
                                    onChanged: (text) {
                                      setState(() {
                                        _text = text;
                                      });
                                    },
                                    style: GoogleFonts.firaSans(
                                        color: Colors.white),
                                    decoration: new InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: const Color(0xff23496d),
                                              width: 5.0),
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(30.0),
                                          )),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: const Color(0xff23496d),
                                              width: 5),
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(30.0),
                                          )),
                                      hintStyle: TextStyle(color: Colors.white),
                                      hintText: 'Baga raspunsul',
                                    ))))
                      ]),
                  Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //Center Column contents vertically,

                      children: [
                        TextButton(
                            child: Text(
                              'Alt subiect',
                            ),
                            onPressed: () => {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xff2275e0)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  side: BorderSide(
                                      color: Color(0xff3f476a), width: 3.0),
                                )))),
                        TextButton(
                            child: Text(
                              'Nu stiu boss',
                            ),
                            onPressed: () => {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xffb76cf2)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  side: BorderSide(
                                      color: Color(0xff3f476a), width: 3.0),
                                ))))
                      ]),
                  SizedBox(height: 0)
                ])));
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider();
          /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        // NEW lines from here...
        builder: (BuildContext context) {
          final tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        }, // ...to here.
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}
