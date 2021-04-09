import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final imageUrl =
      'https://images.pexels.com/photos/2761930/pexels-photo-2761930.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';

  final darkBlue = Color.fromARGB(255, 18, 32, 47);
  final pinkAccentA200 = Colors.pinkAccent.shade200;
  final linkedInColor = Color.fromARGB(255, 40, 103, 178);
  final facebookColor = Color.fromARGB(255, 66, 103, 178);
  final facebook = Color(0xFF4267B2);

  Future<void> _launchInWebView(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: facebookColor,
          foregroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: darkBlue,
          title: Text('MiCard'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: pinkAccentA200,
              child: CircleAvatar(
                radius: 75,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            SizedBox(
              height: 24,
              width: double.infinity,
            ),
            Text(
              'Larissa Belloni',
              style: TextStyle(
                fontSize: 48, fontFamily: 'Devonshire',
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 8),
              child: Divider(
                height: 10,
                color: pinkAccentA200,
                thickness: 2,
              ),
            ),
            Text(
              'FLUTTER DEVELOPER',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 26,
            ),
            Card(
              color: pinkAccentA200,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
              elevation: 8,
              child: ListTile(
                leading: Icon(FontAwesomeIcons.github),
                title: Text('Meu Portfólio no GitHub'),
                onTap: () {
                  _launchInWebView('https://www.github.com/BZR4');
                },
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
            ),
            Card(
              color: linkedInColor,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
              elevation: 8,
              child: ListTile(
                leading: Icon(FontAwesomeIcons.linkedin),
                title: Text('LinkeIn'),
                onTap: () {
                  _launchInWebView('https://www.linkedin.com/esdrasilva');
                },
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
            ),
            TextButton.icon(
              icon: Icon(FontAwesomeIcons.solidEnvelope),
              onPressed: () {},
              label: Text('larissabelloni@fatec.sp.gov.br'),
              style: TextButton.styleFrom(primary: Colors.white54,),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _launchInWebView('https://www.facebook.com/esdrasilva');
          },
          label: Text('Like'),
          icon: Icon(FontAwesomeIcons.facebook),
        ),
      ),
    );
  }
}
