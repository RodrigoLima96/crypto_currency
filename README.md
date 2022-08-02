<img src="README_FILES/badges/built-with-love.svg" height="28px"/>&nbsp;&nbsp;
<img src="README_FILES/badges/flutter-dart.svg" height="28px" />&nbsp;&nbsp;
<img src="README_FILES/badges/Flutter-3.svg" height="28px" />&nbsp;&nbsp;
<img src="README_FILES/badges/dart-null_safety.svg" height="28px"/>

# crypto simulator

## Crypto simulator is a trading simulator that allows buying and selling cryptocurrencies and simulate the profit earned. The app has interactive charts and trading history.

<img src="README_FILES/tumb/tumb.png"/>

## Features
* Login / Sign Up / Google Login
* List currencies from coinbase API / refresh price
* price change chart from 1H | 24H | 7D | MONTH | YEAR | ALL
* Buy / Sell currency
* Favorite currencies
* View Wallet
* View wallet chart
* View Transactions / Trading history
* View Profile / Edit Profile
* Set Balance
* Logout

## Dependencies
<details>
     <summary> Click to expand </summary>

* [http](https://pub.dev/packages/http)
* [sqflite](https://pub.dev/packages/sqflite)
* [go_router](https://pub.dev/packages/go_router)
* [image_picker](https://pub.dev/packages/image_picker)
* [fl_chart](https://pub.dev/packages/fl_chart)
* [intl](https://pub.dev/packages/intl)
* [provider](https://pub.dev/packages/provider)
* [firebase_core](https://pub.dev/packages/firebase_core)
* [cloud_firestore](https://pub.dev/packages/cloud_firestore)
* [firebase_auth](https://pub.dev/packages/firebase_auth)
* [firebase_storage](https://pub.dev/packages/firebase_storage)
* [google_sign_in](https://pub.dev/packages/google_sign_in)

</details>

## App Demo
 <p align="center">
     login, sign-up, google-login | add-fav-cryptos, user-profile, set-balance, edit-user, logout
  </p>

  <p align="center">
 <img align="center" src="README_FILES/gifs/login.gif" height="600">
 &nbsp &nbsp &nbsp
<img align="center" src="README_FILES/gifs/profile.gif" height="600">
</p>

 <p align="center">
     refresh-price, buy-crypto, sell-crypto | change-time-chart, wallet-chart
  </p>

  <p align="center">
 <img align="center" src="README_FILES/gifs/buy-sell.gif" height="600">
 &nbsp &nbsp &nbsp
<img align="center" src="README_FILES/gifs/chart.gif" height="600">
</p>


## Directory Structure
<details>
     <summary> Click to expand </summary>

```
lib/
├── src/
│   ├── models/
│   │   ├── crypto.dart
│   │   ├── transaction.dart
│   │   ├── user.dart
│   │   └── wallet.dart
│   ├── modules/
│   │   ├── allCryptos/
|   |   |   ├── controllers
|   |   |   |   ├── account_controller.dart
|   |   |   |   ├── all_crypto_controller.dart
|   |   |   |   └── buy_crypto_page_controller.dart
|   |   |   └── pages/
|   |   |       ├── allCryptos/
|   |   |       |   ├── widgets/
|   |   |       |   |   ├── all_cryptos_appbar.dart
|   |   |       |   |   ├── all_cryptos_body.dart
|   |   |       |   |   ├── crypto_currencies_list.dart
|   |   |       |   |   └── favorite_button.dart
|   |   |       |   └── all_cryptos_page.dart
|   |   |       └── buyCrypto/
|   |   |           ├── widgets/
|   |   |           |   ├── chart/
|   |   |           |   |   ├── chart_button.dart
|   |   |           |   |   └── crypto_chart.dart
|   |   |           |   ├── buy_crypto_body.dart
|   |   |           |   ├── buy_crypto_button.dart
|   |   |           |   ├── buy_crypto_input_text.dart
|   |   |           |   ├── crypto_amount.dart
|   |   |           |   └── image_and_price.dart
|   |   |           └── buy_crypto_page.dart
|   |   ├── auth/
|   |   |   ├── controllers
|   |   |   |   └── login_controller.dart
|   |   |   └── pages/
|   |   |       └── login/
|   |   |           ├── widgets/
|   |   |           |   ├── email_field.dart
|   |   |           |   ├── google_login_button.dart
|   |   |           |   ├── login_body.dart
|   |   |           |   ├── login_button.dart
|   |   |           |   ├── login_text_button.dart
|   |   |           |   ├── login_text.dart
|   |   |           |   └── password_field.dart
|   |   |           └── login_page.dart
|   |   ├── favorites/
|   |   |   └── pages/
|   |   |       └── favorites/
|   |   |           ├── widgets/
|   |   |           |   ├── crypto_card.dart
|   |   |           |   └── favorites_body.dart
|   |   |           └── favorites_page.dart
|   |   ├── home/
|   |   |   └── pages/
|   |   |       └── home/
|   |   |           ├── widgets/
|   |   |           |   └── pages.dart
|   |   |           └── home_page.dart
│   │   ├── settings/
|   |   |   ├── controllers
|   |   |   |   └── settings_controller.dart
|   |   |   └── pages/
|   |   |       ├── editUser/
|   |   |       |   ├── widgets/
|   |   |       |   |   ├── edit_user_body.dart
|   |   |       |   |   ├── update_user_button.dart
|   |   |       |   |   ├── user_photo.dart
|   |   |       |   |   └── username.dart
|   |   |       |   └── edit_user_page.dart
|   |   |       └── settings/
|   |   |           ├── widgets/
|   |   |           |   ├── edit_user_button.dart
|   |   |           |   ├── logout_button.dart
|   |   |           |   ├── settings_body.dart
|   |   |           |   ├── update_balance_dialog.dart
|   |   |           |   ├── update_balance.dart
|   |   |           |   └── user_info.dart
|   |   |           └── settings_page.dart
│   │   ├── transactions/
|   |   |   ├── controllers
|   |   |   |   └── transactions_controller.dart
|   |   |   └── pages/
|   |   |       └── transactions/
|   |   |           ├── widgets/
|   |   |           |   ├── total_wallet_amount.dart
|   |   |           |   ├── transactions_body.dart
|   |   |           |   ├── transactions_history.dart
|   |   |           |   └── wallet_chart.dart
|   |   |           └── transactions_page.dart
|   |   └── wallet/
|   |       ├── controllers
|   |       |   └── wallet_controller.dart
|   |       └── pages/
|   |           ├── sellCrypto/
|   |           |   ├── widgets/
|   |           |   |   ├── crypto_amount.dart
|   |           |   |   ├── crypto_icon.dart
|   |           |   |   ├── sell_crypto_body.dart
|   |           |   |   ├── sell_crypto_button.dart
|   |           |   |   ├── sell_crypto_form.dart
|   |           |   |   └── total_crypto_usd.dart
|   |           |   └── sell_crypto_page.dart
|   |           └── wallet/
|   |               |   └── widgets/
|   |               |       └── crypto_wallet_card.dart
|   |               └── wallet_page.dart
│   ├── repositories/
│   │   ├── account_repository.dart
│   │   └── crypto_repository.dart
│   ├── routes/
│   │   ├── app_router.dart
│   │   └── router_utils.dart
│   ├── services/
│   │   ├── auth/
│   │   |   └── auth_service.dart
│   │   ├── crypto_info_service/
│   │   |   └── crypto_info_service.dart
│   │   ├── firestore/
│   │   |   └── firestore_service.dart
│   │   ├── sqLite/
│   │   |   └── sqlite_service.dart
│   │   └── storage/
│   │       └── storage_service.dart
|   ├── shared/
│   │   └── utils/
|   |       ├── constants.dart
|   |       ├── methods.dart
|   |       └── validator.dart
│   └── app_widget.dart
├── firebase_options.dart
└── main.dart
```

</details>