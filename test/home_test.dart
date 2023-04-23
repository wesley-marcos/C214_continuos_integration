import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_continuos_integration/home.dart';

void main() {

  group("Calculate imc test", () {

    // Teste para resultado vazio
    test("Test null", () {
      final imc = Home();
      expect(imc.imc, "");
    });

    // Teste para achar o peso padrão
    test("Test peso padrão", () {
      final imc = Home();
      expect(imc.weight, 100);
    });

    // Teste para achar a altura padrão
    test("Test altura padrão", () {
      final imc = Home();
      expect(imc.height, 170);
    });

  });
}