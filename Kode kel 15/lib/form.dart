import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormKuis extends StatefulWidget {
  const FormKuis({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FormKuis> createState() => _FormKuisState();
}

class _FormKuisState extends State<FormKuis> {
  List<DropdownMenuItem<String>> genderItems = [];
  
  DateTime? selectedDate;
  late TextEditingController dateController;

  @override
  void initState() {
    super.initState();
    genderItems = <String>['Perempuan', 'Laki-Laki']
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();

    dateController = TextEditingController();
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 246, 204, 68),
      ),
      body: SingleChildScrollView(
      child:SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: 260,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 246, 204, 68),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: Column(
                children: [],
              ),
            ),
            Positioned(
              top: 20,
              left: 40,
              right: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Budi Martami",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              const AssetImage("assets/image/image.jpg"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ubah Profile",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Nama Depan',
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 1),
                            ),
                            maxLines: 2, // Menentukan jumlah baris maksimum
                            minLines: 1, // Menentukan jumlah baris minimum
                            keyboardType: TextInputType
                                .multiline, // Mengaktifkan mode multiline
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Nama Belakang',
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 1),
                            ),
                            maxLines: 2, // Menentukan jumlah baris maksimum
                            minLines: 1, // Menentukan jumlah baris minimum
                            keyboardType: TextInputType
                                .multiline, // Mengaktifkan mode multiline
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Gender',
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.07,
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        child: DropdownButtonFormField<String>(
                                          value: 'Perempuan',
                                          items: genderItems,
                                          onChanged: (newValue) {
                                            setState(() {
                                              genderItems = newValue as List<
                                                  DropdownMenuItem<String>>;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Tanggal Lahir',
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.42,
                                        height: MediaQuery.of(context).size.height * 0.07,
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.3,
                                          ),
                                          // borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller: dateController,
                                                onTap: () async {
                                                  DateTime? pickedDate = await showDatePicker(
                                                    context: context,
                                                    initialDate: selectedDate ?? DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2100),
                                                  );
                                                  if (pickedDate != null) {
                                                    setState(() {
                                                      selectedDate = pickedDate;
                                                      dateController.text = _formatDate(pickedDate);
                                                    });
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                  hintText: "DD/MM/YYYY",
                                                  border: InputBorder.none,
                                                  hintStyle: TextStyle(fontSize: 12),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () async {
                                                DateTime? pickedDate = await showDatePicker(
                                                  context: context,
                                                  initialDate: selectedDate ?? DateTime.now(),
                                                  firstDate: DateTime(1900),
                                                  lastDate: DateTime(2100),
                                                );
                                                if (pickedDate != null) {
                                                  setState(() {
                                                    selectedDate = pickedDate;
                                                    dateController.text = _formatDate(pickedDate);
                                                  });
                                                }
                                              },
                                              icon: Icon(Icons.calendar_month),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Alamat',
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                // border: OutlineInputBorder(),
                                // contentPadding: EdgeInsets.symmetric(vertical: 1),
                                ),
                            maxLines: 3, // Menentukan jumlah baris maksimum
                            minLines: 1, // Menentukan jumlah baris minimum
                            keyboardType: TextInputType
                                .multiline, // Mengaktifkan mode multiline
                          ),
                          SizedBox(height: 90),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                // Save profile
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 246, 204, 68),
                                ),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(
                                      color:
                                          Colors.blueGrey, // Warna garis luar
                                      width: 1, // Ketebalan garis luar
                                    ),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 6.0),
                                child: Text(
                                  'Simpan',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}