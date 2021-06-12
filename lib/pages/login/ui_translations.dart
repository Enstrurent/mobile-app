import 'package:get/get.dart';

class UITranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "tr_TR": {
          "products_title": "ENSTRÜMANLAR",
          "login": "GİRİŞ YAP",
          "email": "E-POSTA",
          "email_hint": "eposta@adres.com",
          "password": "PAROLA",
          "sign_up": "KAYDOL",
          "change_lang": "English/İNGİLİZCE",
          "error": "Hata oluştu!",
          "wrong_email_pass": "Yanlış e-posta ve parola girdiniz.",
          "went_wrong": "Bir şeyler ters gitti, daha sonra tekrar deneyin.",
          "email_invalid": "Geçersiz bir e-posta girdiniz.",
          "email_pass_empty": "Lütfen e-posta veya parola alanını doldurunuz!",
          "sign_out": "ÇIKIŞ YAP",
        },
        "en_US": {
          "products_title": "INSTRUMENTS",
          "login": "LOGIN",
          "email": "EMAIL",
          "email_hint": "email@domain.com",
          "password": "PASSWORD",
          "sign_up": "SIGN UP",
          "change_lang": "TÜRKÇE/TURKISH",
          "error": "Error occured!",
          "wrong_email_pass": "You've entered wrong email or password.",
          "went_wrong": "Something went wrong, please try again later.",
          "email_invalid": "You've entered an invalid email.",
          "email_pass_empty": "Please fill the email and the password area!",
          "sign_out": "SIGN OUT",
        },
      };
}
