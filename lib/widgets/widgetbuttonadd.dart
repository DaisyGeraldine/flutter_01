import 'package:drawer_views_project/pages/companies/addcompany.dart';
import 'package:drawer_views_project/pages/addproject.dart';
import 'package:drawer_views_project/pages/users/adduser.dart';
import 'package:flutter/cupertino.dart';

class CButtonSearch extends StatelessWidget {
  const CButtonSearch({super.key, required this.moduleNombre});
  final String moduleNombre;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: CupertinoButton(
        color: const Color.fromARGB(255,0,90,193),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(CupertinoIcons.add, color: CupertinoColors.white),
            const SizedBox(width: 8),
            Text(moduleNombre,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: CupertinoColors.white)),
          ],
        ),
        onPressed: () {
          Navigator.push(
              context,
              moduleNombre == 'Usuario'
                  ? CupertinoPageRoute(builder: (context) => const AddUser())
                  : moduleNombre == 'Proyecto'
                      ? CupertinoPageRoute(
                          builder: (context) => const AddProject())
                      : CupertinoDialogRoute(
                          context: context,
                          //builder: (context) => const AddCompany(
                          builder: (context) => const AddCompany(),
                        ));
        },
      ),
    );
  }
}
