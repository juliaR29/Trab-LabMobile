import 'package:flutter/material.dart';
import 'package:proj/components/menuDrawer.dart';
import 'package:proj/db/database_helper.dart';

class PetsForm extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final dbHelper = DatabaseHelper.instance;
  TextEditingController nomeController = new TextEditingController();
  TextEditingController racaController = new TextEditingController();
  TextEditingController descricaoController = new TextEditingController();
  TextEditingController idadeController = new TextEditingController();
  TextEditingController dataResgateController = new TextEditingController();
  TextEditingController vacinacaoController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
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
                        color: Color.fromARGB(255, 16, 95, 160)),
                  ),
                  IconButton(
                    color: Colors.transparent,
                    icon: Icon(Icons.menu, color: Colors.black),
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  ),
                ],
              ),
              SizedBox(height: 20),
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
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromARGB(255, 74, 75, 74),
                    width: 1,
              ), 
                ),
                height: 40,
                margin: EdgeInsets.all(1),
                child: Row(
                  children: <Widget>[
                    new Expanded(
                      child: TextField(
                        controller: nomeController,
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
              SizedBox(height: 15),
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
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromARGB(255, 74, 75, 74),
                    width: 1,
              ), 
                ),
                height: 40,
                margin: EdgeInsets.all(1),
                child: Row(
                  children: <Widget>[
                    new Expanded(
                      child: TextField(
                        controller: racaController,
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
              SizedBox(height: 15),
              Text(
                'Idade:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromARGB(255, 74, 75, 74),
                    width: 1,
              ), 
                ),
                height: 40,
                margin: EdgeInsets.all(1),
                child: Row(
                  children: <Widget>[
                    new Expanded(
                      child: TextField(
                        controller: idadeController,
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
              SizedBox(height: 15),
              Text(
                'Data de resgate:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromARGB(255, 74, 75, 74),
                    width: 1,
              ), 
                ),
                height: 40,
                margin: EdgeInsets.all(1),
                child: Row(
                  children: <Widget>[
                    new Expanded(
                      child: TextField(
                        controller: dataResgateController,
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
              SizedBox(height: 15),
              Text(
                'Vacinação:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromARGB(255, 74, 75, 74),
                    width: 1,
              ), 
                ),
                height: 40,
                margin: EdgeInsets.all(1),
                child: Row(
                  children: <Widget>[
                    new Expanded(
                      child: TextField(
                        controller: vacinacaoController,
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
              SizedBox(height: 15),
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
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromARGB(255, 74, 75, 74),
                    width: 1,
              ), 
                ),
                height: 40,
                margin: EdgeInsets.all(1),
                child: Row(
                  children: <Widget>[
                    new Expanded(
                      child: TextField(
                        controller: descricaoController,
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
              SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white),
                child: Text('Salvar'),
                onPressed: () {
                  _inserir();
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, foregroundColor: Colors.white),
                child: Text('Cancelar'),
                onPressed: () {
                  _inserir();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _inserir() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnNome: nomeController.text,
      DatabaseHelper.columnDesc: descricaoController.text,
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
