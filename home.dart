import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: _buildSectionTitle('Bienvenue à l\'ISTA Maamora')),
               Center(child: Image.asset('assets/logo.jpg', width: 150, height: 150)),
               const SizedBox(height: 16),
              _buildSectionText(
                  'Notre centre de formation professionnelle à Kénitra, l’Institut spécialisé des technologies appliquées ISTA Maamora (ISTA) (OFPPT), est un établissement de renom qui offre une formation professionnelle de qualité dans différents domaines..'),
              _buildSectionText(
                  'Nous proposons des programmes de formation dans les technologies appliquées, la gestion des entreprises, l’informatique, la logistique, la mécanique et l’électricité, entre autres. Notre équipe de formateurs hautement qualifiés offre une formation pratique et théorique pour aider nos étudiants à réussir dans leur domaine de prédilection.'),
              _buildSectionText(
                  'Notre objectif est de fournir une éducation pratique qui répond aux normes industrielles et garantit que nos étudiants sont prêts à prendre le monde professionnel en main. Nous nous engageons à fournir une expérience éducative de qualité à nos étudiants pour qu’ils puissent réussir leurs objectifs professionnels.'),
              // Ajoutez ici d'autres sections et informations selon vos besoins
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.redAccent),
      ),
    );
  }

  Widget _buildSectionSubtitle(String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: Text(
        subtitle,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSectionText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildSectionList(List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((item) => _buildListTile(item)).toList(),
      ),
    );
  }

  Widget _buildListTile(String item) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text('- $item'),
    );
  }
}
