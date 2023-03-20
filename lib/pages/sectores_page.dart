import 'package:dashboard/providers/sectores_provider.dart';
import 'package:dashboard/providers/sucursales_provider.dart';
import 'package:dashboard/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SectoresPage extends StatefulWidget {
  final String pageName;
  const SectoresPage({Key? key, required this.pageName}) : super(key: key);

  @override
  State<SectoresPage> createState() => _SectoresPageState(pageName: pageName);
}

class _SectoresPageState extends State<SectoresPage> {
  final String pageName;
  List<Map<String, dynamic>> _data = [
    {'id': 1, 'sector': 'Recepcion', 'sucursal': 'Policlinico'},
    {'id': 2, 'sector': 'Admision Interna', 'sucursal': 'Sanatorio'},
    {'id': 3, 'sector': 'Admision', 'sucursal': 'La paz'},
    {'id': 1, 'sector': 'Recepcion', 'sucursal': 'Policlinico'},
    {'id': 2, 'sector': 'Admision Interna', 'sucursal': 'Sanatorio'},
    {'id': 3, 'sector': 'Admision', 'sucursal': 'La paz'},
    {'id': 1, 'sector': 'Recepcion', 'sucursal': 'Policlinico'},
    {'id': 2, 'sector': 'Admision Interna', 'sucursal': 'Sanatorio'},
    {'id': 3, 'sector': 'Admision', 'sucursal': 'La paz'},
    {'id': 1, 'sector': 'Recepcion', 'sucursal': 'Policlinico'},
    {'id': 2, 'sector': 'Admision Interna', 'sucursal': 'Sanatorio'},
    {'id': 3, 'sector': 'Admision', 'sucursal': 'La paz'},
    {'id': 1, 'sector': 'Recepcion', 'sucursal': 'Policlinico'},
    {'id': 2, 'sector': 'Admision Interna', 'sucursal': 'Sanatorio'},
    {'id': 3, 'sector': 'Admision', 'sucursal': 'La paz'},
    {'id': 1, 'sector': 'Recepcion', 'sucursal': 'Policlinico'},
    {'id': 2, 'sector': 'Admision Interna', 'sucursal': 'Sanatorio'},
    {'id': 3, 'sector': 'Admision', 'sucursal': 'La paz'},
  ];

  List<DataColumn> _columns = [
    DataColumn(label: Text('ID')),
    DataColumn(label: Text('Sector')),
    DataColumn(label: Text('sucursal')),
    DataColumn(label: Text('Acciones')),
  ];

  TextEditingController _nameController = TextEditingController();
  TextEditingController _sucursalController = TextEditingController();

  _SectoresPageState({required this.pageName});

  void _showEditPopup(Map<String, dynamic> data) {
    _nameController.text = data['sector'];
    _sucursalController.text = data['sucursal'];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar Informacion'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Sector',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _sucursalController,
                decoration: InputDecoration(
                  labelText: 'sucursal',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.red.shade200),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Guardar'),
              onPressed: () {
                // Save edited data action here
                data['sector'] = _nameController.text;
                data['sucursal'] = _sucursalController.text;
                Navigator.of(context).pop();
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }

  void _showDeletePopup(Map<String, dynamic> data) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
            'Desea eliminar a "${data['sector']} de ${data['sucursal']}"?'),
        actions: [
          TextButton(
            onPressed: () {
              // Delete data action here
              setState(() {
                _data.removeWhere((element) => element['id'] == data['id']);
                Navigator.pop(context);
              });
              print('Deleting data with id ${data['id']}');
            },
            child: Text(
              'Si',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('no'))
        ],
      ),
    );
  }

  void _newSectorPopup() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Nuevo Sector'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Sector',
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancelar',
              style: TextStyle(color: Colors.red.shade200),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Guardar'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sucursalProvider = Provider.of<SucursalesProvider>(context);
    final sectorProvider = Provider.of<SectoresProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(pageName),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: _columns,
            rows: _data
                .map(
                  (data) => DataRow(
                    cells: [
                      DataCell(Text(data['id'].toString())),
                      DataCell(Text(data['sector'])),
                      DataCell(Text(data['sucursal'])),
                      DataCell(
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit,
                                  color: Colors.amber.shade300),
                              onPressed: () {
                                _showEditPopup(data);
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red.shade300,
                              ),
                              onPressed: () {
                                _showDeletePopup(data);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _newSectorPopup(),
          child: Icon(
            Icons.add,
            size: 25,
          )),
    );
  }
}
