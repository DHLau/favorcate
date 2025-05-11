import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/core/services/json_parse.dart';
import 'package:favorcate/ui/pages/home/home_category_item_view.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<CategoryModel> _categoryModelList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 加载数据
    JsonParse.getCategoriseData().then((res) {
      setState(() {
        _categoryModelList = res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: _categoryModelList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final model = _categoryModelList[index];
        return HomeCategroyItemView(model);
      },
    );
  }
}




// class HomeContent extends StatelessWidget {
//   const HomeContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // 会根据数据状态自动刷新
//     return FutureBuilder<List<CategoryModel>>(
//       future: JsonParse.getCategoriseData(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Center(child: CircularProgressIndicator());
//         }
//         if (snapshot.hasError) {
//           return Center(child: Text("数据加载失败"));
//         }
//         final categoryModel = snapshot.data;
//         return GridView.builder(
//           padding: EdgeInsets.all(10),
//           itemCount: categoryModel?.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 1.5,
//             mainAxisSpacing: 10,
//             crossAxisSpacing: 10,
//           ),
//           itemBuilder: (context, index) {
//             final model = snapshot.data?[index];
//             if (model != null) {
//               return HomeCategroyItemView(model);
//             } else {
//               return Container();
//             }
//           },
//         );
//       },
//     );
//   }
// }