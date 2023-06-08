import 'package:drawer_views_project/pages/companies/addcompany.dart';
import 'package:drawer_views_project/pages/addproject.dart';
import 'package:drawer_views_project/pages/users/adduser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CButtonAdd extends StatelessWidget {
  const CButtonAdd({super.key, required this.moduleNombre});
  final String moduleNombre;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: CupertinoButton(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        color: const Color.fromARGB(255, 0, 90, 193),
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
          moduleNombre == 'Usuario'
              ? Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => const AddUser()))
              : moduleNombre == 'Proyecto'
                  ? Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const AddProject()))
                  : moduleNombre == 'Proyecto'
                      ? Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const AddProject()))
                      : Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const AddProject()));
        },
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.label,
    this.onSucess,
    required this.route,
  });
  final String label;
  final void Function()? onSucess;
  final Widget route;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: CupertinoButton(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        color: const Color.fromARGB(255, 0, 90, 193),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(CupertinoIcons.add, color: CupertinoColors.white),
            const SizedBox(width: 8),
            Text(label,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: CupertinoColors.white)),
          ],
        ),
        onPressed: () async {
          if (label == 'Empresa')
          {
            bool? sucess = await showDialog(
              context: context, 
              builder: (context){
                return const AddCompany();
              }) as bool?;

              if (sucess == true) {
                onSucess?.call();
              }
          }
          else
          {
            bool? sucess = await Navigator.push(
                  context, CupertinoPageRoute(builder: (context) => route))
              as bool?;
          
              if (sucess == true) {
                onSucess?.call();
              }
          }
        },
      ),
    );
  }
}
