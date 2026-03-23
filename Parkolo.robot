*** Settings ***
Library    Selenium2Library

*** Test Cases ***
Belépés Helyesen
    Open Browser    https://parking-garage-app.netlify.app/    browser=Chrome
    Sleep    2s
    Click Element    //*[@id="login-link"]
    Input Text    //*[@id="email"]    text=kukac@ku.kac
    Input Text    //*[@id="password"]    text=kukimuki
    Click Button    //*[@id="login-button"]
    Close Browser

Belépés Rossz Jelszó
    Open Browser    https://parking-garage-app.netlify.app/    browser=Chrome
    Sleep    2s
    Click Element    //*[@id="login-link"]
    Sleep    1s
    Input Text    //*[@id="email"]    text=kukac@ku.kac
    Input Text    //*[@id="password"]    text=asd123
    Click Button    //*[@id="login-button"]
    Sleep    2s
    Page Should Contain Element    class:error-message
    Close Browser

Belépés Rossz Névvel
    Open Browser    https://parking-garage-app.netlify.app/    browser=Chrome
    Sleep    2s
    Click Element    //*[@id="login-link"]
    Sleep    1s
    Input Text    //*[@id="email"]    text=fity@firity.comm
    Input Text    //*[@id="password"]    text=asd123
    Click Button    //*[@id="login-button"]
    Sleep    2s
    Page Should Contain Element    class:error-message
    Close Browser

Belépés Üres Névvel
    Open Browser    https://parking-garage-app.netlify.app/    browser=Chrome
    Sleep    2s
    Click Element    //*[@id="login-link"]
    Sleep    1s
    ${nev}=    Get Title
    Input Text    //*[@id="email"]    text=
    Input Text    //*[@id="password"]    text=asd123
    Click Button    //*[@id="login-button"]
    Sleep    2s
    ${nevUj}=    Get Title
    Should Be Equal As Strings    first=${nev}    second=${nevUj}
    Close Browser

Be -S- Kijelentkezés
    Open Browser    https://parking-garage-app.netlify.app/    browser=Chrome
    ${title}=    Get Title
    Click Element    //*[@id="login-link"]
    Sleep    2s
    Input Text    //*[@id="email"]    text=kukac@ku.kac
    Input Text    //*[@id="password"]    text=kukimuki
    Click Button    //*[@id="login-button"]
    Sleep    2s
    Click Button    class:logout-button
    ${titleUj}=    Get Title
    Should Be Equal As Strings    first=${title}    second=${titleUj}
    Close Browser

Auto hozzáadás
    Open Browser    https://parking-garage-app.netlify.app/    browser=Chrome
    ${title}=    Get Title
    Click Element    //*[@id="login-link"]
    Sleep    2s
    Input Text    //*[@id="email"]    text=kukac@ku.kac
    Input Text    //*[@id="password"]    text=kukimuki
    Click Button    //*[@id="login-button"]
    Sleep    2s
    Click Element    id:cars-navbarlink
    Sleep    1s
    Click Element    class:add-button
    Sleep    1s
    Input Text    id:brand    text=Toyota
    Input Text    id:licensePlate    text=ABC-123
    Input Text    id:model    text=Corolla
    Click Element    class:submit-button
    Sleep    1s
    Close Browser

Auto hozzáadás Üres Mezőkkel
    Open Browser    https://parking-garage-app.netlify.app/    browser=Chrome
    ${title}=    Get Title
    Click Element    //*[@id="login-link"]
    Sleep    2s
    Input Text    //*[@id="email"]    text=kukac@ku.kac
    Input Text    //*[@id="password"]    text=kukimuki
    Click Button    //*[@id="login-button"]
    Sleep    2s
    Click Element    id:cars-navbarlink
    Sleep    1s
    Click Element    class:add-button
    Sleep    1s
    Input Text    id:brand    text=Toyota
    Input Text    id:model    text=Corolla
    Click Element    class:submit-button
    Page Should Contain Element    class:modal-content
    Sleep    1s
    Close Browser

Hibás rendszám formátum kezelése
    Open Browser    https://parking-garage-app.netlify.app/    browser=Chrome
    ${title}=    Get Title
    Click Element    //*[@id="login-link"]
    Sleep    2s
    Input Text    //*[@id="email"]    text=kukac@ku.kac
    Input Text    //*[@id="password"]    text=kukimuki
    Click Button    //*[@id="login-button"]
    Sleep    2s
    Click Element    id:cars-navbarlink
    Sleep    1s
    Click Element    class:add-button
    Sleep    1s
    Input Text    id:brand    text=Toyota
    Input Text    id:model    text=Corolla
    Input Text    id:licensePlate    text=Corolla
    Click Element    class:submit-button
    Page Should Contain Element    id:brand
    Sleep    1s
    Close Browser

Auto hozzáadás duplikált rendszámmal
    Open Browser    https://parking-garage-app.netlify.app/    browser=Chrome
    ${title}=    Get Title
    Click Element    //*[@id="login-link"]
    Sleep    2s
    Input Text    //*[@id="email"]    text=kukac@ku.kac
    Input Text    //*[@id="password"]    text=kukimuki
    Click Button    //*[@id="login-button"]
    Sleep    2s
    Click Element    id:cars-navbarlink
    Sleep    1s
    Click Element    class:add-button
    Sleep    1s
    Input Text    id:brand    text=Toyota
    Input Text    id:licensePlate    text=ABC-123
    Input Text    id:model    text=ABD-123
    Click Element    class:submit-button
    Sleep    1s
    Click Element    class:add-button
    Sleep    1s
    Input Text    id:brand    text=Toyota
    Input Text    id:licensePlate    text=ABC-123
    Input Text    id:model    text=ABD-123
    Click Element    class:submit-button
    Sleep    1s
    Page Should Contain Element    id:brand
    Close Browser

Módositas
    Open Browser    https://parking-garage-app.netlify.app/    browser=Chrome
    ${title}=    Get Title
    Click Element    //*[@id="login-link"]
    Sleep    2s
    Input Text    //*[@id="email"]    text=kukac@ku.kac
    Input Text    //*[@id="password"]    text=kukimuki
    Click Button    //*[@id="login-button"]
    Sleep    2s
    Click Element    id:cars-navbarlink
    Sleep    1s
    Page Should Contain Element    id:modify    message="Nem lehet modosítani!"

Törlés
    Open Browser    https://parking-garage-app.netlify.app/    browser=Chrome
    ${title}=    Get Title
    Click Element    //*[@id="login-link"]
    Sleep    2s
    Input Text    //*[@id="email"]    text=kukac@ku.kac
    Input Text    //*[@id="password"]    text=kukimuki
    Click Button    //*[@id="login-button"]
    Sleep    2s
    Click Element    id:cars-navbarlink
    Sleep    1s
    Click Element    class:delete-button
    Handle Alert    ACCEPT

Törlés megszakítás
    Open Browser    https://parking-garage-app.netlify.app/    browser=Chrome
    ${title}=    Get Title
    Click Element    //*[@id="login-link"]
    Sleep    2s
    Input Text    //*[@id="email"]    text=kukac@ku.kac
    Input Text    //*[@id="password"]    text=kukimuki
    Click Button    //*[@id="login-button"]
    Sleep    2s
    Click Element    id:cars-navbarlink
    Sleep    1s
    Click Element    class:delete-button
    Handle Alert    action=DISMISS