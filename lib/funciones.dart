
import 'package:http/http.dart' as http;

//http://10.0.3.2  ip emulador genymotion

 void addData(controllerStock,controllerPrice,controllerName,controllerCode) {
  var url ="http://10.0.3.2/flutter_mysql/adddata.php";
  http.post(url,body: {
    'itemcode':controllerCode.text,
    'itemname':controllerName.text,
    'price':controllerPrice.text,
    'stock':controllerStock.text
  });
}

void UpdateData(id,controllerStock,controllerPrice,controllerName,controllerCode) {
  var url ="http://10.0.3.2/flutter_mysql/editdata.php";
  http.post(url,body: {
    'id':id,
    'itemcode':controllerCode.text,
    'itemname':controllerName.text,
    'price':controllerPrice.text,
    'stock':controllerStock.text
  });
}

void deleteData(id) {
  var url ="http://10.0.3.2/flutter_mysql/deletedata.php";
  http.post(url,body: {
    'id':id
  });
}