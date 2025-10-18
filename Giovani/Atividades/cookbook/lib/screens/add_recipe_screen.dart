import 'package:flutter/material.dart';

class AddRecipeScreen extends StatelessWidget {
  const AddRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '+ Adicionar Receita',
          style: TextStyle(
            color: Colors.white,         // texto branco
            fontWeight: FontWeight.w500, // negrito
          ),
        ),
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Preencha os detalhes da nova receita:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),

            // TÍTULO
            _buildTextField(label: 'Título da Receita'),

            // IMAGEM
            _buildTextField(label: 'URL da Imagem'),

            // CATEGORIA
            _buildTextField(label: 'Categoria (Pratos, Lanches, etc.)'),

            // TEMPO
            _buildTextField(label: 'Tempo (minutos)', keyboard: TextInputType.number),

            // PORÇÕES
            _buildTextField(label: 'Serve (quantidade)', keyboard: TextInputType.number),

            // PREÇO
            _buildTextField(label: 'Preço (R\$)', keyboard: TextInputType.number),

            // INGREDIENTES
            _buildTextField(label: 'Ingredientes (separados por vírgula)'),

            // CALORIAS
            _buildTextField(label: 'Calorias (kcal)', keyboard: TextInputType.number),

            // CARBOIDRATOS
            _buildTextField(label: 'Carboidratos (g)', keyboard: TextInputType.number),

            // PROTEÍNAS
            _buildTextField(label: 'Proteínas (g)', keyboard: TextInputType.number),

            const SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Salvar',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, TextInputType? keyboard}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        keyboardType: keyboard,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
