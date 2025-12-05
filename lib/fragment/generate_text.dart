import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../utils/ai_service.dart';

class FragmentGenerateText extends StatefulWidget {
  const FragmentGenerateText({super.key});

  @override
  State<FragmentGenerateText> createState() => _FragmentGenerateTextState();
}

class _FragmentGenerateTextState extends State<FragmentGenerateText> {
  TextEditingController textEditingController = TextEditingController();
  String strAnswer = '';
  bool visibleSP = false;

  String selectedCategory = 'Masakan Indonesia';

  final listCategory = [
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
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: textEditingController,
              onChanged: (text) => setState(() {}),
              decoration: InputDecoration(
                labelText: 'Masukkan bahan atau nama masakan...',
                suffixIcon: IconButton(
                  icon: Icon(
                    textEditingController.text.isNotEmpty
                        ? Icons.cancel
                        : null,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    textEditingController.clear();
                    visibleSP = false;
                    setState(() {});
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
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
                value: selectedCategory,
                onChanged: (value) {
                  setState(() => selectedCategory = value!);
                },
                items: listCategory.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
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
              onPressed: () async {
                if (textEditingController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Input tidak boleh kosong!'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                visibleSP = true;
                setState(() {});

                final model = GenerativeModel(
                  model: 'gemini-2.5-flash-lite',
                  apiKey: API_KEY,
                );

                final response = await model.generateContent([
                  Content.text("""
Kamu adalah AI Cooking Helper.

Buatkan **resep lengkap** sesuai kategori **$selectedCategory**, dari input:

"${textEditingController.text}"

Format markdown:

# 🍽️ Nama Masakan  
## 📝 Bahan  
- ...  
## 👩‍🍳 Cara Memasak  
1. ...  
2. ...  
## ⏱ Waktu  
- Persiapan: ...  
- Memasak: ...  
## 🍽 Tips  
- ...
"""),
                ]);

                setState(() {
                  strAnswer = response.text ?? 'Tidak ada respon.';
                });
              },
              child: const Text('Buatkan Resep'),
            ),
          ),

          Visibility(
            visible: visibleSP,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
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
}
