*** Settings ***
Resource    ../support/commom.robot


*** Variables ***
#dogCategory
${DogCategoryButton}                                    (//*[contains(text(),'Cachorro')])[1]
${RacaoButton}                                          //a[@class='categoria-faceta']//*[contains(text(),'Ração')]
${RacaoSecaButton}                                      //a[@class='categoria-faceta']//*[contains(text(),'Ração Seca')]
${RacaoSecaProduct}                                     (//p[contains(text(),'Ração Golden Special')])[1]

#catCategory
${CatCategoryButton}                                    (//*[contains(text(),'Gato')])[1]
${CatRacaoButton}                                       //a[@class='categoria-faceta']//*[contains(text(),'Ração')]
${CatRacaoSecaButton}                                   //a[@class='categoria-faceta']//*[contains(text(),'Ração Seca')]
${CatRacaoSecaProduct}                                  (//p[contains(text(),'Ração Golden para Gatos')])[1]

#birdCategory
${BirdCategoryButton}                                   (//*[contains(text(),'Pássaro')])[1]
${BirdFoodButton}                                       //a[@class='categoria-faceta']//*[contains(text(),'Alimentação')]
${CalopsitaFoodButton}                                  //a[@class='categoria-faceta']//*[contains(text(),'Calopsita')]
${BirdFoodProduct}                                      (//p[contains(text(),'para Calopsitas')])[1]

#fishCategory
${FishCategoryButton}                                  (//*[contains(text(),'Peixe')])[1]
${FishFoodButton}                                      //a[@class='categoria-faceta']//*[contains(text(),'Alimentação')]
${BaseFishFoodButton}                                  //a[@class='categoria-faceta']//*[contains(text(),'Alimento Base')]
${FishFoodProduct}                                     (//p[contains(text(),'para Peixe')])[1]

#otherPets
${OtherPetsCategoryButton}                             (//*[contains(text(),'Outros Pets')])[1]
${RabbitButton}                                        //a[@class='categoria-faceta']//*[contains(text(),'Coelhos')]
${RabbitFoodButton}                                    //a[@class='categoria-faceta']//*[contains(text(),'Ração')]
${RabbitFoodProduct}                                   (//p[contains(text(),'para Roedores')])[1]

#houseAndGarden
${HouseGardenCategoryButton}                            (//*[contains(text(),'Casa e Jardim')])[1]                  
${GardenButton}                                         //a[@class='categoria-faceta']//*[contains(text(),'Jardim')]     
${SeedButton}                                           //a[@class='categoria-faceta']//*[contains(text(),'Sementes')]   
${HouseGardenProduct}                                   (//p[contains(text(),'Semente')])[1]           

#Menu
${ServiceMenu}                                          (//span[contains(text(),'Serviços')])[1]

#ServicesOptions
${VeterinarianService}                                  (//*[@*='Veterinário'])
${BathGroomingService}                                  (//*[@*='Banho&Tosa'])
${AdoptionService}                                      (//*[@*='Adoção'])
${TrainingService}                                      (//span[contains(text(),'Adestramento')])[2]
${CaoCidadaoService}                                    (//*[@*='Cão Cidadão'])
${CursoOnlineService}                                   (//*[@*='Cursos Online Dr. Pet'])






*** Keywords ***

Access Profile Menu
    Wait For Load State    Load
    Click    ${Header_Profile_Button}

Search Product
    [Arguments]    ${Product}
    Click          ${Search_Field_Xpath}  
    Fill Text      ${Search_Field_Xpath}    ${Product}
    Click          ${Button_Search_Xpath}

Access The Product
    Wait For Elements State    ${Product_Xpath}    Visible
    Click                      ${Product_Xpath}

I Open The Section Of A Product In The Dog Category
    Validate and Click                   ${DogCategoryButton}
    Validate and Click                   ${RacaoButton}
    Validate and Click                   ${RacaoSecaButton}

I Open The Section Of A Product In The Cat Category
    Validate and Click                   ${CatCategoryButton}
    Validate and Click                   ${CatRacaoButton}
    Validate and Click                   ${CatRacaoSecaButton}

I Open The Section Of A Product In The Bird Category
    Validate and Click                   ${BirdCategoryButton}
    Validate and Click                   ${BirdFoodButton}
    Validate and Click                   ${CalopsitaFoodButton}

 I Open The Section Of A Product In The Fish Category
    Validate and Click                   ${FishCategoryButton}
    Validate and Click                   ${FishFoodButton}
    Validate and Click                   ${BaseFishFoodButton}

I Open The Section Of A Product In The Other Pets Category
    Validate and Click                   ${OtherPetsCategoryButton}
    Validate and Click                   ${RabbitButton}
    Validate and Click                   ${RabbitFoodButton}

I Open The Section Of A Product In The House And Garden Category
    Validate and Click                   ${HouseGardenCategoryButton}
    Validate and Click                   ${GardenButton}
    Validate and Click                   ${SeedButton}
The Products Of Dog Category Will Be Displayed
    Validate Element                     ${RacaoSecaProduct}

The Products Of Cat Category Will Be Displayed
    Validate Element                     ${CatRacaoSecaProduct}

The Products Of Bird Category Will Be Displayed
    Validate Element                     ${BirdFoodProduct}

Then The Products Of Fish Category Will Be Displayed
    Validate Element                     ${FishFoodProduct}

The Products Of Other Pets Category Will Be Displayed
    Validate Element                     ${RabbitFoodProduct}

 The Products Of House And Garden Category Will Be Displayed
     Validate Element                     ${HouseGardenProduct}

I Click On Service Menu
    Validate And Click                         ${ServiceMenu}   
I Click On Veterinarian Service
    Validate And Click                         ${VeterinarianService}   

I Click On Bath And Grooming Service
    Validate And Click                         ${BathGroomingService}   
    
I Click On Adoption Service
    Validate And Click                         ${AdoptionService}   

I Click On Training Service
    Validate And Click                         ${TrainingService}
    Validate and Click                         ${CaoCidadaoService}

I Click On Online Course Service
    Validate And Click                         ${TrainingService}
    Validate and Click                         ${CursoOnlineService}

Access The Bag
    Click    ${Bag_Xpath}
    Sleep    3
    Wait For Elements State    ${Go_To_Bag_Button_Xpath}    Visible
    Wait For Elements State    ${Img_Bag_Xpath}    Visible
