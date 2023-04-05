import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'welcome': 'Welcome, User',
          'on': 'Tap to turn ON detection',
          'off': 'Tap to turn OFF the detection',
          'lowrisk': 'Low risk detected',
          'medrisk': 'Medium risk detected',
          'highrisk': 'High risk detected',
          'Language' : 'Toggle the button to change the language',
          'ReadytoGo': 'Let\'s go right away!',
          'Activate': 'Click here to activate the system ',
          'Direction': 'Highlighted arrow shows the direction of danger ',
          'fromLeft': 'Danger is approaching from left',
          'fromRight': 'Danger is approaching from right',
          'fromBack': 'Danger is approaching from back',
          'done': 'Done',
          'skip' : 'Skip',
          'dec1':'Mic1 Decibel',
          'dec2':'Mic2 Decibel'

        },
        'fr_FR': {
          'welcome': 'Bienvenue, utilisateur',
          'on': 'Appuyez pour activer la détection',
          'off': 'Appuyez pour désactiver la détection',
          'lowrisk': 'Faible risque détecté',
          'medrisk': 'Risque moyen détecté',
          'highrisk': 'Risque élevé détecté',
          'Language': 'Basculez le bouton pour changer la langue',
          'ReadytoGo': 'Allons-y tout de suite !',
          'Activate': 'Cliquez ici pour activer le système',
          'Direction': 'La flèche en surbrillance indique la direction du danger',
          'fromLeft': 'Le danger approche par la gauche',
          'fromRight': 'Le danger approche par la droite',
          'fromBack': 'Le danger approche par derrière',
          'done' : 'Faite',
          'skip' : 'Sauter',
          'dec1':'Mic1 Décibels',
  'dec2':'Mic2 Décibels'
        }
      };
}
