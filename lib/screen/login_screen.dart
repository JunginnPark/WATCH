import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  // String? token;
  // void _firebaseCloudMessaging_Listeners() {
  //   if (Platform.isIOS) {}
  //   _firebaseMessaging.getAPNSToken().then((result) {
  //     token = result;
  //     print('debug token : $token');
  //   });
  // }
  // Fireabase 메시지 관련 코드, 추후 필요 시 사용

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential result =
        await FirebaseAuth.instance.signInWithCredential(credential);

    User? userDetails = result.user;

    Map<String, dynamic> userInfoMap = {
      "profileUrl": "",
      "email": userDetails!.email,
      "username": userDetails.email!.replaceAll("@gmail.com", ""),
      "name": userDetails.displayName,
      "imgUrl": userDetails.photoURL
    };

    FirebaseFirestore.instance
        .collection("users")
        .doc(userDetails.uid)
        .set(userInfoMap);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Future<UserCredential> signInWithApple() async {
  //   // To prevent replay attacks with the credential returned from Apple, we
  //   // include a nonce in the credential request. When signing in with
  //   // Firebase, the nonce in the id token returned by Apple, is expected to
  //   // match the sha256 hash of `rawNonce`.
  //   // final rawNonce = generateNonce();
  //   // final nonce = sha256ofString(rawNonce);

  //   // Request credential for the currently signed in Apple account.
  //   final appleCredential = await SignInWithApple.getAppleIDCredential(
  //     scopes: [
  //       AppleIDAuthorizationScopes.email,
  //       AppleIDAuthorizationScopes.fullName,
  //     ],
  //     // nonce: nonce,
  //   );

  //   // Create an `OAuthCredential` from the credential returned by Apple.
  //   final oauthCredential = OAuthProvider("apple.com").credential(
  //     idToken: appleCredential.identityToken,
  //     accessToken: appleCredential.authorizationCode,
  //     // rawNonce: rawNonce,
  //   );

  //   // Sign in the user with Firebase. If the nonce we generated earlier does
  //   // not match the nonce in `appleCredential.identityToken`, sign in will fail.
  //   return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  // }

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    // final bgColor = Color(0xff202E38); //배경색
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    double defaultSize = valWidth * 0.0025; //폰트사이즈용

    // _firebaseCloudMessaging_Listeners();

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: valHeight * 0.25,
          ), // 가장 위 빈 공간
          // CircleAvatar(
          //   radius: valWidth * 0.12,
          //   child: Image.asset('images/app_logo.png'), //나중 여기에 앱아이콘
          //   // child: SvgPicture.asset('images/appLogo.svg'), //나중 여기에 앱아이콘
          // ),
          SizedBox(
            width: valWidth * 0.35,
            // child: Image.asset('images/app_logo.png'), //나중 여기에 앱아이콘
            // child: Image.asset('images/appLogo.png'), //나중 여기에 앱아이콘
            // child: SvgPicture.asset('images/appLogo.svg'), //나중 여기에 앱아이콘
          ),
          const SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: () {
              // print(_isChecked);
              // if (_isChecked) {
              //   // signInWithApple();
              // }
            },
            child: Container(
                height: 44,
                width: valWidth * 0.73,
                // alignment: Alignment(0, -0.2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(valWidth * 0.015),
                  color: const Color(0XFFFFFFFF),
                  // color: Color(0xff333C47),
                ),
                child: Stack(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SvgPicture.asset('images/appleLogIn.svg'),
                    ),
                    Center(
                      child: Text(
                        "Sign in with Apple",
                        style: TextStyle(
                          // color: txtColor,
                          // color: Color(0XFF000000),
                          color: Colors.black,
                          fontSize: defaultSize * 15,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ) //구글 계정 로그인 버튼
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              signInWithGoogle();
            },
            child: Container(
                height: 44,
                width: valWidth * 0.73,
                // alignment: Alignment(0, -0.2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(valWidth * 0.015),
                  // color: Color(0xff333C47),
                  color: Color(0XFFFFFFFF),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SvgPicture.asset('images/googleLogIn.svg'),
                    ),
                    Center(
                      child: Text(
                        "Sign in with Google",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: defaultSize * 15,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ) //구글 계정 로그인 버튼
                ),
          ),
        ],
      )),
    );
  }
}
