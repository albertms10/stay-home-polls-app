import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stay_home_polls_app/login_flow/signin_flow_app.dart';
import 'package:stay_home_polls_app/login_flow/pages/splash_page.dart';
import 'package:provider/provider.dart';

class SignInConfig {
  bool canLoginAnonymously;
  SignInConfig(this.canLoginAnonymously);
}

class AuthStateSwitch extends StatelessWidget {
  final signInConfig;
  final Widget app;
  AuthStateSwitch(this.app, {canSignInAnonymously = false})
      : signInConfig = SignInConfig(canSignInAnonymously);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.hasError) return SplashPage(error: snapshot.error);

        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return SplashPage(error: "Connection state is none");

          case ConnectionState.waiting:
            return SplashPage();

          case ConnectionState.active:
            {
              final FirebaseUser user = snapshot.data;
              return user == null
                  ? Provider<SignInConfig>.value(
                      value: signInConfig,
                      child: SignInFlowApp(),
                    )
                  : Provider<FirebaseUser>.value(
                      value: user,
                      child: this.app,
                    );
            }

          case ConnectionState.done:
          default:
            return SplashPage(error: "Connection state is done");
        }
      },
    );
  }
}
