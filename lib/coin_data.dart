import 'dart:convert';
import 'package:http/http.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = 'F080546B-9A26-420B-B491-CEAD41C47F84';
const apiURL = 'https://rest.coinapi.io/v1/exchangerate';
// 'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=F080546B-9A26-420B-B491-CEAD41C47F84';
const bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CoinData {
  //3. Create the Asynchronous method getCoinData() that returns a Future (the price data).
//B3: Update getCoinData to take the selectedCurrency as an input.
  Future getCoinData(String selectedCurrency) async {
    //4. Create a url combining the coinAPIURL with the currencies we're interested, BTC to USD.
    //B4: Update the URL to use the selectedCurrency input.
    var url = Uri.parse('$bitcoinAverageURL/BTC$selectedCurrency');
    //5. Make a GET request to the URL and wait for the response.
    Response response = await get(url);

    //6. Check that the request was successful.
    if (response.statusCode == 200) {
      //7. Use the 'dart:convert' package to decode the JSON data that comes back from coinapi.io.
      var data = jsonDecode(response.body);

      //8. Get the last price of bitcoin with the key 'last'.
      double lastPrice = data['last'];
      //9. Output the lastPrice from the method.
      return lastPrice.toStringAsFixed(0);
      //10. Handle any errors that occur during the request.
    } else {
      print(response.statusCode);

      //Optional: throw an error if our request fails.

      throw 'problem with the get request';
    }
  }
}
