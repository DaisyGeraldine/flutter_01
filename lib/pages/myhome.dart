import 'package:drawer_views_project/pages/companies.dart';
import 'package:drawer_views_project/pages/contacts.dart';
import 'package:drawer_views_project/pages/proyects.dart';
import 'package:drawer_views_project/pages/users.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State < MyHomePage >{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  MaterialPageRoute(builder: (context) => const CompaniesPage()),
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