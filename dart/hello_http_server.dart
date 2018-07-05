import 'dart:io';
import 'dart:convert';

main() async {
  //HttpServer对象绑定127.0.0.1的80端口
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 4041);
  //输出服务器地址端口
  print("Serving at ${server.address}:${server.port}");

  //HttpServer实现了Stream<HttpRequest>接口
  await for (HttpRequest request in server) {
    request.response
      /**
       * 设置ContentType
       * text/html 浏览器在获取文本后，自动调用html的解析器进行处理
       * text/plain 浏览器在获取文本后，不会对其进行处理
       *
       * 静态函数有：HTML TEXT JSON BINARY
       * ContentType.Text 等同 new ContentType("text", "plain", charset: "utf-8")
       */
      ..headers.contentType = new ContentType("text", "html", charset: "utf-8")
      ..write('Hello, ${await handleRequest(request) ?? 'name is null'}!')
      ..write('<br/><br/>--Dart语言中文社区')
      ..close();
  }
}

//获取表单的数据
handleRequest(HttpRequest request) async {
  //判断表单提交的方法
  switch(request.method) {
    case "GET":
    //Get方法比较简单，通过解析URI就可以得到
      return request.uri.queryParameters['name'];
    case "POST":
    /**
     * Post方法稍微麻烦一点
     * 首先，request传送的数据时经过压缩的
     * index.html中设置了utf8，因此需要UTF8解码器
     *
     * 表单提交的变量和值的字符串结构为：key=value
     * 如果表单提交了多个数据，用'&'对参数进行连接
     *
     * 对于提取变量的值，可以自行对字符串进行分析
     * 不过也有取巧的办法：
     * Uri.queryParameters(String key)能解析'key=value'类型的字符串
     *
     * Uri功能很完善，协议、主机、端口、参数都能简单地获取到
     * 其中，uri参数是用'?'连接的，例如：
     * http://www.baidu.com/s?wd=dart&ie=UTF-8
     * 因此，为了Uri类能正确解析，需要在表单数据字符串前加'?'
     */
      String strRaw = await request.transform(UTF8.decoder).join("&");
      String strUri = "?" + Uri.decodeComponent(strRaw);
      return Uri.parse(strUri).queryParameters['name'];
    default:
      return null;
  }
}