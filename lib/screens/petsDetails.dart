import 'package:flutter/material.dart';
import 'package:proj/models/package_model.dart';
import 'package:proj/models/producer_model.dart';

class PetsDetailsScreen extends StatelessWidget {
  final Producer producer;
  PetsDetailsScreen({@required this.producer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 16, 95, 160),
        title: Text(
          'Informações do pet',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 150, 20, 15),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(producer.logo),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(
                      producer.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                producer.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Text(
              'Idade: 30 dias',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          //   child: Text(producer.vacina,
          //       style: TextStyle(color: Colors.black, fontSize: 18)),
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(producer.description,
                style: TextStyle(color: Colors.black, fontSize: 18)),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: ListView(
                children: _generatePackageList(context, producer.packages)),
          )),
        ],
      ),
    );
  }

  List _generatePackageList(BuildContext context, List packages) {
    List<Widget> children = [];
    for (final package in packages) {
      final pack = Package.fromJson(package);

      // children.add(InkWell(
      //   onTap: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => PackageDetailsScreen(
      //       package: pack,
      //       producer: producer,
      //     )),
      //   ),
      //   child: OrgsPackagesCard(
      //     title: pack.title,
      //     price: pack.price,
      //     description: pack.description,
      //   ),
      // ));
    }

    return children;
  }
}
