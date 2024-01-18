import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PresentationPage(),
    );
  }
}

class PresentationPage extends StatelessWidget {
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
                  'Situé à la Nouvelle Médina, B.P. 573, 14000 Kénitra, l\'ISTA Maamora est un établissement d\'enseignement public professionnel offrant une formation spécialisée avec des ateliers et des instituts d\'apprentissage.'),
              _buildSectionText(
                  'Type de Formation : Enseignement public professionnelle avec ateliers et instituts d’apprentissage'),
              _buildSectionText('Niveau : Baccalauréat, Niveau Baccalauréat'),
              _buildSectionText(
                  'Adresse : Nouvelle Médina B.P. 573 14000 Kénitra'),
              _buildSectionText('Numéro de Téléphone : 0537381170'),
              _buildSectionTitle(
                  'Liste des formations professionnelles (filières) :'),
              _buildSectionList([
                'Technicien Spécialisé en Secrétariat de Direction',
                'Technicien Spécialisé en Gestion des Entreprises',
                'Technicien Spécialisé Bureau d’Etude en Construction Métallique',
                'Technicien Spécialisé Méthodes en Fabrication Mécaniques',
                'Technicien Spécialisé en Développement Informatique',
                'Technicien Spécialisé en Réseaux Informatiques',
                'Technicien Spécialisé en Electromécanique des Systèmes Automatises',
                'Technicien Spécialisé en Commerce',
                'Technicien Spécialisé en Automatisation et Instrumentation Industrielle',
              ]),
              _buildSectionTitle('Conditions d’accès OFPPT ISTA Kenitra :'),
              _buildSectionSubtitle('Formation initiale Niveau Technicien Spécialisé :'),
              _buildSectionList([
                'Titulaire du baccalauréat, ou d’un diplôme de Technicien reconnu par les pouvoirs publics',
                'Etre âgé de 30 ans au maximum à la date d’inscription',
                'L’accès aux filières est conditionné par un diplôme du baccalauréat pour les bacheliers, et un diplôme de la licence pour les licenciés',
              ]),
               _buildSectionSubtitle('Formation initiale Niveau Technicien :'),
                 _buildSectionList([
                'Avoir le niveau de la 2ème année du baccalauréat, ou être titulaire d’un diplôme de qualification professionnelle reconnu par les pouvoirs publics',
                'Etre âgé de 20 ans au minimum à la date d’inscription',
                'Justifier d’une expérience professionnelle effective d’au moins une année',
              ]), 

              _buildSectionSubtitle('Niveau Qualification :'),
                _buildSectionList([
                'Avoir au minimum le niveau de la 3ème année de l’enseignement secondaire collégial ou être titulaire d’un diplôme de spécialisation reconnu par les pouvoirs publics',
                'Etre âgé de 18 ans au minimum à la date d’inscription',
                'Justifier d’une expérience professionnelle effective d’au moins une année',
              ]), 
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
