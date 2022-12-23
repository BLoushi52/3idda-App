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
  final dstrictController = TextEditingController();
  final areaController = TextEditingController();
  final blockController = TextEditingController();
  final streetController = TextEditingController();
  final houseController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New address"),
        backgroundColor: Colors.yellow[700],
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: dstrictController,
                  decoration: InputDecoration(hintText: "dstrict"),
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
                  decoration: InputDecoration(hintText: "area"),
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
                  decoration: InputDecoration(hintText: "block"),
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
                  decoration: InputDecoration(hintText: "street"),
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
                  decoration: InputDecoration(hintText: "house number"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is required";
                    }

                    return null;
                  },
                ),
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: () async {
                    await context.read<AddressProvider>().addAddress(
                          dstrict: dstrictController.text,
                          area: areaController.text,
                          block: blockController.text,
                          street: streetController.text,
                          house: houseController.text,
                        );

                    context.pop();
                  },
                  child: Text("Add New Address"))
            ],
          ),
        ),
      ),
    );
  }
}
