import 'package:flutter/material.dart';

class ManageHuman extends StatefulWidget {
  const ManageHuman({super.key});

  @override
  State<ManageHuman> createState() => _ManageHumanState();
}

class Human {
  String _id;
  String name;
  int age;

  Human(this._id, this.name, this.age);
}

class HumanMange {
  List<Human> humans;

  HumanMange(this.humans);

  List<Human> timKiemTheoTen(String input) {
    return humans
        .where(
            (human) => human.name.toLowerCase().contains(input.toLowerCase()))
        .toList();
  }

  void sortByAge() {
    humans.sort((a, b) => b.age.compareTo(a.age));
  }
}

class _ManageHumanState extends State<ManageHuman> {
  HumanMange humanMange = HumanMange([
    Human('1', 'Lâm', 30),
    Human('2', 'Tuấn', 25),
    Human('3', 'Huyền', 35),
    Human('4', 'Xuyến', 28,),
    Human('5', 'Long', 32,),
    Human('5', 'Đại', 22,),
    Human('5', 'Đạt', 19,),
  ]);

  late List<Human> danhSachHuman;
  TextEditingController timTheoTen = TextEditingController();

  @override
  void initState() {
    super.initState();
    danhSachHuman = humanMange.humans;
  }

  void timNguoiTheoTen() {
    setState(() {
      danhSachHuman = humanMange.timKiemTheoTen(timTheoTen.text);
    });
  }

  void sapXepTheoTuoi() {
    setState(() {
      humanMange.sortByAge();
      danhSachHuman = humanMange.humans;
    });
  }

  void refreshSearch() {
    setState(() {
      timTheoTen.clear();
      danhSachHuman = humanMange.humans;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Quan Ly Nguoi Dung"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: timTheoTen,
              decoration: InputDecoration(
                  labelText: 'Tim kiem nguoi dung',
                  suffixIcon: IconButton(
                    onPressed: timNguoiTheoTen,
                    icon: Icon(Icons.search),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final nguoi = danhSachHuman[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                  ),
                  title: Text(nguoi.name),
                  subtitle: Text('${nguoi.age} tuổi'),
                );
              },
              itemCount: danhSachHuman.length,
            ))
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: sapXepTheoTuoi,
            child: Icon(Icons.sort),
          ),
          FloatingActionButton(
            onPressed: refreshSearch,
            child: Icon(Icons.refresh),
          )
        ],
      ),
    );
  }
}
