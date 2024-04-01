import 'package:ebus_qr_code_scanner/model/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './screens/qr_code.dart';
import './provider/Auth.dart';
import './provider/api.dart';
import './screens/splash.dart';

void main() {
  // code orientation for Portrait Only!
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Api>(
          create: (ctx) => Api('', null),
          update: (ctx, auth, previousStudent) => Api(
            auth.token.toString(),
            previousStudent!.data,
          ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.blue,
            primarySwatch: Colors.lightBlue,
            // ignore: deprecated_member_use
            accentColor: Colors.white,
            // ignore: deprecated_member_use
            buttonColor: Colors.blueAccent,

            // errorColor: Colors.red,
            fontFamily: 'Lato',
          ),
          routes: {
            '/': (ctx) {
              Widget? homepage;

              homepage = FutureBuilder(
                builder: (ctx, authResultSnapshot) {
                  return authResultSnapshot.connectionState ==
                          ConnectionState.waiting
                      ? const SplashScreen()
                      : const QrCode();
                },
              );

              return homepage;
            },
          },
        ),
      ),
    );
  }
}
