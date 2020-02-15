import './netUtils.dart';
class Ajax {
  static getNewList(data,success){
    NetUtils.Ajax({
//      'url':'https://xw.qq.com/service/api/getData',
//      'url':'http://172.16.6.105:7001/crawler/tj/newslist',
      'url':'https://m.toutiao.com/list/',
      'type':'get',
      'data':data,
      'success':success
    });
  }
}
