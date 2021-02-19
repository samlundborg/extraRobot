
*** Keywords ***
Begin Web Test
    Open browser                about:blank  ${BROWSER}
    Maximize Browser Window

Go to Web Page
    Load Page
    Verify Page Loaded

Load Page
    Go to                       ${URL}

Verify Page Loaded
    ${link_text}                Get Title
    Should Be Equal             ${link_text}    Handla billig mat online | Willys

Search for Product
    [Arguments]                 ${search_term}
    Enter Search Term           ${search_term}
    Submit Search
    Verify Search Completed     ${search_term}
    Add to cart
    Verify Item in Cart
    Verify in Cart

Click on erbjudande
    Click Link                xpath://*[@id="selenium--header-nav-link-erbjudanden"]

Verify New Site
    ${title_text}               Get Text        xpath://h1[class="Heading_h1__2S2dK Heading_black__cxcLS HorizontalBannerComponent_horizontal-banner-title__1yWUk HorizontalBannerComponent_horizontal-banner-title-fixed__3lZG7"]
    Should Be Equal             "${title_text}"       "Erbjudanden"

Enter Search Term
    [Arguments]                 ${search_term}
    Input text                  id:selenium--search-items-input     ${search_term}

Submit Search
    Click Button                Xpath://*[@id="__next"]/div/div[2]/div[1]/form/button

Verify Search Completed
    [Arguments]                 ${search_term}
    Wait Until Page Contains Element        Xpath://h1[@id="selenium--product-grid-header"]         timeout=20
    ${actual_term}              Get Text    Xpath://h1[@id="selenium--product-grid-header"]
    Should Be Equal             "Sökord: ${search_term}"    "${actual_term}"

Add to cart
    Click Button                xpath://*[@id="main-content"]/div[4]/div[3]/div/ax-product-grid/div/div[1]/ax-product-puff[3]/div/div[2]/div[2]/div/div/button[2]

Verify Item in Cart
    Wait Until Page Contains Element        Xpath://span[@id="selenium--cart-badge-total-unit-count"]
    ${items_in_cart}            Get Text    Xpath://span[@id="selenium--cart-badge-total-unit-count"]
    Should Be Equal             "1"         "${items_in_cart}"

Verify in Cart
    Go to                       https://willys.se/varukorg
    ${title_text}               Get Text        xpath://*[@id="selenium--cart"]/div/div[1]/div[1]/div/h1
    Should Be Equal             ${title_text}   Varukorg
    ${item_name}                Get Text        xpath://*[@id="selenium--cart"]/div/div[1]/div[7]/ax-product-list/md-list/md-list-item/div/div[2]/h3
    Should Be Equal             ${item_name}    Hallon Frysta

End Web Test
    Close browser

