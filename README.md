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

### Step 07 - Adicionando os Widgets
1. Adicione o `CircleAvatar` como primeiro elemento da `Column`:
```javascript
    CircleAvatar(
      radius: 80,
      backgroundColor: pinkAccentA200,
      child: CircleAvatar(
        radius: 75,
        backgroundImage: NetworkImage(imageUrl),
      ),
    ),
```
2. Adicione um espaço vertical com `SizedBox`:
```javascript
   SizedBox(
    height: 24,
    width: double.infinity,
  ),
 ```
 3. Adicione o seu nome:
 ```javascript
     Text(
      'Larissa Belloni',
      style: TextStyle(
        //Uso de fonte customizada por recurso adicional via pubspec.
        fontSize: 48, fontFamily: 'Devonshire',
      ),
    ),
 ```
 4. Adicione um `Divider` envolto por um `Padding`:
```javascript
    Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 8),
      child: Divider(
        height: 10,
        color: pinkAccentA200,
        thickness: 2,
      ),
    ),
```
5. Adicione o destaque do Cartão de visitas:
```javascipt
    Text(
      'FLUTTER DEVELOPER',
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
    ),
    SizedBox(
      height: 26,
    ),
```
6. Adicione os botões customizados:
```javascript
Card(
              color: pinkAccentA200,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
              elevation: 8,
              //Inclusao de WidGet ListTile para estruturar o icone a esquerda e o texto no centro sem utilização de Row()
              child: ListTile(
                leading: Icon(FontAwesomeIcons.github),
                title: Text('Meu Portfólio no GitHub'),
              ),
              //Arredondar os cantos do Card
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
            ),
            Card(
              color: linkedInColor,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
              elevation: 8,
              child: ListTile(
                leading: Icon(FontAwesomeIcons.linkedin),
                title: Text('LinkeIn'),
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
            ),
            TextButton.icon(
              icon: Icon(FontAwesomeIcons.solidEnvelope),
              label: Text('larissabelloni@fatec.sp.gov.br'),
              style: TextButton.styleFrom(primary: Colors.white54,),
            ),
          ],
        ),
```

### Step 08 - Adicione a interação aos botões
Vamos utilizar alguns métodos da dependencia `url_laucher` para abrir algumas páginas!
1. Logo abaixo da declaração das cores, adicione a função abaixo, ela recebera um url como argumento e a abrira em um WebView nativo:
```javascript
  Future<void> _launchInWebView(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
```
2. Nos botões customizados que utilizam `Card` com `ListTile`, adicione a propriedade `onTap` dentro do `ListTile`:
```javascript
onTap: () {
  _launchInWebView('url da página que voce deseja abrir');
},
```
3. No `FloatinActionButton`, adicione o `onPressed`:
```javascript
onPressed: () {
  _launchInWebView('https://www.facebook.com/seufacebook');
},
```

### Step 09 - Build, Run and Fun
Confira o seu código com o arquivo main.dart no projeto, caso encontre dificuldade.









