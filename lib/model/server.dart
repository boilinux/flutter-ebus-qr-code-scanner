class Server {
  // String url = 'https://ctuonlineclass.stephenwenceslao.com';
  // String url = 'http://192.168.254.195';
  // String url = 'http://192.168.1.195';
  // String url = 'http://192.168.110.195'; // cote router
  // String url = 'http://192.168.1.195'; // localhost router
  String url = 'http://127.0.0.1'; // localhost router
}

class ApiPath {
  String absolutePath = Server().url;

  String get attendance {
    return '$absolutePath/api/v1/attendance/log';
  }
}
