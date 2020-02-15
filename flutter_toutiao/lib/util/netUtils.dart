import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
class NetUtils {
  // get请求的封装，传入的两个参数分别是请求URL和请求参数，请求参数以map的形式传入，会在方法体中自动拼接到URL后面
  static Future<String> get(String url, {Map<String, dynamic> params}) async {
    if (params != null && params.isNotEmpty) {
      // 如果参数不为空，则将参数拼接到URL后面
      StringBuffer sb = StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    print(url);
    http.Response res = await http.get(url, headers: getCommonHeader());
    return Utf8Codec().decode(res.bodyBytes);
  }

  // post请求
  static Future<String> post(String url, {Map<String, dynamic> params}) async {
    http.Response res = await http.post(url, body: params, headers: getCommonHeader());
    return Utf8Codec().decode(res.bodyBytes);
  }

  static Map<String, String> getCommonHeader() {
    String cookieStr = 'tt_webid=6761645670589433357; csrftoken=caeb916a1dd4f9db044e36b71a438b41; W2atIF=1; _ga=GA1.2.1480208149.1574402501; _gid=GA1.2.1727498317.1574402501; __tasessionId=039coqav31574402504340';
    Map<String, String> header = Map();
//    header['content-type'] = "application/json";
    header['Cookie']=cookieStr;
    return header;
  }

  static Ajax(param) async{
    var config = {
      'url': param['url'],
      'data':param['data'],
      'type':param['type']!=null?param['type']:'post',
      'success':param['success'],
      'error':param['error']
    };
    if(config['url']==null){
      print('-------------请输入url------------');
      return;
    };
    if(config['type'] == 'get'){
      config['success'](json.decode(await get(config['url'],params: new Map<String, dynamic>.from(config['data']))));
    }else{
      config['success'](json.decode(await post(config['url'],params:new Map<String, dynamic>.from(config['data']))));
    };
  }
}
