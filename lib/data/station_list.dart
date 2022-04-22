class linge_num {
  late List<String> stations ;
  late String metro_num ;
   linge_num(this.stations, this.metro_num)  ;

}
class Stations_list {
  static   List<String> stations_linge1  =[
    'Tunis Marine',
    'Farhat Hached',
    'Place de Barcelone'
    ,'Bab Alioua',
    'Mohamed Manachou'
    ,'13 août'
    , 'Mohamed Ali'
    , 'Kabaria'
    ,'Ibn Sina'
    ,'Ouardia 6'
    ,'Cité Ennour'
    ,'A. Chabbi'
    ,'Ben Arous'

  ];
  static   List<String> stations_linge3  =[
    'Place de Barcelone',
    'Habib Thameur',
    'République',
    'Bab El Khadra',
    'Bab Laassal',
    'Bab Saadoun',
    'Mefteh Sâadallah',
    'Cité Rommana',
    'Campus',
    '7 Novembre',
    'Les Jasmins',
    'Ibn Khaldoun',

  ];

  static   List<String> stations_linge2  =[
   'Ariana',
   'Indépendance',
   'El Fell',
   '10 décembre 1948',
   'Cité sportive',
   'La Jeunesse',
   'Bab El Khadra',
   'Cité Jardins',
   'Palestine',
   'Mohamed V',
    'Nelson Mandela',
    'République',


  ];
  static   List<String> stations_linge4 =[
    'Den Den',
    'Artisanat',
    'Khaznadar',
    'Bardo',
    'Boulevard du 20 mars',
    'Bouchoucha',
    'Bab Saadoun',
    'Bab Laassal',
    'Bab El Khadra',
    'République',
    'Habib Thameur',
    'Place de Barcelone',
    'Farhat Hached',
    'Tunis Marine',

  ];
  static   List<String> stations_linge5  =[
    'Place de Barcelone',
    'Habib Thameur',
    'République',
    'Bab El Khadra',
    'Bab Laassal',
    'Bab Saadoun',
    'Mefteh Sâadallah',
    'Cité Rommana',
    'Campus',
    '7 Novembre',
    'Les Jasmins',
    'Ettahrir',
    'Omrane Supérieure',
    'Ettadhamen',
    'Intilaka',


  ];
  static   List<String> stations_linge6  =[
    'Tunis Marine',
    'Farhat Hached',
    'Place de Barcelone',
    'Bab Alioua',
    'Mohamed Manachou',
    'Mohamed Ali',
    'Tahar Haddad',
    'Ghazeli',
    'Cité municipale',
    'Ennesri',
    'El Montazah',
    'El Mourouj 2',
    'El Mourouj 1',
    'Environnement	',
    'El Mourouj 3',
    'Martyrs',
    'El Mourouj 4',

  ];
  static   List<String>All_Stations  = (stations_linge1+stations_linge2+stations_linge3+stations_linge4+stations_linge5+stations_linge6).toSet().toList() ;

static List<linge_num> metro_list =[
  linge_num(stations_linge1,'1') ,
  linge_num(stations_linge2,'2') ,
  linge_num(stations_linge3,'3') ,
  linge_num(stations_linge4,'4') ,
  linge_num(stations_linge5,'5') ,
  linge_num(stations_linge6,'6') ,
  ];


}