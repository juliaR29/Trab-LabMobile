import 'package:flutter/material.dart';
import 'package:proj/components/orgs_drawer.dart';
import 'package:proj/db/database_helper.dart';

class AnimalsCadScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final dbHelper = DatabaseHelper.instance;
  TextEditingController animalNameController = new TextEditingController();
  TextEditingController animalDescController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: OrgsDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cadastro de pets',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  IconButton(
                    color: Colors.transparent,
                    icon: Icon(Icons.menu, color: Colors.black),
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Nome:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                height: 50,
                margin: EdgeInsets.all(12),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                    ),
                    new Expanded(
                      child: TextField(
                        controller: animalNameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          isDense: true,
                        ),
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Descrição:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                height: 50,
                margin: EdgeInsets.all(12),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                    ),
                    new Expanded(
                      child: TextField(
                        controller: animalDescController,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        ),
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                child: Text('Inserir dados'),
                onPressed: () {_inserir();},
              ),
              ElevatedButton(
                child: Text('Consultar dados', style: TextStyle(fontSize: 20),),
                onPressed: () {_consultar();},
              ),
              ElevatedButton(
                child: Text('Atualizar dados', style: TextStyle(fontSize: 20),),
                onPressed: () {_atualizar();},
              ),
              ElevatedButton(
                child: Text('Deletar dados', style: TextStyle(fontSize: 20),),
                onPressed: () {_deletar();},
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _inserir() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnNome: animalNameController.text,
      DatabaseHelper.columnDesc: animalDescController.text,
    };
    final id = await dbHelper.insert(row);
    print('linha inserida id: $id');
  }

  void _consultar() async {
    final todasLinhas = await dbHelper.queryAllRows();
    print('Consulta todas as linhas:');
    todasLinhas.forEach((row) => print(row));
  }

  void _atualizar() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: 1,
      DatabaseHelper.columnNome: 'Maria',
    };
    final linhasAfetadas = await dbHelper.update(row);
    print('atualizadas $linhasAfetadas linha(s)');
  }

  void _deletar() async {
    // Assumindo que o numero de linhas é o id para a última linha
    final id = await dbHelper.queryRowCount();
    final linhaDeletada = await dbHelper.delete(id);
    print('Deletada(s) $linhaDeletada linha(s): linha $id');
  }
}
