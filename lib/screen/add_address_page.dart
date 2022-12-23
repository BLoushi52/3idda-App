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
        title: Text("Create New address"),
        backgroundColor: Colors.yellow[700],
        foregroundColor: Colors.black,
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
                          dstrict: districtController.text,
                          area: areaController.text,
                          block: blockController.text,
                          street: streetController.text,
                          house: houseController.text,
                        );

                    context.pop();
                  },
                  child: Text(
                    "Add New Address",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold
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
