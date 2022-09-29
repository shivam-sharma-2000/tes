import 'package:flutter/material.dart';

class LoginPageUI extends StatefulWidget {
  const LoginPageUI({Key? key}) : super(key: key);

  @override
  State<LoginPageUI> createState() => _LoginPageUIState();
}

class _LoginPageUIState extends State<LoginPageUI> {

  Color white = Colors.white;
  String title = "";

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom !=0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1C5E9B),
        title: CreateTitle(isKeyboard),
        elevation: 0.0,
      ),
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if(!isKeyboard) CreateClip(),
              const SizedBox(
                height: 40.0,
              ),
              InputField(
                text: "email or phone",
                icon: Icons.email,
              ),
              InputField(
                text: "password",
                icon: Icons.key,
              ),
              const CreateForgotPassword(),
              const CreateButton(),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account ?'),
                    SizedBox(width: 5,),
                    Text('Register', style: TextStyle(
                      color: Color(0xFF1C5E9B),
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
              const SizedBox(
                height: 100.0,
              ),
              const CreateLogo(),
              const SizedBox( height: 10,),
              const Text('By signing up, you agree with our Terms & Conditions and Privacy Policy', textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
    );
  }
}


class CreateTitle extends StatelessWidget {

  bool isKeyboard;
  CreateTitle(this.isKeyboard);


  @override
  Widget build(BuildContext context) {
    String title = "";
    if(isKeyboard){
      title = 'Disha Kiran';
    }

    return Text(title ,
      textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),);
  }

}

class Clipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height-20);
    var firstStart = Offset(size.width/3, size.height-60);
    var firstEnd = Offset(size.width-120, size.height-20);
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var SecondStart = Offset(size.width-70, size.height);
    var SecondEnd = Offset(size.width, size.height-10);
    path.quadraticBezierTo(SecondStart.dx, SecondStart.dy, SecondEnd.dx, SecondEnd.dy);
    path.lineTo(size.width, 0);
    // var secondStart = Offset(dx, dy)
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}

class InputField extends StatelessWidget {
  InputField({required this.text , required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            maxLines: 1,
            decoration: InputDecoration(
                labelText: 'Enter your $text',
                border: const OutlineInputBorder(),
                prefixIcon: Icon(icon),
                hintStyle: const TextStyle(color: Colors.black26)
            ),
          ),
        ],
      ),
    );
  }
}

class CreateClip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Clipper1(),
      child: Container(
          color: Color(0xFF1C5E9B),
          height: 150,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text('Disha Kiran',
              textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
          )
      ),
    );
  }
}

class CreateForgotPassword extends StatelessWidget {
  const CreateForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, top: 20, right: 15),
      child: Text('Forgot Password?',textAlign: TextAlign.right ,style: TextStyle(color: Color(0xFF1C5E9B)),),
    );
  }
}

class CreateButton extends StatelessWidget {
  const CreateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
      child: Card(
        child: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'LOGIN',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white),
          ),
        ),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        color: const Color(0xFF1C5E9B),
      ),
    );
  }
}

class CreateLogo extends StatelessWidget {
  const CreateLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        'assets/ic_logo_tm.webp',
        width: 400.0,
        height: 60.0
    );
  }
}

