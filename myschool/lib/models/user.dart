class User {
  final int id, statut;
  final String prenoms, nom, sexe, email, tel, mot_de_passe, created_at;

  User({
    required this.id,
    required this.statut,
    required this.prenoms,
    required this.nom,
    required this.sexe,
    required this.email,
    required this.tel,
    required this.mot_de_passe,
    required this.created_at,
  });
}
