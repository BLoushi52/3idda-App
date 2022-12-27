import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/model/category_model.dart';
import 'package:rental_app/providers/category_provider.dart';
import 'package:rental_app/providers/myitems_provider.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  Category? value;

  File? imageFile;

  String? imageError;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        leadingWidth: 68,
        title: Text("Add Item"),
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
      body: ListView(
        children: [
          SafeArea(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: "Item Name",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade500),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Field is required";
                          }

                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownButton<Category>(
                        icon: Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          color: Colors.grey[600],
                          size: 30,
                        ),
                        isExpanded: true,
                        hint: Text("Category"),
                        value: value,
                        items: context
                            .watch<CategoryProvider>()
                            .categories
                            .map(buildMenuItem)
                            .toList(),
                        onChanged: (value) => setState(
                              () {
                                this.value = value;
                                print(value);
                              },
                            )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        hintText: "Description",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade500),
                        ),
                      ),
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
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Price",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade500),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field is required";
                        }

                        return null;
                      },
                    ),
                  ),
                  if (imageFile != null)
                    Image.file(
                      imageFile!,
                      width: 100,
                      height: 100,
                    )
                  else
                    Container(
                      width: 100,
                      height: 20,
                    ),
                  Column(
                    children: [
                      Icon(
                        Icons.image_outlined,
                        size: 55,
                        color: Colors.grey[500],
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow[700],
                            foregroundColor: Colors.black,
                          ),
                          onPressed: () async {
                            var file = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);

                            if (file == null) {
                              print("User didn't select a file");
                              return;
                            }

                            setState(() {
                              imageFile = File(file.path);
                              imageError = null;
                            });
                          },
                          child: Text(
                            "Choose an Image",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )),
                    ],
                  ),
                  if (imageError != null)
                    Text(
                      imageError!,
                      style: TextStyle(color: Colors.red),
                    ),
                  // Spacer(),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[700],
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 80),
                      ),
                      onPressed: () async {
                        // form

                        if (imageFile == null) {
                          setState(() {
                            imageError = "Required field";
                          });
                        }

                        if (formKey.currentState!.validate() &&
                            imageFile != null) {
                          await context.read<MyItemProvider>().addItem(
                                title: titleController.text,
                                description: descriptionController.text,
                                price: priceController.text,
                                category: value!.id,
                                image: imageFile!,
                              );

                          context.pop();
                        }
                      },
                      child: Text(
                        "Add Item",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<Category> buildMenuItem(Category item) => DropdownMenuItem(
        value: item,
        child: Text(item.title),
      );
}
