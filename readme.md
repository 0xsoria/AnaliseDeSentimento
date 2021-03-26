# Análise de sentimento

Dado um usuário do Twitter, o app irá mostrar os últimos tweets dele e ao escolher um Tweet, o app fará análise do sentimento do tweet.

## Solução adotada

O projeto deve ser executado pelo .xcworkspace que contém um Package que contém os módulos do App.

Módulos:
- App: RootViewController que faz o gerenciamento das features que são interdependentes;
- FeatureTweets: Feature que busca um usuário do Twitter e se encontrado ele mostra os últimos tweets. Ao escolher um tweet específico, o App irá chamar a feature de análise de sentimento para analisar o tweet;
- FeatureMoodAnalyzer: Feature que faz análise de sentimento de um texto e mostra se o texto tem um sentimento feliz, neutro ou triste;
- CoreProviders: Faz a implementação concreta das chamadas para um endpoint. Pode ser usado também para outras implementações concretas, por exemplo, CoreData;
- RootElements: Elementos e extensões que podem ser usados por features ou pelo App.

O projeto principal importa o módulo App que contém apenas uma RootViewController que é quem faz o gerenciamento das features já que uma feature não pode depender de outra.
As features podem importar apenas os CoreProviders ou os RootElements.

App -> Features -> Core -> Root -> Dependencies

## Execução

Abrir o MoodAnalyzer.xcworkspace, abrir o arquivo do projeto na aba Info e adicionar o arquivo APIConfig.xcconfig para as configurações de Debug e Release.


