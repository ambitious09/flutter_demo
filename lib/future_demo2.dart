import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:flutter_demo/util/http_util.dart';

class FutureDemo2 extends StatefulWidget {
  @override
  _FutureState createState() => _FutureState();
}

class _FutureState extends State<FutureDemo2> {
  String title = 'FutureBuilder使用';
  AsyncMemoizer _memoizer = AsyncMemoizer();
  _gerData() {
    return _memoizer.runOnce(() async {
      return await HttpUtil()
          .get('http://rap2api.taobao.org/app/mock/162762/skill/dragoon');
    });
  }
  Future _refreshData() async {
    setState(() {
      _memoizer = AsyncMemoizer();
    });
  }
/*  @override
  void initState() {
    super.initState();
    _testGet();
  }
  Future _testGet() async {
    var response = await HttpUtil().get('https://www.apiopen.top/novelApi');
    print(response['data']);
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            title = title + '.';
          });
        },
        child: Icon(Icons.title),
      ),
      body: SingleChildScrollView(
//        scrollDirection: Axis.vertical,

        child:    RefreshIndicator(
          onRefresh: _refreshData,
          child: FutureBuilder(
            builder: _buildFuture,
            future: _gerData(), // 用户定义的需要异步执行的代码，类型为Future<String>或者null的变量或函数
          ),
        ),
      )

    );
  }
  ///snapshot就是_calculation在时间轴上执行过程的状态快照
  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        print('还没有开始网络请求');
        return Text('还没有开始网络请求');
      case ConnectionState.active:
        print('active');
        return Text('ConnectionState.active');
      case ConnectionState.waiting:
        print('waiting');
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        print('done');
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        return _createListView(context, snapshot);
      default:
        return Text('还没有开始网络请求');
    }
  }
  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    List movies = snapshot.data['data'];
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => _itemBuilder(context, index, movies),
      itemCount: movies.length * 2,
    );
  }
  Widget _itemBuilder(BuildContext context, int index, skills) {
    if (index.isOdd) {
      return Divider();
    }
    index = index ~/ 2;
    return ListTile(
      title: Text(skills[index]['name']),
      leading: Text(skills[index]['type']),
      trailing: Text(skills[index]['slv']),
    );
  }
}
