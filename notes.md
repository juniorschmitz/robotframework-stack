## About run Forrest

Example
robot -d .\logs tests\spots.robot

## About BDD, BDT and ATDD

Examples
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

## About Faker

Examples
pip install robotframework-faker

Colocar Library FakerLibrary
Exemplo no passo do nome da empresa para colocar o nome fake:
${fakecompany}=     FakerLibrary.Company
Input Text      css:input[placeholder=*empresa]     ${fakecompany}


## About MongoDB
Dependencies (use Robot 3T as software interface for mongodb connections)
pip uninstall -y bson pymongo
pip install bson==0.5.7
pip install pymongo==3.7.2

## Etc
We should maintain control of the data used on automated tests, we should orchestrate the scenarios and create/delete the data we need for using on our
automated tests as needed.

A great example is erasing all data used on the test environment and creating it again when running regression tests, as the test environment is a sandbox
environment, we should be able to clean it and create new data as needed.

## Container/Docker in Docker
The containers should be root, if not, the container is going to ask sudo permissions and the build is going to fail
In some installations, this problem occurs, and it is not possible to run Jenkins pipelines using Docker containers as agents, there is another way for
using Jenkins in containers below.

## Another way for creating the Jenkins Container
docker network create skynet
docker volume create jenkins-data
docker pull jenkinsci/blueocean
### Linux
docker container run --name jenkins-blueocean --detach \
  --network skynet -u root \
  --volume jenkins-data:/var/jenkins_home \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --publish 8080:8080 --publish 50000:50000 jenkinsci/blueocean
### Windows
docker container run --name jenkins-blueocean --detach ^
  --network skynet -u root ^
  --volume jenkins-data:/var/jenkins_home ^
  --volume /var/run/docker.sock:/var/run/docker.sock ^
  --publish 8080:8080 --publish 50000:50000 jenkinsci/blueocean
### Verify
docker ps
### Enter the container and get the secret
docker exec -it jenkins-blueocean bash
cat /var/jenkins_home/secrets/initialAdminPassword
