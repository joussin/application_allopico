# flutter_application_1

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

//-------------

# Readme stef


## API client:


/Users/waripay/Documents/flutter/flutter/bin/flutter pub add http
/Users/waripay/Documents/flutter/flutter/bin/flutter pub add localstorage

https://docs.flutter.dev/cookbook/networking/fetch-data




## TODO login/register:

event on register/login/getToken
    -> get current token
    -> get logged user
    -> create User object & Token object
    -> store User & Token in LocalStorage
    -> awaitGetToken() va chercher dans le storage le user/token connecté



## Navigation:



### Pages (1/, 2/, 3/ ...) AS GUEST:

1/ HomeAsGuest:
    - button "Subscribe" : goto page 2/
    - button "login" : goto page 3/

2/ Subscribe: on create account, goto HomeAsLogged
    - create account with email/phone & password

3/ login: on login, goto HomeAsLogged
    - login with email/phone & password


### Pages (1/, 2/, 3/ ...) AS LOGGED:

    
1/ HomeAsLogged : (ListProducts - ShowCartButton - ShowProfileButton)
    
    features list products:
        - list all products
        - button : show product details
        - button : add product to cart  : (create COMMAND with status=CART)

    features command/cart:
        - button : Show cart : goto to 2/

    features user:
        - button : show profile : goto to 5/



2/ Show Cart/Command
    - list cart products & total price
    - remove product from cart
    - button : pay : goto to 3/

3/ Payment Cart/Command
    - choose payment method
    - payment form
    - payment process  : (create COMMAND with status=PAID & WAITING_DELIVERY)
    - button : show delivery : goto to 4/


4/ show delivery
    - show user_delivery infos
    - show map with user_delivery location infos


5/ show profile
    - show user infos
    - button : edit user infos : goto 6/
    - button : show user commands : goto 7/


6/ edit profile
    - form user infos

7/ user commands
    - list user commands