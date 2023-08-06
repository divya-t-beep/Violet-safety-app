import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../child_login_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  goTo(context, LoginScreen());
                } on FirebaseAuthException catch (e) {
                  dialogueBox(context, e.toString());
                }
              },
              child: Text(
                "SIGN OUT",
              ))),
    );
  }
}
/*
class CheckUserStatusBeforeChatOnProfile extends StatelessWidget {
  const CheckUserStatusBeforeChatOnProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          if (snapshot.hasData) {
            return ProfilePage();
          } else {
            Fluttertoast.showToast(msg: 'please login first');
            return LoginScreen();
          }
        }
      },
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameC = TextEditingController();
  final key = GlobalKey<FormState>();
  String? id;
  String? profilePic;
  String? downloadUrl;
  bool isSaving = false;
  getDate() async {
    await FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        nameC.text = value.docs.first['name'];
        id = value.docs.first.id;
        profilePic = value.docs.first['profilePic'];
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isSaving == true
          ? Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.pink,
            ))
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                  child: Form(
                      key: key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "UPDATE YOUR PROFILE",
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(height: 15),
                          GestureDetector(
                            onTap: () async {
                              final XFile? pickImage = await ImagePicker()
                                  .pickImage(
                                      source: ImageSource.gallery,
                                      imageQuality: 50);
                              if (pickImage != null) {
                                setState(() {
                                  profilePic = pickImage.path;
                                });
                              }
                            },
                            child: Container(
                              child: profilePic == null
                                  ? CircleAvatar(
                                      backgroundColor: Colors.deepPurple,
                                      radius: 80,
                                      child: Center(
                                          child: Image.asset(
                                        'assets/profile.png',
                                        height: 80,
                                        width: 80,
                                      )),
                                    )
                                  : profilePic!.contains('http')
                                      ? CircleAvatar(
                                          backgroundColor: Colors.deepPurple,
                                          radius: 80,
                                          backgroundImage:
                                              NetworkImage(profilePic!),
                                        )
                                      : CircleAvatar(
                                          backgroundColor: Colors.deepPurple,
                                          radius: 80,
                                          backgroundImage:
                                              FileImage(File(profilePic!))),
                            ),
                          ),
                          CustomTextField(
                            controller: nameC,
                            hintText: nameC.text,
                            validate: (v) {
                              if (v!.isEmpty) {
                                return 'please enter your updated name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 25),
                          PrimaryButton(
                              title: "UPDATE",
                              onPressed: () async {
                                if (key.currentState!.validate()) {
                                  SystemChannels.textInput
                                      .invokeMethod('TextInput.hide');
                                  profilePic == null
                                      ? Fluttertoast.showToast(
                                          msg: 'please select profile picture')
                                      : update();
                                }
                              })
                        ],
                      )),
                ),
              ),
            ),
    );
  }

 

  
}
*/