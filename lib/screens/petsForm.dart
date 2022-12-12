import 'package:flutter/material.dart';
import 'package:proj/components/menuDrawer.dart';
import 'package:proj/db/database_helper.dart';

class PetsForm extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final dbHelper = DatabaseHelper.instance;
  TextEditingController animalNameController = new TextEditingController();
  TextEditingController animalDescController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(),
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
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                height: 50,
                margin: EdgeInsets.all(12),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                    ),
                    new Expanded(
                      child: TextField(
                        controller: animalNameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.black),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          isDense: true,
                        ),
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Raça:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                height: 50,
                margin: EdgeInsets.all(12),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                    ),
                    new Expanded(
                      child: TextField(
                        controller: animalNameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.black),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          isDense: true,
                        ),
                        style: TextStyle(
                          fontSize: 16.0,
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
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                height: 50,
                margin: EdgeInsets.all(12),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                    ),
                    new Expanded(
                      child: TextField(
                        controller: animalDescController,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.black),
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        ),
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, foregroundColor: Colors.white),
                child: Text('Salvar'),
                onPressed: () {_inserir();},
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, foregroundColor: Colors.white),
                child: Text('Cancelar'),
                onPressed: () {_inserir();},
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
    final id = await dbHelper.queryRowCount();
    final linhaDeletada = await dbHelper.delete(id);
    print('Deletada(s) $linhaDeletada linha(s): linha $id');
  }
}
