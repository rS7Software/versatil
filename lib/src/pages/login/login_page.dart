import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/material/icons.dart';

import '../../utilities/colors.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_textfield.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _controller = new LoginController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colores.backgroundColor,
        child: Column(
          children: [
            _imageBanner(),
            _textFieldUsername(),
            _textFieldPassword(),
            _button(),
            _registro()
          ]
        ),
      )
    );
  }

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      height: MediaQuery
          .of(context)
          .size
          .height * .3,
      child: Image.asset(
        'assets/img/POSBanner.png',
        width: 400,
        height: 400,
      ),
    );
  }

  Widget _textFieldUsername() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      height: MediaQuery
          .of(context)
          .size
          .height * .1,
      child: DefaultTextfield(
        initialValue: "",
        onChanged: (value) {},
        error: "",
        label: 'Coloque aquí su nombre de usuario.',
        icon: Icon(
          Icons.person_outline,
        ),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      height: MediaQuery
          .of(context)
          .size
          .height * .1,
      child: DefaultTextfield(
        initialValue: "",
        onChanged: (value) {},
        error: "",
        label: 'Coloque aquí su contraseña.',
        icon: Icon(
          Icons.lock_open,
        ),
      ),
    );
  }

  Widget _button() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      height: MediaQuery
          .of(context)
          .size
          .height * .06,
      child: DefaultButton(
        text: 'Ingresar          ',
        icon: Icons.login,
        onPressed: () {
          _controller.login();
        },
      ),


    );
  }

  Widget _registro() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("No tienes cuenta?",
          style: TextStyle(
            color: Colores.backgroundColor,
          ),
        ),
        const SizedBox(width: 7),
        GestureDetector(
          onTap: () {
            //_controller.goToRegisterPage();
          },
          child: Text(
            "Registrarse",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colores.backgroundColor,
            ),
          ),
        ),
      ],
    );
  }

}
