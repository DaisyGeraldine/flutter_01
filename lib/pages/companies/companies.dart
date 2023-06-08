import 'dart:math';
import 'package:drawer_views_project/DataBase/db.dart';
import 'package:drawer_views_project/pages/companies/addcompany.dart';
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
  List<Map<String, dynamic>> allCompanies = [];
  int currentPage = 1;

  @override
  void initState() {
    _loadCompanies();
    super.initState();
  }

  _loadCompanies() async {
    List<Map<String, dynamic>> auxCompanies = await dbase.queryCompaniesView();
    allCompanies = auxCompanies;

    setState(() {});
  }

  List<Map<String, dynamic>> get companiesL {
    int startIndex = (currentPage - 1) * 6;
    int endIndex = min(startIndex + 6, allCompanies.length);
    return allCompanies.sublist(startIndex, endIndex);
  }

  int get elementCounter {
    return allCompanies.length;
  }

  int get maxPages {
    return (elementCounter / 6).ceil();
  }
  
  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Empresas', 
          style: TextStyle(
            color: CupertinoColors.white, 
            fontSize: 20, 
            fontWeight: FontWeight.bold)),
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
              CSearchTextField(
                moduleNombre: 'Empresas',
                onChanged: (value) {
                  onChangegSearch(value);
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: CTable(
                  moduleNombre: 'Empresas', 
                  recordsList: companiesL, 
                  tableType: TableType.companies,
                  nextPageCallback: onTapNextPage,
                  previousPageCallback: () {
                    currentPage--;
                    currentPage = currentPage.clamp(1, maxPages);
                    setState(() {});
                  },
                  deleteCallback: (id) {
                    dbase.delete('company',id);
                    _loadCompanies();
                  },
                  itemsPerPage: currentPage,
                ),
              ),
              const SizedBox(height: 25,),
              AddButton(
                label: 'Empresa',
                route: const AddCompany(),
                onSucess: onSucessNewCompany,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapNextPage() {
    currentPage++;
    currentPage = currentPage.clamp(1, maxPages);
    setState(() {});
  }

  void onChangegSearch(String value) async {
    print('companies.dart:' + value);

    currentPage = 1;
    List<Map<String, dynamic>> results = await dbase.queryCompaniesbyName(value);
    allCompanies = results;
    setState(() {});
  }

  void onSucessNewCompany() {
    print('Nueva empresa creada');
    _loadCompanies();
  }

}