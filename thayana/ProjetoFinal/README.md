Aplicativo Flutter de listagem de restaurantes e categorias, desenvolvido como projeto final da disciplina **Desenvolvimento Mobile Multiplataforma**.

## Funcionalidades implementadas

- Exibição de restaurantes com imagem, nome e descrição. E com scroll horizontal.
- Listagem de categorias de comida, seguindo o padrão adotado em restaurantes.
- Exibição de postagens recentes com foto e comentário.
- Alternância entre tema claro e escuro.
- Favoritar restaurantes.
- Tratamento de erros e placeholders para imagens.
- Mock API integrada (`https://app-restaurant.wiremockapi.cloud`).

## Estrutura da parte central do projeto

```bash
docs/
lib/
├── api/
│ └── mock_service.dart
├── components/
│ ├── categories_components.dart
│ ├── post_components.dart
│ └── restaurants_component.dart
├── models/
│ ├── constants.dart
│ ├── food_category.dart
│ ├── models.dart
│ ├── post.dart
│ └── restaurant.dart
├── screens/
│ ├── explore_page.dart
├── DarkApp.dart
├── home.dart
└── main.dart
```

## Como executar o projeto

### 1. Instalar o Flutter SDK
1. Baixe o **Flutter SDK (versão stable)** em [flutter.dev](https://flutter.dev/docs/get-started/install).
2. Extraia o conteúdo em: ```C:\src\flutter```  
3. Adicione ao **PATH do sistema**: ```C:\src\flutter\bin```  
4. Feche e reabra o terminal, e execute:  
```flutter doctor -v```

### 2. Clonar e configurar o projeto

```bash
git clone <URL_DO_SEU_REPOSITORIO> yummy
cd yummy
flutter pub get
```

### 3. Executar no navegador (modo Web)

```bash
flutter run -d chrome --web-browser-flag="--disable-web-security" --web-browser-flag="--user-data-dir=C:\tmp\chrome-dev"
```
Esse comando abre o Chrome com CORS desativado, permitindo o carregamento de imagens externas.   
⚠️ Por questões de segurança, evite abrir outras abas ou sites pessoais nessa mesma janela.

#### Como simular tela de celular (estando no modo web)

1. Pressione F12 no Chrome.
2. Clique no ícone de celular (Ctrl + Shift + M).
3. Escolha um dispositivo (ex.: Pixel 5).
4. Reduza a largura da janela para ~375px — para conseguir visualizar o scroll horizontal dos restaurantes e categorias.

### 4. (Opcional) Executar no celular Android via USB

1. Ative Depuração USB no celular:  
```Configurações → Opções do desenvolvedor → Depuração USB```

2. Baixe o pacote leve de ferramentas:  
```Platform-tools for Windows```

3. Extraia em:  
```C:\Android\platform-tools```

4. Adicione ao PATH:  
```C:\Android\platform-tools```

5. Conecte o celular via USB e aceite a permissão de depuração.

6. Execute:

    ```bash
    flutter devices
    flutter run -d <id_do_aparelho>
    ```

### 5. Demonstração

Segue GIF demonstrando o funcionamento do aplicativo.  

![git](docs/demo.gif)


### 6. Observações

- O CORS está desativado somente no modo de desenvolvimento Web.
- Em execução no Android físico, as imagens carregam normalmente (sem CORS).
- O projeto não requer Android Studio ou emulador.

---

🧠 Autoria: Thayana Ferreira