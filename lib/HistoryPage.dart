import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

void main() => runApp(HistoryPage());

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  TextEditingController _textFieldController = TextEditingController();

  void _TextFieldDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Silahkan registrasi UID-nya di kolom ini'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Silahkan Masukkan UID"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                String uid = _textFieldController.text;
                print('UID yang dimasukkan: $uid');
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('UID Anda sudah Teregistrasi')),
                );
              },
              child: Text('Kirim'),
            ),
          ],
        );
      },
    );
  }

  void _AwesomeDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.WARNING,
      animType: AnimType.SCALE,
      title: 'Warning',
      desc: 'Apakah anda ingin Registrasi UID ini?',
      btnOkOnPress: () {},
      btnCancelOnPress: () {},
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Page', style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            ListTile(
              title: ElevatedButton(
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.WARNING,
                    animType: AnimType.TOPSLIDE,
                    title: "Warning",
                    desc: "Apakah anda ingin Registrasi UID ini?",
                    btnCancelOnPress: () {},
                    btnOkOnPress: _TextFieldDialog,
                  ).show();
                },
                child: Text('Kartu Mahasiswa Binus 1',
                    style: TextStyle(fontSize: 17)),
              ),
            ),
            ListTile(
              title: ElevatedButton(
                onPressed: () {
                  _AwesomeDialog();
                },
                child: Text('Kartu Mahasiswa Binus 2',
                    style: TextStyle(fontSize: 17)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
