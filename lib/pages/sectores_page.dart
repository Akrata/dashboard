import 'package:flutter/material.dart';

class SectoresPage extends StatefulWidget {
  const SectoresPage({Key? key}) : super(key: key);

  @override
  State<SectoresPage> createState() => _SectoresPageState();
}

class _SectoresPageState extends State<SectoresPage> {
  List<Map<String, dynamic>> _data = [
    {'id': 1, 'name': 'John Doe', 'email': 'johndoe@example.com'},
    {'id': 2, 'name': 'Jane Smith', 'email': 'janesmith@example.com'},
    {'id': 3, 'name': 'Bob Johnson', 'email': 'bobjohnson@example.com'},
  ];

  List<DataColumn> _columns = [
    DataColumn(label: Text('ID')),
    DataColumn(label: Text('Name')),
    DataColumn(label: Text('Email')),
    DataColumn(label: Text('Actions')),
  ];

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  void _showEditPopup(Map<String, dynamic> data) {
    _nameController.text = data['name'];
    _emailController.text = data['email'];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Data'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                // Save edited data action here
                data['name'] = _nameController.text;
                data['email'] = _emailController.text;
                Navigator.of(context).pop();
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Table Example'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columns: _columns,
          rows: _data
              .map(
                (data) => DataRow(
                  cells: [
                    DataCell(Text(data['id'].toString())),
                    DataCell(Text(data['name'])),
                    DataCell(Text(data['email'])),
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _showEditPopup(data);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Delete data action here
                            setState(() {
                              _data.removeWhere(
                                  (element) => element['id'] == data['id']);
                            });
                            print('Deleting data with id ${data['id']}');
                          },
                        ),
                      ],
                    )),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
