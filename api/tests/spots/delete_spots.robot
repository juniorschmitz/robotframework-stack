*** Settings ***				
Resource    ../../resources/services.robot

# Dado que tenho um spot cadastrado
# Quando a remoção pelo ID
# Então deve retornar o código de resposta 204 (no Content)

# Desafio da semana (implementar o Delete)
# Dica: é muito, mas muito parecido com o Get

# Orientação:
# Enviar o este arquivo para fernando@qaninja.io com o assunto (Desafio Robot Turma 2)
# Os três primeiros que enviarem até 11/02 ganharão na faixa qualquer outro curso Online

*** Settings ***
Library     OperatingSystem

Resource    ../../resources/services.robot

Suite Setup     Set Token   jacques@teste.com

*** Test Cases ***
Delete Spot
    &{my_spot}=         Create Dictionary       company=Another Spot   techs=ruby  price=30    user=${token}
    ${spot_id}=         Insert Unique Spot      ${my_spot}
    Log To Console      ${spot_id}

    ${response}=        Delete Spot By Id         ${spot_id}
    ${code}=            Convert To String         ${response.status_code}
    Should Be Equal     ${code}     204
