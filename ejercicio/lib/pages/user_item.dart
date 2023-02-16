import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import '../model/user_model.dart';

class UserItem extends StatelessWidget {
  final UserModel? model;
  final Function? onDelete;
  String maleImageUrl =
      "https://cdn-icons-png.flaticon.com/512/2922/2922716.png";
  String femaleImageUrl =
      "https://cdn-icons-png.flaticon.com/512/2922/2922558.png";
  String isActive = "active";

  UserItem({
    Key? key,
    this.model,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: cartItem(context),
      ),
    );
  }

  Widget cartItem(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 120,
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          child: model!.Genero == 'male'
              ? Image.network(maleImageUrl)
              : Image.network(femaleImageUrl),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model!.nombre!,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                model!.email!,
                style: const TextStyle(color: Colors.blue),
              ),
              const SizedBox(
                height: 10,
              ),
              CircleAvatar(
                backgroundColor:
                    model!.status == 'active' ? Colors.green : Colors.red,
              ),
              // Text(
              //   model!.edad.toString(),
              //   style: const TextStyle(color: Colors.red),
              // ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: const Icon(Icons.edit),
                      onTap: null,
                      /*onTap: () {
                        Navigator.of(context).pushNamed(
                          '/edit-user',
                          arguments: {
                            'model': model,
                          },
                        );
                      },*/
                    ),
                    GestureDetector(
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onTap: null,
                      /*onTap: () {
                        onDelete!(model);
                      },*/
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
