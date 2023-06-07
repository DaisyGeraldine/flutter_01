import 'dart:math';

import 'package:drawer_views_project/DataBase/db.dart';
import 'package:drawer_views_project/widgets/widgetbuttonAdd.dart';
import 'package:drawer_views_project/widgets/widgetsearchtextfield.dart';
import 'package:drawer_views_project/widgets/widgettable.dart';
import 'package:flutter/cupertino.dart';
class CompaniesPage extends StatefulWidget {
  const CompaniesPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CompaniesPage createState() => _CompaniesPage();
}

class _CompaniesPage extends State < CompaniesPage >{

  DBase dbase = DBase();
  List<Map<String, dynamic>> companiesL = [];
  int currentPage = 1;

  @override
  void initState() {
    _loadCompanies();
    super.initState();
  }

  _loadCompanies() async {
    List<Map<String, dynamic>> auxCompanies = await dbase.queryCompaniesView();
    int startIndex = (currentPage - 1) * 6;
    int endIndex = min(startIndex + 6, auxCompanies.length);
    int maxPage = (auxCompanies.length~/6) + 1;

    setState(() {
      print('conteo company : ' + maxPage.toString());

      if (maxPage >= currentPage && currentPage > 0) {
        companiesL = auxCompanies.sublist(startIndex, endIndex);
      }
    }
    );
  }
  
  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Empresas', style: TextStyle(color: CupertinoColors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(174, 7, 18, 230),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: (){},
          child: const Icon(CupertinoIcons.person),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const CSearchTextField(moduleNombre: 'Empresas'),
              const SizedBox(height: 25,),
              CTable(
                moduleNombre: 'Empresas', 
                recordsList: companiesL, 
                tableType: TableType.companies,
                nextPageCallback: () {
                  setState(() {
                    currentPage++;
                    print('pag : ' + currentPage.toString());
                    _loadCompanies();
                  });
                },
                previousPageCallback: () {
                  setState(() {
                    currentPage--;
                    print('pag : ' + currentPage.toString());
                    _loadCompanies();
                  });
                },
                deleteCallback: (id) {
                  dbase.delete(id);
                  _loadCompanies();
                },
              ),
              const SizedBox(height: 25,),
              const CButtonSearch(moduleNombre: 'Empresa')
            ],
          ),
        ),
      ),
    );
  }
}