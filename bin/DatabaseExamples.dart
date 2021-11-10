// import 'dart:io';
// import 'package:sqljocky5/connection/connection.dart';
// import 'package:sqljocky5/sqljocky.dart';

main(List<String> arguments) async {

  /**
   * Section 6 - Database
   *
   */

  // var pool = new ConnectionPool(
  //     host: 'localhost',
  //     port: 3306,
  //     user: 'bryan',
  //     password: 'password',
  //     db: 'school',
  //     max: 5
  // );
  //
  // var query = await pool.prepare('insert into students (name) values (?)');
  // await insert(query, 'Harry');
  // await insert(query, 'Harriet');
  // await insert(query, 'Garriet');
  //
  // pool.closeConnectionsNow();
  // exit(0);

  //--------------------------------------------------------------------------

  /**
   * Assignment 6
   */

  //--------------------------------------------------------------------------

  /**
   * Section 6.28  - Selecting rows
   */

  // var pool = new ConnectionSettings(
  //   host: 'localhost',
  //   port: 3306,
  //   user: 'bryan',
  //   password: 'password',
  //   db: 'school'
  // );
  // var conn = await MySqlConnection.connect(pool);

  //--------------------------------------------------------------------------

  /**
   * Section 6.29 - Queries
   */
  //
  // var query = await conn.prepare('insert into teachers {name, topic} values {?,?}');
  // await insert(query, 'Bob', 'Science');
  // await insert(query, 'Mary', 'Shop');
  //
  // conn.close();
  // exit(0);

  //--------------------------------------------------------------------------

  /**
   * Section 6.30 - Names and indexes
   */

  // var results = await conn.execute('select Name, Topic from teachers');
  // await results.forEach((row) {
  //   print('Name: ${row[0]}, Topic: ${row[1]}');
  //   // can use index or name i.e row.Topic or row[1]
  // });
  //
  // conn.close();
  // exit(0);

  //--------------------------------------------------------------------------

  /**
   * Section 6.31 - Transactions
   */

  /*var trans = await conn.begin();
  try {
    int id = await insert(conn, 'Zazzy', "Dart");
    int person = await find(conn, 'Bryan');
    await delete(conn, person);
    await trans.commit();
    print('done');
  } catch (err) {
    print(err.toString());
    await trans.rollback();
  } finally {
    await conn.close();
    exit(0);
  }*/

}

// Future<int> find(var pool, String name) async {
//   var query = await pool.prepare('select idteachers from teachers where Name=?');
//   Results results = await query.execute(query);
//   Row row = await results.first;
//   return row[0];
// }
//
// Future<int> insert(var pool, String name, String topic) async {
//   var query = await pool.prepare('insert into teachers (name, topic) values (?,?)');
//   Results results = await query.execute([name,topic]);
//   return results.insertId;
// }
//
// Future delete(var pool, int value) async {
//   var query = await pool.prepare('delete from teachers where idteachers=?');
//   Results results = await query.execute([value]);
// }

// void insert(var query, String name, String topic) async {
//   var result = await query.execute([name, topic]);
//   print('New user = ${result.insertId}');
// }
