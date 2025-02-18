import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/helper_widget.dart';
import '../../widgets/widgets.dart';

class VerifyFarms extends StatefulWidget {
  static const String routeName = '/Verfay_farm';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) {
        return const VerifyFarms();
      },
    );
  }

  const VerifyFarms({Key? key}) : super(key: key);

  @override
  State<VerifyFarms> createState() => _VerifyFarmsState();
}

class _VerifyFarmsState extends State<VerifyFarms> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _farmName = TextEditingController();
  final TextEditingController _farmSize = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _croptype = TextEditingController();
  final TextEditingController _soiltype = TextEditingController();
  final TextEditingController _polygonlocation = TextEditingController();

  XFile? imageFile;
  final ImagePicker picker = ImagePicker();

  final image = Image.asset(
    // fit: BoxFit.scaleDown,
    height: 50,
    "assets/images/tracter1.png",
  );
  Future<void> _submitForm() async {
    if (formKey.currentState!.validate()) {
      // String url = 'https://<your-heroku-app-url>/register';

      // var request = http.MultipartRequest('POST', Uri.parse(url));
      // request.fields['name'] = nameController.text;
      // request.fields['email'] = emailController.text;
      // request.fields['password'] = passwordController.text;

      // if (imageFile != null) {
      //   String imageName = imageFile!.path.split('/').last;
      //   request.files.add(http.MultipartFile(
      //     'image',
      //     imageFile!.readAsBytes().asStream(),
      //     imageFile!.lengthSync(),
      //     filename: imageName,
      //   ));
      // }

      // try {
      //   final streamedResponse = await request.send();
      //   final response = await http.Response.fromStream(streamedResponse);

      //   if (response.statusCode == 200) {
      //     // display confirmation to user that registration was successful
      //   } else {
      //     // handle error
      //   }
      // } catch (e) {
      //   // handle error
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Verify Account",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addCoverPhoto(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Farm Information.",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InputText(context, "Full name", "Farm Name", false,
                        Icons.person_3_sharp, TextInputType.name, _farmName),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputTextFarmSize(
                                context,
                                "",
                                "Farm Size",
                                false,
                                Icons.person_3_sharp,
                                TextInputType.number,
                                _farmSize),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputTextFarmLocation(
                                context,
                                "Location.",
                                "Location",
                                false,
                                Icons.person_3_sharp,
                                TextInputType.text,
                                _location),
                          ],
                        ),
                      ],
                    ),
                    addVerticalSpace(20.0),
                    Text(
                      "Optional Information.",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InputText(context, "", "Crop type", false,
                        Icons.person_3_sharp, TextInputType.name, _croptype),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputTextFarmSize(
                                context,
                                "",
                                "Soil type",
                                false,
                                Icons.person_3_sharp,
                                TextInputType.number,
                                _soiltype),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputTextFarmLocation(
                                context,
                                "",
                                "Polygon location",
                                false,
                                Icons.person_3_sharp,
                                TextInputType.text,
                                _polygonlocation),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Map<String, String> data = {
                        "FarmSize": _farmSize.text,
                        "FarmName": _farmName.text,
                        "Location": _location.text,
                        "Croptype": _croptype.text,
                        "Soiltype": _soiltype.text,
                        "polygonlocation": _polygonlocation.text,
                      };

                      Navigator.pushNamed(context, '/');
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Button(context, "Verify", '/',
                      //     Theme.of(context).primaryColor, 200, 50),
                      ElevatedButton(
                        onPressed: () {
                          _submitForm();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 200,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: Center(
                            child: Text(
                              "Verify",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      addHorizontalSpace(25),
                      Button(context, "cancel", '/', Colors.grey, 325, 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addCoverPhoto() {
    return InkWell(
      onTap: () {
        // add image to mongo
        showModalBottomSheet(
          context: context,
          builder: ((builder) => bottomSheat()),
        );
      },

      // This is ana external package
      child: DottedBorder(
          dashPattern: const [15, 5],
          color: const Color.fromARGB(255, 48, 141, 51),
          strokeWidth: 2,
          borderType: BorderType.RRect,
          radius: const Radius.circular(10),
          child: SizedBox(
            width: double.infinity,
            height: 141,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: imageFile == null
                  ? InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => bottomSheat()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.photo,
                            size: 65,
                            color: Colors.grey,
                          ),
                          Text(
                            "Add Farm Photo",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 48, 141, 51)),
                          ),
                          Text(
                            "Up to 12mp ",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    )
                  : Ink.image(
                      image: imageFile == null
                          ? image.image
                          : FileImage(File(imageFile!.path)),
                      width: 60,
                      height: 60,
                      child: InkWell(onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => bottomSheat()),
                        );
                      }),
                    ),
            ),
          )),
    );
  }

  Widget bottomSheat() {
    return Container(
      height: 100,
      width: 300,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(children: [
        const Text(
          "Choose Profile Photo",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                takePhote(ImageSource.camera);
              },
              icon: const Icon(Icons.camera),
              label: const Text("Camera"),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Theme.of(context).primaryColor, // Change button color here
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                takePhote(ImageSource.gallery);
              },
              icon: const Icon(Icons.image),
              label: const Text("Gallery"),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Theme.of(context).primaryColor, // Change button color here
              ),
            )
          ],
        )
      ]),
    );
  }

  void takePhote(ImageSource source) async {
    XFile? pickedFile = await picker.pickImage(source: source);

    setState(() {
      imageFile = pickedFile;
    });
  }
}
