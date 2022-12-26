import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/providers/address_provider.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final districtController = TextEditingController();
  final areaController = TextEditingController();
  final blockController = TextEditingController();
  final streetController = TextEditingController();
  final houseController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        leadingWidth: 68,
        title: Text("Create New address"),
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.yellow[700]),
            child: CupertinoButton(
              padding: EdgeInsets.only(right: 0),
              child: Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: 28,
              ),
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: districtController,
                  decoration: InputDecoration(hintText: "District"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is required";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: areaController,
                  decoration: InputDecoration(hintText: "Area"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is required";
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: blockController,
                  decoration: InputDecoration(hintText: "Block"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is required";
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: streetController,
                  decoration: InputDecoration(hintText: "Street"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is required";
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: houseController,
                  decoration: InputDecoration(hintText: "House Number"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is required";
                    }

                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 45,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[700],
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () async {
                    await context.read<AddressProvider>().addAddress(
                          district: districtController.text,
                          area: areaController.text,
                          block: blockController.text,
                          street: streetController.text,
                          house: houseController.text,
                        );

                    context.pop();
                  },
                  child: Text(
                    "Add Address",
                    style: TextStyle(
                      fontSize: 17,
                      // fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
