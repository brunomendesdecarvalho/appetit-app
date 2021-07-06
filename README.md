# Appetit

### Descrição do Projeto:
O seguinte projeto foi feito como solução para o teste de ingresso ao time de desenvolvimento Flutter da Maida.health.

O aplicativo visa realizar vendas de produtos de uma cafeteria fictícia chamada Appetit. Conforme projeto do Figma, constam as telas de Login - com validações, listagem de pedidos - pré-renderizada, não sendo alterada ao final do fluxo; tela de novo pedido - com os produtos e seus respectivos valores; tela de detalhes do pedido - para selecionar uma opção e inserir uma quantidade, uma tela de seleção de clientes, uma tela para selecionar se o cliente já pagou ou não e escolher a data do pagamento e, por fim, a tela de sucesso no pedido.

Os testes foram feitos nas builds para Windows, Google Chrome (web) e Android, via emulador do Android Studio.

### Descrição do Fluxo:
O usuário inicia a página na tela de Login, onde deve inserir um e-mail e uma senha válidos, para que o botão de login seja habilitado. As validações são:
- Para o e-mail: se é válido (formato email@dominio.com), se é igual ao e-mail padrão utilizado para os testes no aplicativo: teste@teste.com;
- Para a senha: se possui, no mínimo, 6 caracteres; se é igual à senha padrão utilizada para os testes no aplicativo: 123456;

Para a realização do formulário, foi utilizada o pacote [Reactive Forms](https://pub.dev/packages/reactive_forms).

Ao realizar o login, o usuário é levado para a página inicial, onde se encontra um título com uma mensagem de boas-vindas padrão, junto com uma barra de busca e um histórico de vendas agrupadas por dia. A listagem é estática, logo, ao final da operação de venda, não será incrementada. Ela foi desenhada para fins de testes.

Ao apertar no card "fazer novo pedido", o usuário é redirecionado para uma página de informações do pedido. Nela, constam uma barra de progresso criada através do pacote [Flutter Animation Progress Bar](https://pub.dev/packages/flutter_animation_progress_bar), uma guia de busca e a lista de produtos, agrupadas por tipo (no caso, cuscuz ou pães).

Ao selecionar um card, o usuário é levado para a página de detalhes do pedido, onde pode selecionar entre duas opções de massas (para cuscuz, arroz ou milho e, para pães, massa fina ou grossa). Ainda, pode acrescentar observações ao pedido. Ao selecionar uma das opções, a barra inferior aparece, com a quantidade desejada e o valor total. O usuário pode aumentar ou diminuir a quantidade desejada, impactando no valor total do pedido. Ao clicar em "adicionar", ele é redirecionado para a página de lista de produtos, onde o card do produto selecionado estará laranja e haverá uma barra inferior com o valor total da compra e um botão para avançar. Caso deseje, o usuário poderá adicionar outro pedido.

A comunicação entre os widgets desta página foi feita por meio de gerência de estado, tanto nativamente quanto por meio do pacote [GetX](https://pub.dev/packages/get).

Ao clicar em "Avançar", o usuário irá para a página de seleção dos clientes. Ao selecionar um card, este se tornará laranja e a barra inferior aparecerá, com a quantidade de clientes selecionados e o botão de avanço. Podem ser selecionados mais de um e, conforme assim os forem, a quantidade de clientes na barra inferior será atualizada. A gerência de estado foi feita da mesma forma que na página de produtos.

Após a página de clientes, vem a página de finalização do pedido, onde o usuário seleciona se o cliente já pagou ou não e a data do pagamento. Apenas um card pode ser selecionado por vez, e apenas uma data entre o dia atual e 1 ano no futuro pode ser selecionada. O botão de finalizar o pedido só é habilitado caso os dois campos sejam preenchidos.

Por fim, vem a página de feedback do pedido, mostrando que ele fora realizado com sucesso. Ela possui dois botões: o primeiro, para fazer outro pedido e, o segundo, para voltar para a página inicial.

### Descrição da Organização do Projeto:
Até a data da escrita desse Readme.md, o projeto basicamente consiste em algumas pastas dentro da lib, a saber:
- loginPage, onde se encontram os widgets e uma outra pasta "components" com alguns arquivos úteis;
- homePage, onde se encontram os widgets da página inicial e uma pasta "components" com alguns arquivos importantes, dentre eles o script que gera a lista estática de pedidos;
- newOrderPage, onde estão as páginas associadas ao pedido: lista de produtos, lista de clientes e seleção de data. Além disso, há uma pasta components com alguns componentes úteis e uma pasta widgets, com alguns widgets importantes;
- endPage, onde se encontra a página de feedback do pedido.

Não foi utilizado um padrão específico de projeto, tal como MVC, MVVM ou BloC. 

### Pacotes utilizados:

As dependências que se encontram no arquivo pubspect.yaml, são as seguintes:
- group_list_view: ^1.1.1
- reactive_forms: ^10.4.1
- flutter_animation_progress_bar: ^2.0.0
- page_transition: ^2.0.2
- flutter_form_builder: ^6.0.1
- flutter_material_pickers: ^3.1.0
- grouped_buttons: ^1.0.4
- get: ^4.1.4
- flutter_localizations:
    sdk: flutter
- flutter_rounded_date_picker: 2.0.2

### Bugs Conhecidos:
- Ao selecionar a primeira opção (realizar novo pedido) na página final, os cards selecionados permanecem laranjas, embora o preço seja resetado normalmente.

### Como Rodar o Projeto:

#### Clonando o Projeto no Computador:
Antes de mais nada, é preciso copiar esse repositório para o computador. Para isso, de posse do Git instalado e configurado no computador, abra um terminal de preferência, na pasta desejada, e digite a seguinte linha de comando:
```
git clone https://github.com/brunomendesdecarvalho/appetit-app.git
```
O repositório será todo copiado para a pasta onde o terminal está aberto.

#### Antes de Rodar o Projeto:
Um primeiro passo interessante a se fazer, antes de iniciar o projeto propriamente dito, é rodar o flutter doctor, para averiguar se todos os requisitos para iniciar a aplicação estão satisfeitos:
```
flutter doctor
```
Caso haja algum problema, acesse este [link](https://flutter.dev/docs/get-started/install) para realizar a instalação das dependências necessárias.

Para verificar se há dispositivos disponíveis para rodar a aplicação:
```
flutter devices
```
Para entrar na pasta da aplicação, no mesmo terminal:
```
cd pasta_da_aplicacao
```
Caso seja necessário instalar as dependências, no terminal, digite:
```
flutter pub get
```

#### Rodando o Projeto:
Por fim, para executá-la:
```
flutter run
```
Uma lista com os dispositivos disponíveis aparecerá. Basta escolher o desejado e esperar o aplicativo iniciar.

### Agradecimentos:
Sou muito grato à Maida.health, por me permitir a oportunidade de participar deste processo seletivo. Foi bastante desafiador, aprendi muita coisa nova e, independentemente do resultado, estou muito satisfeito, porque pude dar o meu melhor com tudo aquilo que eu sabia e com o que consegui aprender.
Espero que gostem do que fiz, e torço para que este teste seja só o começo das nossas relações. :)

Atenciosamente,

Bruno Mendes de Carvalho Castelo Branco.
