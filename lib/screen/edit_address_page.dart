import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/model/address_model.dart';
import 'package:rental_app/model/category_model.dart';
import 'package:rental_app/model/item_model.dart';
import 'package:rental_app/providers/address_provider.dart';
import 'package:rental_app/providers/category_provider.dart';
import 'package:rental_app/providers/myitems_provider.dart';

class EditAddressPage extends StatefulWidget {
  final Address address;
  EditAddressPage({required this.address, super.key});

  @override
  State<EditAddressPage> createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  final districtController = TextEditingController();
  final areaController = TextEditingController();
  final blockController = TextEditingController();
  final streetController = TextEditingController();
  final houseController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    districtController.text = widget.address.district;
    areaController.text = widget.address.area;
    blockController.text = widget.address.block.toString();
    streetController.text = widget.address.street.toString();
    houseController.text = widget.address.house.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Address"),
        backgroundColor: Colors.yellow[700],
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: districtController,
                  decoration: InputDecoration(hintText: "district"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is required";
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: blockController,
                  keyboardType: TextInputType.number,
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
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: streetController,
                  keyboardType: TextInputType.number,
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
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: houseController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "house"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is required";
                    }

                    return null;
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    // form

                    {
                      await context.read<AddressProvider>().editAddress(
                            id: widget.address.id,
                            district: districtController.text,
                            area: areaController.text,
                            block: blockController.text,
                            street: streetController.text,
                            house: houseController.text,
                          );

                      context.pop();
                    }
                  },
                  child: Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
