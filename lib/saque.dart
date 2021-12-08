import 'dart:async';

import 'package:dart_banco_dados/database.dart';

Future<void> main(List<String> args) async {
  var database = Database();
  var conn = await database.openConnection();

  // TRANSACTION
  //  se tudo estiver ok e tudo der certo no final ao sair do
  // transaction será executado um commit no banco de dados
  await conn.transaction((_) async {
    print(_); // retorna um transactioncontext

    var result = await conn.query('select * from conta_corrente');
    var saldo = result.first['saldo'] as double;
    var saque = 100.0;

    var saldoFinal = saldo - saque;
    if (saldoFinal < 0) {
      print('SALDO INSUFICIENTE');
      throw Exception();
    }

    await conn.query(
        'update conta_corrente set saldo = ? where id = ?', [saldo - saque, 1]);

    await conn.query('insert into tira_dinheiro(id, data_saque) values(?,?)', [
      null,
      DateTime.now().toIso8601String(),
    ]);

    // lançando a exception abaixo dentro do transaction não será
    // executado o commit
    // throw Exception();
  });

//

  var result = await conn.query('select * from conta_corrente');

  print('Meu saldo é.. ${result.first['saldo']}');
}
