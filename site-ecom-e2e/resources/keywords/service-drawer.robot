*** Settings ***
Resource    ../support/commom.robot

*** Variables ***

#Veterinarian
${VeterinarianTittle}                       //*[@id='h1']
${VeterinarianTextTittle}                   Tudo para manter a saúde do seu pet em dia
${VeterinarianSubtittle}                    //*[@id='p']
${VeterinarianTextSubtittle}                Vacinas, consultas e exames com qualidade e carinho.
${ScheduleVeterinarianButton}               //*[@id='cta']

#BathGrooming
${BathGroomingTittle}                       //*[@id='h1']
${BathGroomingTextTittle}                   O cuidado que o seu pet merece
${BathGroomingSubtittle}                    //*[@id='p']
${BathGroomingTextSubtittle}                Serviços completos e seguros para a higiene do seu melhor amigo.
${ScheduleBathGroomingButton}               //*[@id='cta']

#Adoption
${ExpectedUrl}                              https://www.adotepetz.com.br/
${AdoptionTittle}                           //*[contains(text(),'Conheça o Adote Petz')]
${AdoptionSubtittle}                        //*[contains(text(),'Nós fazemos a conexão entre quem')]

#Training
${TrainingTittle}                           //*[@id='h1']
${TrainingTextTittle}                       Dê o primeiro passo para melhorar o comportamento do seu pet
${TrainingSubtittle}                        //*[@id='p']
${TrainingTextSubtittle}                    Adestramento online e presencial para te ajudar a transformar a relação com o seu melhor amigo.
${TrainingButton}                           //*[@id='cta']

#OnlineCourse
${OnlineCourseTittle}                       //*[@class='hero-title']
${OnlineCourseTextTittle}                   Cursos feitos por quem entende, para quem ama
${OnlineCourseSubTittle}                    //*[@class='hero-subtitle']
${OnlineCourseTextSubTittle}                Aprenda a educar seu pet de forma eficiente e respeitosa com Alexandre Rossi, o Dr Pet.


*** Keywords ***
I Validate The Veterinarian Page
    Switch Page                             NEW
    Validate Text on Screen                 ${VeterinarianTittle}                 ${VeterinarianTextTittle}
    Validate Text on Screen                 ${VeterinarianSubtittle}              ${VeterinarianTextSubtittle}
    Validate Element                        ${ScheduleVeterinarianButton}        

 I Validate The Bath And Grooming Page
    Switch Page                             NEW
    Sleep                                   5
    Validate Text on Screen                 ${BathGroomingTittle}                 ${BathGroomingTextTittle}
    Validate Text on Screen                 ${BathGroomingSubtittle}              ${BathGroomingTextSubtittle}
    Validate Element                        ${ScheduleBathGroomingButton}    
 I Validate The Adoption Page
    Switch Page                             NEW
    ${AdptionActualUrl}=                    Get Url
    Should Be Equal As Strings              ${AdptionActualUrl}                   ${ExpectedUrl}
    Validate Element                        ${AdoptionTittle}                 
    Validate Element                        ${AdoptionSubtittle}              
 I Validate The Training Page
    Switch Page                             NEW
    Validate Text on Screen                 ${TrainingTittle}                     ${TrainingTextTittle}
    Validate Text on Screen                 ${TrainingSubtittle}                  ${TrainingTextSubtittle}
    Validate Element                        ${TrainingButton}    

 I Validate The Online Course Page
    Switch Page                             NEW
    Validate Text on Screen                 ${OnlineCourseTittle}                 ${OnlineCourseTextTittle}
    Validate Text on Screen                 ${OnlineCourseSubTittle}              ${OnlineCourseTextSubTittle}



