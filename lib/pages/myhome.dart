import 'package:drawer_views_project/pages/companies/addcompany.dart';
import 'package:drawer_views_project/pages/companies/companies.dart';
import 'package:drawer_views_project/pages/contacts.dart';
import 'package:drawer_views_project/pages/drawer.dart';
import 'package:drawer_views_project/pages/proyects.dart';
import 'package:drawer_views_project/pages/users/users.dart';
import 'package:flutter/cupertino.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Principal',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_2_alt),
              label: 'Usuarios',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.group),
              label: 'Contactos',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.building_2_fill),
              label: 'Empresas',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.square_list_fill),
              label: 'Proyectos',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return const CupertinoHomePage();
            case 1:
              return const UsersPage();
            case 2:
              return const ContactsPage();
            case 3:
              return const CompaniesPage();
            case 4:
              return const ProyectsPage();
            default:
              return const AddCompany();
          }
        },
      ),
    );
  }
}
/*
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'PRINCIPAL',
        ),
        backgroundColor: const Color(0x00ffffff),
      ),
      drawer: Drawer(
        child: ListView(

          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 40,
            ),
            const CircleAvatar(
              radius: 65,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/icono_usuario.png'),
                backgroundColor: Colors.cyanAccent,
                //Image.network('assets/images/icono_usuario.png').image,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Comercial',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Text(
              'Santillana Manuel',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.contacts,
              ),
              title: const Text('Contactos'),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const ContactsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.business,
              ),
              title: const Text('Empresas'),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => CompaniesPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.work,
              ),
              title: const Text('Proyectos'),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const ProyectsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
              ),
              title: const Text('Usuarios'),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const UsersPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.closed_caption),
              title: const Text('Cerrar Sesion'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('PAGINA PRINCIPAL', style: TextStyle(fontSize: 30),)
          ],
        ),
      ),
    );
  }  
}
*/