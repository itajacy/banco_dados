// MÓDULO 8 - BANCO DE DADOS

// Em um banco de dados as 4 operações possíveis são:
// selecionar, inserir, alterar e deletar dados

import 'package:dart_banco_dados/database.dart';

Future<void> main(List<String> args) async {
  final database = Database();
  var mysqlConnection = await database.openConnection();

  print(mysqlConnection.toString());

  // o .query() solicita a query a ser executada, e a lista de parâmetros
  // caso tenha
  // INSERT
  var resultado = await mysqlConnection.query(
    'insert into aluno(id, nome) values(?,?)',
    [
      null,
      'Rodrigo Rahman ',
    ],
  );

  print(resultado.affectedRows);

  // SELECT
  // var resultadoSelect = await mysqlConnection.query('select * from aluno');
  // resultadoSelect.forEach((row) {
  //   print('Resultado por indice');
  //   print(row[0]);
  //   print(row[1]);

  //   print('Resultado pelo nome da coluna[índice]');
  //   print(row['id']);
  //   print(row['nome']);
  // });

  // var resultadoSelectUnico =
  //     await mysqlConnection.query('select * from aluno where id = ?', [1]);

  // print('Parâmetro único');
  // if (resultadoSelectUnico.isNotEmpty) {
  //   var rowUnico = resultadoSelectUnico.first;

  //   print('Resultado por indice Parametro Unico');
  //   print(rowUnico[0]);
  //   print(rowUnico[1]);

  //   print('Resultado pelo nome da coluna[índice] Parametro Unico');
  //   print(rowUnico['id']);
  //   print(rowUnico['nome']);
  // }

  // UPDATE

  // try {
  //   await mysqlConnection
  //       .query('update aluno set nome = ? where id = ?', ['Academia', 1]);
  // } on MySqlException catch (erro) {
  //   print(erro);
  //   print('Erro ao atualizar os dados do Aluno');
  // }

  // // TRANSACTION

  // await mysqlConnection.transaction((conn) {});
}
