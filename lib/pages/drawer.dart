import 'package:drawer_views_project/pages/users/users.dart';
import 'package:drawer_views_project/pages/users/viewuser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoHomePage extends StatelessWidget {
  const CupertinoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    /*return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          child: Icon(CupertinoIcons.bars),
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) {
                return CupertinoDrawer();
              },
            );
          },
        ),
        middle: Text('Cupertino Drawer'),
      ),
      child: SafeArea(
        child: CupertinoButton(
          child: Icon(CupertinoIcons.add),
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) {
                return CupertinoDrawer();
              },
            );
          },
        ),
      ),
    );*/

  return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 0,90,193),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UsersPage()),
            );
          },
        ),
      ],
    ),
    
    drawer: const CupertinoDrawer(),
  );
}
}

class CupertinoDrawer extends StatelessWidget {
  const CupertinoDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 95,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
              height: 40,
            ),
            const CircleAvatar(
              radius: 42,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/icono_usuario.png'),
                backgroundColor: Color.fromARGB(255, 166, 171, 171),
                //Image.network('assets/images/icono_usuario.png').image,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Comercial',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const Text(
              'Santillana Manuel',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: const Column(
              children: [
                CircleAvatar(
                  radius: 16,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.home, color: Color.fromARGB(255, 0,90,193),),
                  ),
                ),
                Text('Principal', style: TextStyle(color: Color.fromARGB(255, 0,90,193), fontSize: 12,),),  
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
              height: 10,
            ),
          ListTile(
            title: const Column(
              children: [
                CircleAvatar(
                  radius: 16,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(CupertinoIcons.person_2_alt, color: Color.fromARGB(255, 0,90,193),),
                  ),
                ),
                Text('Usuarios', style: TextStyle(color: Color.fromARGB(255, 0,90,193), fontSize: 12,),),  
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const UsersPage()));
            },
          ),
          const SizedBox(
              height: 10,
            ),
          ListTile(
            title: const Column(
              children: [
                CircleAvatar(
                  radius: 16,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(CupertinoIcons.group, color: Color.fromARGB(255, 0,90,193),),
                  ),
                ),
                Text('Contactos', style: TextStyle(color: Color.fromARGB(255, 0,90,193), fontSize: 12,),),  
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
              height: 10,
            ),
          ListTile(
            title: const Column(
              children: [
                CircleAvatar(
                  radius: 16,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(CupertinoIcons.building_2_fill, color: Color.fromARGB(255, 0,90,193),),
                  ),
                ),
                Text('Empresas', style: TextStyle(color: Color.fromARGB(255, 0,90,193), fontSize: 12,),),  
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
              height: 10,
            ),
          ListTile(
            title: const Column(
              children: [
                CircleAvatar(
                  radius: 16,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(CupertinoIcons.square_list_fill, color: Color.fromARGB(255, 0,90,193),),
                  ),
                ),
                Text('Proyectos', style: TextStyle(color: Color.fromARGB(255, 0,90,193), fontSize: 12,),),  
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
              height: 10,
            ),
          ListTile(
            //Corregir
            contentPadding: const EdgeInsets.symmetric(horizontal: 28),
            title: const Column(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Color.fromARGB(255, 187,39,26),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.closed_caption, color: Color.fromARGB(255, 187,39,26),),
                  ),
                ),
                Text('Cerrar Sesion', style: TextStyle(color: Color.fromARGB(255, 187,39,26), fontSize: 12,),),  
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}


class CupertinoDrawer1 extends StatelessWidget {
  const CupertinoDrawer1({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 199,195,202),
      width: 159,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            title: const Text('Contactos', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Empresas', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Proyectos', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Usuarios', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const UsersPage()));
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}