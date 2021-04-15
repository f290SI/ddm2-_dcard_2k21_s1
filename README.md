# MiCard 1.0

## Steps

### Step 01 - Dependências externas
1. Adicione o trecho de código abaixo de `cupertino_icons: ^1.0.2` no **pubspec.yaml**;
```yml
  font_awesome_flutter: ^9.0.0
  url_launcher: ^6.0.3
```
### Step 02 - Fontes customizadas 
Estile ainda mais sua aplicação; baixe arquivos de fontes customizadas para utilizar.
1. Crie na raiz do projeto o diretório `assets`;
2. Dentro do diretório `assets`; crie o diretório `fonts`;
3. Cpoie para o diretório `fonts` as fontes que voê baixou;
4. Atualize o **pubspec.yaml** com o trecho abaixo:
```yml
  fonts:
   - family: Devonshire
     fonts:
       - asset: assets/fonts/Devonshire-Regular.ttf
```
5. Atente-se à identação do yml, o atributo font está a uma tabulação do inicio da linha, as linhas abaixo seguem o mesmo princípio.
### Step 03 - Consolidar os novos recursos
1. No terminal digite:
```shell
flutter pub get
```
### Step 04 - Importe as dependencias
1. No topo do arquivo `main.dart` adicione o código abaixo:
```javascript
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
```

### Step 05 - Crie o método principal e o os Widgets
1. Método main:
```javascript
main() => runApp(MyApp());
```
2. Crie um Statelles Widget com appbar, body e floatinactionbutton:
```javascript
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
        appBar: AppBar(
          backgroundColor: darkBlue,
          title: Text('MiCard'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text('Like'),
          icon: Icon(FontAwesomeIcons.facebook),
        ),
      ),
    );
  }
```
3. Acima do método build, adicione as cores para reutilizarmos no tema:
```javascript
  // Cores utilizadas no App
  final darkBlue = Color.fromARGB(255, 18, 32, 47);
  final pinkAccentA200 = Colors.pinkAccent.shade200;
  final linkedInColor = Color.fromARGB(255, 40, 103, 178);
  final facebookColor = Color.fromARGB(255, 66, 103, 178);
  final facebook = Color(0xFF4267B2);
```
### Step 06 - Adicionando o tema
1. Dentro do Widget MaterialApp, acima do atributo `home`, adicione o tema incluindo o trecho abaixo:
```javascript
    theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: facebookColor,
          foregroundColor: Colors.white,
        ),
      ),
```


