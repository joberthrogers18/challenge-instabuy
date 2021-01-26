# Desafio InstaBuy

## Fluxo da Aplicação

![fluxo](https://i.imgur.com/dYc2JsH.gif)

## Screenshots

#### Splash Screen

![splashscreen](https://i.imgur.com/2LQnjo4.png)

#### Página Inicial

![homePage](https://i.imgur.com/cZBh0TQ.png)

#### Detalhes do Produto
![productDetail](https://i.imgur.com/NS4dAt2.png)


### Instalando Flutter

#### Linux

##### Instalando Flutter usando o snapd

Para instalar flutter você pode user o snapd, caso não tenha em seu computador utilize:

```
sudo apt install snapd
```

Utilize o comando abaixo para instalar a sdk do flutter:

```
sudo snap install flutter --classic
```

#### macOS

No sistema utilize entre no link: https://flutter.dev/docs/get-started/install/macos e baixe o arquivo no formato zip da página.

![Flutter Mac](https://user-images.githubusercontent.com/46005310/93666270-3fedcc80-fa53-11ea-96c8-a187c8771db8.png)

Extraia os arquivo:

```
 cd ~/nome_da_pasta
 unzip ~/Downloads/flutter_macos_1.20.4-stable.zip
```

### Configurando flutter

Rode o comando `flutter doctor` para analisar e dizer quais configurações principais do sdk, você deve seguir o passo a passo indicado por este comando para conseguir rodar o flutter 100%.

## Uso

### Baixando as dependências

No diretório da aplicação utilize:

```
flutter packages get
```

### Rodando aplicativo localmente utilizando o VsCode

Para você conseguir rodar o aplicativo localmente você pode utilizar o VS Code, ou outras ferramentas recomendadas na própria [Documentação do Flutter](https://flutter.dev/docs/development/tools/vs-code).

Para utilizar o VS Code você deve instalar a extensão [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter) onde ela vai adicionar no seu editor de texto várias opções que irão te auxiliar na execução de projetos flutter.

![Ícones Extensão Flutter](https://user-images.githubusercontent.com/46005310/93666426-809a1580-fa54-11ea-84ad-1bac30a27c80.png)

E para rodar o aplicativo basta você conectar seu celular no computador, utilizando um cabo USB, e ativar a depuração USB do mesmo, ou utilizar um emulador de iOS, casa você esteja utilizando um macOS, ou de Android, caso você esteja utilizando qualquer sistema operacional. Após ter os dispositivos conectados basta apertar no botão *play* que está disponivel quando você abre o código main.dart no seu VS Code.

### Rodando aplicativo localmente utilizando o Android Studio

Caso você tenha o Android Studio instalado em sua máquina, baixe um emulador dentro da plataforma

![devices](https://i.imgur.com/F4OCNF9.png)

Após instalado, escolha o emulador instalado e execute no play da propria IDE.

![players](https://i.imgur.com/T9UfdHd.png)