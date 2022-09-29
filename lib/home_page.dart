import 'package:flutter/material.dart';
import 'package:hello_mundo/app_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                    'https://avatars.githubusercontent.com/u/31391753')),
            accountName: const Text("Lameco Sanders"),
            accountEmail: const Text('lameco@gmail.com'),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Início"),
            subtitle: const Text('Tela de Início'),
            onTap: () {
              print('Home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Logout"),
            subtitle: const Text('Finalizar Sessão'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ]),
      ),
      appBar: AppBar(
        title: const Text('HomePage'),
        actions: const [
          CustomSwitch(),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Contador: $counter'),
          const CustomSwitch(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: 50, height: 50, color: Colors.black),
              Container(width: 50, height: 50, color: Colors.black),
              Container(width: 50, height: 50, color: Colors.black)
            ],
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDarkTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
        print(AppController.instance.isDarkTheme);
      },
    );
  }
}
