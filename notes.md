## About BDD, BDT and ATDD

```python
*** Settings ***
Documentation   Sessao
...     Para que eu possa disponibilizar spots para locação
...     Sendo um administrador de spots
...     Quero poder cadastrar novas empresas

*** Test Cases ***
# BDT (Teste guiado por comportamento) -> Pensando em como testar o Software
Novo Spot BDT
    Dado que eu estou logado
    Quando eu clico em cadastrar novo spot
    E faço o upload do escritorio
    E preencho o campo empresa com "Google"
    E informo as tecnologias "ruby, java, exlir"
    E preencho o valor da diária com "10" reais
    Quando eu clico em cadastrar
    Então um novo spot deve surgir no meu dashboard

# BDD -> Pensando em como uso o Software
Novo Spot BDD
    Dado que estou logado como Admin
    E que eu tenho um spot disponivel na empresa "Google"
    E este spot possui a imagem "google.jpg"
    E usamos as seguintes tecnologias "java, golang, c"
    E o valor da diaria e de "10" reais
    Quando eu faço o cadastro deste spot
    Entao devo ver o spot e valor da diaria no dashboard

# ATDD (Acceptance Test-Driven Development - Teste de aceitação guiado por comportamento)
Novo spot ATDD
    Faco login no sistema
    Clico no botao cadastrar novo spot
    Faco o upload da fotinho
    Preencho o campo empresa com "Google"
    Informo as tecnologias "ruby, java, exlir"
    Preencho o valor da diaria com "10" reais
    Clico em cadastrar
    Devo ver um novo spot no meu dashboard
```
