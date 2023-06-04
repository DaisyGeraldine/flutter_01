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

  @override
  void initState() {
    _loadCompanies();
    super.initState();
  }

  _loadCompanies() async {
    List<Map<String, dynamic>> auxCompanies = await dbase.queryCompanies();

    setState(() {
      companiesL = auxCompanies;
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
              CTable(moduleNombre: 'Empresas', recordsList: companiesL, tableType: TableType.companies,),
              const SizedBox(height: 25,),
              const CButtonSearch(moduleNombre: 'Empresa')
            ],
          ),
        ),
      ),
    );
  }
}