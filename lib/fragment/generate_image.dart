import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/ai_service.dart';

class FragmentGenerateImage extends StatefulWidget {
  const FragmentGenerateImage({super.key});

  @override
  State<FragmentGenerateImage> createState() => _FragmentGenerateImageState();
}

class _FragmentGenerateImageState extends State<FragmentGenerateImage> {
  String strAnswer = '';
  bool visibleSP = false;
  File? imageFile;
  final picker = ImagePicker();

  String selectedType = 'Masakan Indonesia';

  final listType = [
    'Masakan Indonesia',
    'Masakan Barat',
    'Masakan Jepang',
    'Masakan Korea',
    'Masakan China',
    'Masakan Timur Tengah',
    'Makanan Diet / Sehat',
    'Makanan Vegan',
    'Dessert / Kue',
    'Minuman',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          GestureDetector(
            onTap: showImagePicker,
            child: Container(
              margin: const EdgeInsets.all(20),
              width: size.width,
              height: 250,
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                color: Colors.orange,
                dashPattern: const [6, 4],
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: imageFile != null
                      ? Image.file(imageFile!, fit: BoxFit.cover)
                      : const Icon(Icons.food_bank, size: 80, color: Colors.orange),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.orange),
              ),
              child: DropdownButton<String>(
                value: selectedType,
                onChanged: (v) => setState(() => selectedType = v!),
                items: listType.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                isExpanded: true,
                underline: Container(),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                if (imageFile == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Masukkan gambar bahan makanan'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }
                visibleSP = true;
                generateRecipeFromImage();
              },
              child: const Text('Buat Resep dari Gambar'),
            ),
          ),

          Visibility(
            visible: visibleSP,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: MarkdownBody(data: strAnswer),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= IMAGE PICKER =================

  void showImagePicker() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) => Container(
        height: 150,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    final picked = await picker.pickImage(source: ImageSource.gallery);
                    if (picked != null) setState(() => imageFile = File(picked.path));
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.image, size: 40, color: Colors.orange),
                ),
                const Text('Galeri'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    final picked = await picker.pickImage(source: ImageSource.camera);
                    if (picked != null) setState(() => imageFile = File(picked.path));
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.camera_alt, size: 40, color: Colors.orange),
                ),
                const Text('Kamera'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ================= AI GENERATION =================

  Future<void> generateRecipeFromImage() async {
    try {
      final model = GenerativeModel(
        model: 'gemini-2.5-flash-lite',
        apiKey: API_KEY,
      );

      final result = await model.generateContent([
        Content.multi([
          TextPart("""
Kamu adalah AI Cooking Helper.  
Analisis gambar bahan makanan ini dan buatkan resep lengkap sesuai kategori: **$selectedType**.

Format:
## Nama Makanan
## Bahan-bahan
## Cara Memasak
## Tips
"""),
          DataPart('image/jpeg', imageFile!.readAsBytesSync()),
        ]),
      ]);

      setState(() {
        strAnswer = result.text ?? 'Tidak ada respon dari AI.';
      });
    } catch (e) {
      setState(() {
        strAnswer = 'Terjadi kesalahan: $e';
      });
    }
  }
}
