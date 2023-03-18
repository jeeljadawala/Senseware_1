import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'welcome': 'Welcome, User',
          'on': 'Tap to turn ON detection',
          'off': 'Tap to turn OFF the detection',
          'lowrisk': 'Low risk detected',
          'midrisk': 'Medium risk detected',
          'highrisk': 'High risk detected'
        },
        'fr_FR': {
          'welcome': 'Bienvenue, utilisateur',
          'on': 'Appuyez pour activer la détection',
          'off': 'Appuyez pour désactiver la détection',
          'lowrisk': 'Faible risque détecté',
          'midrisk': 'Risque moyen détecté',
          'highrisk': 'Risque élevé détecté'
        }
      };
}
