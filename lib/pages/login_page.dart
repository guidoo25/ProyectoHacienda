import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/components/square_tile.dart';
import 'package:modernlogintute/providers/authProvider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // logo
              Container(
                child: Lottie.network('https://assets4.lottiefiles.com/packages/lf20_bqairpql.json',


                ),
                width: 200,
                height: 200,
              ),


              const SizedBox(height: 50),

              // welcome back, you've been missed!
              Text(
                'Bienvenido Identificate!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Usuario',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Contraseña',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),
            ElevatedButton.icon(onPressed:(){
              Provider.of<AuthService>(context, listen: false).Login(usernameController.text, passwordController.text);
              print(usernameController.text);
              print(passwordController.text);

            }, icon:Icon(Icons.key), label: Text('Iniciar Sesion '), ),

              // sign in button
             
              const SizedBox(height: 50),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Herramientas utilizadas',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // google + apple sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // google button
                  SquareTile(imagePath: 'https://attend.ieee.org/etcm-2020/wp-content/uploads/sites/196/2018/09/UPS-Logo.png'),

                  SizedBox(width: 25),
                  SquareTile(imagePath: 'https://th.bing.com/th/id/OIP.5x0bqIWJZ0Q912i6olkDLwHaEK?pid=ImgDet&rs=1'),
                  SizedBox(width: 25),
                  SquareTile(imagePath: 'https://th.bing.com/th/id/OIP.131bGDhdJzSeVB5Oit-s8wHaHa?pid=ImgDet&w=1600&h=1600&rs=1'),

                ],
              ),

              const SizedBox(height: 50),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No eres miembro?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Contactate con el Administrador',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
