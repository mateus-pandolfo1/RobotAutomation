*** Settings ***
Resource    ../support/commom.robot

*** Variables ***

${AddNewPetButton}                                  //*[contains(text(),'Adicionar novo PET')]
${PetNameField}                                     //*[@id='petNome']   
${PetTypeField}                                     //*[@id='tiposPet']
${BirdTypeField}                                    //*[@id="tiposPet"]/option[2]
${PetBreedField}                                    //*[@id="pet.raca"]
${BreedTypeField}                                   //*[@id="pet.raca"]/option[2]            
${PetBirthDayField}                                 //*[@id='petDataNascimento'] 
${SaveButton}                                       //*[@id='addPetButton'] 
${PetCardAdded}                                     (//*[@*='wrapper-box meuspets-item card-pet-details'])[1]
${DeletePetButton}                                  //*[@*='pet-remover']
${EditPetButton}                                    //*[contains(text(),'editar')]

${PetName}                                          Filo Web
${PetBirthDay}                                      01022024
${PetType}                                          Ave

*** Keywords ***
I Click To Add A New Pet
    Validate and Click                              ${AddNewPetButton}

I Click To Edit The Pet
    Validate and Click                              ${EditPetButton}

I Fill Pet Information
    I Fill Pet Name                                   Filo 
    Select Options By                               ${PetTypeField}                   index                    1
    Select Options By                               ${PetBreedField}                  index                    1
    Validate and Fill Text                          ${PetBirthDayField}               ${PetBirthDay}
    I Click To Save Pet

I Fill Pet Name
    [Arguments]        ${PetNameToFill}
    Validate and Fill Text                          ${PetNameField}                   ${PetNameToFill}

I Click To Save Pet
    Validate and Click                              ${SaveButton}

The Pet Has Been Added Successfully
    Validate Element                                ${PetCardAdded}    

I Click To Delete Pet
    Validate and Click                              ${DeletePetButton}

The Pet Has Been Deleted Successfully
    Wait For Elements State                         ${PetCardAdded}         hidden                                  
    

