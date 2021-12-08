//database.dart

//  Para abrir a conexão com o banco de dados mysql

import 'package:mysql1/mysql1.dart';

class Database {

  Future<MySqlConnection> openConnection()  {

    final settings = ConnectionSettings(
      host: '127.0.0.1', //ip aonde está o banco de dados
      port: 3306,
      user: 'root',  // usuario do banco de dados do mysql
      password: 'root1234',
      db: 'dart_mysql',

    );
    return  MySqlConnection.connect(settings);

  }

}