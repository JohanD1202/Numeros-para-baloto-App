import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:numeros_para_baloto_app/presentation/screens/text_style.dart';

class FilledButtonIniciar extends StatelessWidget {

  const FilledButtonIniciar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => context.push('/menu'), 
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 34, 67, 250))
      ),
      child: Text(
        'INICIAR',
        style: personalizado(),
      )
    );
  }
}

class FilledButtonBaloto extends StatelessWidget {

  const FilledButtonBaloto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.red)
      ), 
      child: Text(
        'Baloto',
        style: personalizado(),
      ),
    );
  }
}

class FilledButtonMiBaloto extends StatelessWidget {

  const FilledButtonMiBaloto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white)
      ), 
      child: Text(
        'MI BALOTO',
        style: personalizado(),
      ),
    );
  }
}

class FilledButtonBaloto2 extends StatelessWidget {

  const FilledButtonBaloto2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => context.push('/baloto'),
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.red)
      ), 
      child: Text(
        'Baloto',
        style: personalizado(),
      ),
    );
  }
}

class FilledButtonRevancha extends StatelessWidget {

  const FilledButtonRevancha({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => context.push('/revancha'),
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 255, 251, 0))
      ), 
      child: Text(
        'REVANCHA!',
        style: personalizado5(),
      ),
    );
  }
}

class FilledButtonRevancha2 extends StatelessWidget {

  const FilledButtonRevancha2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 255, 251, 0))
      ), 
      child: Text(
        'REVANCHA!',
        style: personalizado3(),
      ),
    );
  }
}

class FilledButtonMiLoto extends StatelessWidget {

  const FilledButtonMiLoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => context.push('/mi_loto'),
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 47, 44, 240))
      ), 
      child: Text(
        'MiLoto',
        style: personalizado4(),
      ),
    );
  }
}

class FilledButtonMiLoto2 extends StatelessWidget {

  const FilledButtonMiLoto2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 47, 44, 240))
      ), 
      child: Text(
        'MiLoto',
        style: personalizado7(),
      ),
    );
  }
}

class FilledButtonGeneradorBaloto extends StatelessWidget {

  const FilledButtonGeneradorBaloto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => context.push('/generador_numeros_baloto'),
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white)
      ), 
      child: Text(
        'GENERADOR DE NÚMEROS',
        style: personalizado8(),
      ),
    );
  }
}

class FilledButtonResultadosBaloto extends StatelessWidget {

  const FilledButtonResultadosBaloto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white)
      ), 
      child: Text(
        'RESULTADOS',
        style: personalizado8(),
      ),
    );
  }
}

class FilledButtonComprarBaloto extends StatelessWidget {

  const FilledButtonComprarBaloto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white)
      ), 
      child: Text(
        'COMPRAR',
        style: personalizado8(),
      ),
    );
  }
}


class FilledButtonGeneradorRevancha extends StatelessWidget {

  const FilledButtonGeneradorRevancha({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white)
      ), 
      child: Text(
        'GENERADOR DE NÚMEROS',
        style: personalizado8(),
      ),
    );
  }
}


class FilledButtonResultadosRevancha extends StatelessWidget {

  const FilledButtonResultadosRevancha({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white)
      ), 
      child: Text(
        'RESULTADOS',
        style: personalizado8(),
      ),
    );
  }
}

class FilledButtonComprarRevancha extends StatelessWidget {

  const FilledButtonComprarRevancha({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white)
      ), 
      child: Text(
        'COMPRAR',
        style: personalizado8(),
      ),
    );
  }
}


class FilledButtonGeneradorMiLoto extends StatelessWidget {

  const FilledButtonGeneradorMiLoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white)
      ), 
      child: Text(
        'GENERADOR DE NÚMEROS',
        style: personalizado8(),
      ),
    );
  }
}

class FilledButtonResultadosMiLoto extends StatelessWidget {

  const FilledButtonResultadosMiLoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white)
      ), 
      child: Text(
        'RESULTADOS',
        style: personalizado8(),
      ),
    );
  }
}


class FilledButtonComprarMiLoto extends StatelessWidget {

  const FilledButtonComprarMiLoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white)
      ), 
      child: Text(
        'COMPRAR',
        style: personalizado8(),
      ),
    );
  }
}