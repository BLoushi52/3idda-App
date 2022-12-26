import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/model/category_model.dart';
import 'package:rental_app/model/item_model.dart';
import 'package:rental_app/providers/category_provider.dart';
import 'package:rental_app/providers/myitems_provider.dart';

class EditItemPage extends StatefulWidget {
  final Item item;
  EditItemPage({required this.item, super.key});

  @override
  State<EditItemPage> createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  Category? value;

  File? imageFile;

  String? imageError;

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.item.title;
    descriptionController.text = widget.item.description;
    priceController.text = widget.item.price.toString();
    value = context
        .read<CategoryProvider>()
        .categories
        .firstWhere((element) => element.id == widget.item.category);

    // ingredientController.text = widget.recipe.ingredient as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        title: Text("Edit Item"),
        backgroundColor: Colors.yellow[700],
        foregroundColor: Colors.black,
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
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: "Title",
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
                        value: value,
                        items: context
                            .watch<CategoryProvider>()
                            .categories
                            .map(buildMenuItem)
                            .toList(),
                        onChanged: (value) => setState(
                              () {
                                this.value = value;
                              },
                            )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                    padding: const EdgeInsets.all(8.0),
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
                  SizedBox(height: 20),
                  if (imageFile != null)
                    Image.file(
                      imageFile!,
                      width: 100,
                      height: 100,
                    )
                  else
                    Image.network(
                      widget.item.image,
                      width: 100,
                      height: 100,
                    ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow[700],
                          foregroundColor: Colors.black,
                          fixedSize: Size.fromWidth(150)),
                      onPressed: () async {
                        var file = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);

                        if (file == null) {
                          print("Use didn't select a file");
                          return;
                        }

                        setState(() {
                          imageFile = File(file.path);
                          imageError = null;
                        });
                      },
                      child: Text(
                        "Edit Image",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      )),
                  if (imageError != null)
                    Text(
                      imageError!,
                      style: TextStyle(color: Colors.red),
                    ),
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

                        {
                          await context.read<MyItemProvider>().editItem(
                                id: widget.item.id,
                                title: titleController.text,
                                category: value!.id,
                                image: imageFile,
                                description: descriptionController.text,
                                price: priceController.text.toString(),
                              );

                          context.pop();
                        }
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 20,
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
