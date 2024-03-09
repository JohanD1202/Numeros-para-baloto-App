import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuScreen extends StatelessWidget {
  static const name = 'menu-screen';
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: const LeadingCustom(),
          title: Image.asset(
            'assets/MENU.png',
            width: 150,
          ),
        ),
        body: SizedBox(
          height: size.height * 1,
          width: size.width * 1,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () => context.push('/menuinterior'),
                      child: Image.asset(
                        'assets/logoBaloto.png',
                        width: 200,
                      )),
                  const SizedBox(height: 50),
                  GestureDetector(
                      onTap: () => context.push('/menuinterior2'),
                      child: Image.asset(
                        'assets/revancha.png',
                        width: 200,
                      )),
                  const SizedBox(height: 50),
                  GestureDetector(
                      onTap: () => context.push('/menuinterior3'),
                      child: Image.asset(
                        'assets/miloto.png',
                        width: 200,
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}

class LeadingCustom extends StatelessWidget {
  const LeadingCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Icon(Icons.arrow_back_rounded)),
    );
  }
}
