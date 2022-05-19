import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowdsource/Frontend/Pages/HomePages/Influencer/influencer_homepage.dart';
import 'package:crowdsource/Frontend/Pages/HomePages/Participant/participant_home.dart';
import 'package:crowdsource/Utilities/size_config.dart';
import 'package:crowdsource/backend/Providers/provider_event.dart';
import 'package:crowdsource/backend/Providers/provier_auth.dart';
import 'package:crowdsource/backend/Streams/streams_event.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Frontend/Pages/WelcomePage/welcome_page.dart';
import 'backend/Providers/provider_tag.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TagProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EventProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Crowdsource App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MatchService(),
      ),
    );
  }
}

class MatchService extends StatefulWidget {
  const MatchService({
    Key? key,
  }) : super(key: key);
  @override
  State<MatchService> createState() => _MatchServiceState();
}

class _MatchServiceState extends State<MatchService> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return const MyHomePage();
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something Error'));
          } else {
            return const WelcomePage();
            // return const SignInGooglePage();
          }
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          default:
            if (snapshot.hasError) {
              return const Center(
                child: Text("error"),
              );
            } else {
              if (snapshot.data!.exists) {
                final doc = snapshot.data as DocumentSnapshot<Map<String, dynamic>>;
                bool isInfluencer = doc['isInfluencer'] ?? false;
                return BackgroundCall(isInfluencer: isInfluencer);
              } else {
                return Center(
                  child: Text("${FirebaseAuth.instance.currentUser!.uid} Data Not Exist"),
                );
              }
            }
        }
      },
    );
  }
}

class BackgroundCall extends StatefulWidget {
  final bool isInfluencer;
  const BackgroundCall({Key? key, required this.isInfluencer}) : super(key: key);

  @override
  State<BackgroundCall> createState() => _BackgroundCallState();
}

class _BackgroundCallState extends State<BackgroundCall> {
  @override
  Widget build(BuildContext context) {
    return StreamEvent(child: widget.isInfluencer ? const InfluencerHomePage() : const ParticipantHomePage());
  }
}
