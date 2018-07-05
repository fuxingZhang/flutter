import 'dart:io';
import 'dart:convert';

main() async {
  print("操作系统：${Platform.operatingSystem}");
  print("CPU核数：${Platform.numberOfProcessors}");
  print("文件URI：${Platform.script}");
  print("文件路径：${Platform.script.toFilePath()}\n");

  if(!Platform.isWindows) {
    return;
  }

  //遍历所有环境变量
  Platform.environment.forEach((k, v) {
    print(k + "=" + v);
  });

  /**
   * 这里提一下start的命名可选参数：ProcessStartMode mode，有三个枚举值
   * ProcessStartMode.NORMAL，默认值
   * 新运行的程序作为主程序的子进程，并通过数据流stdin stdout stderr连接通信
   * ProcessStartMode.DETACHED
   * 创建一个独立的进程，与主进程无数据流连接，主进程只能获得子进程的pid
   * 关闭主进程后，对其没有影响
   * ProcessStartMode.DETACHED_WITH_STDIO
   * 创建一个独立的进程，但是与主进程可以通过数据流stdin stdout stderr连接
   *
   * Process.start的特点是可以通过数据流和子进程进行交互
   */

  Process.start("ping", ['www.baidu.com']).then((Process process) {
    // 如果原文有中文等特殊字符
    // 字节列表在转换为String的时候
    // 需要对字节列表进行重新编码
    process.stdout
        .transform(SYSTEM_ENCODING.decoder)
        //print(data)用于输出一行，stdout用于输出接收到的字节串
        .listen((data) => stdout.add(UTF8.encode(data)));
  });

  /**
   * 创建一个子进程，并且父进程和子进程不能交互
   * 之后返回运行结果
   * stdout和stderr默认编码为SYSTEM_ENCODING
   * 可在Process.run的命名可选参数中设置
   */
  Process.run('ping', ['www.cndartlang.com']).then((result) {
    stdout.write(result.stdout);
    stderr.write(result.stderr);
  });
}