## Executando o projeto 7Pay:

### Pré-requisitos:
- Flutter versão 3.0.0 instalado.
- Ambiente de desenvolvimento configurado.

### Passos:

1. **Clonar o Projeto:**
   Clone o repositório do projeto em sua máquina local utilizando o comando:

   `git clone <URL_DO_REPOSITORIO>`

2. **Obter Dependências:**
  Navegue até o diretório do projeto clonado e execute o comando:

    `flutter pub get`

3. **Selecionar Dispositivo:**
Selecione Google Chrome como dispositivo de destino. Certifique-se de ter o plugin `Flutter` instalado e configurado no VSCode.

4. **Executar no Modo Debug:**
  Execute o projeto em modo de depuração (debug) selecionando o arquivo `main_prod.dart` como ponto de entrada. Você pode fazer isso no VSCode clicando em "Run" e selecionando a opção de execução de debug para o arquivo `main_prod.dart`.
    - Ou vá na opção de debug do VSCode,e selecione "seven_pay (PROD)" ou "seven_pay (DEV)" (informações do arquivo de configuração launch.json para execução no VSCode)

      ![image](https://github.com/mateusluiz/seven_pay/assets/44786247/693c5d2d-5b92-4613-8dbb-7c7478656ff6)


6. **Alternativa:**
  Caso prefira executar via linha de comando, utilize o comando:

    - `flutter run -d chrome --release -t lib/main_prod.dart --dart-define TYPE_STATE=mobx`
    - `flutter run -d chrome --release -t lib/main_prod.dart --dart-define TYPE_STATE=getx`

Após seguir esses passos, o projeto Flutter será executado no Google Chrome em modo de depuração, pronto para ser testado e desenvolvido.
