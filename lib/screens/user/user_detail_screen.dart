import 'package:flutter/material.dart';
import 'package:restfull_api/commons/util.dart';
import 'package:restfull_api/models/entities/user.dart';
import 'package:restfull_api/services/user_services.dart';
import 'package:http/http.dart' as http;

class UserProfileDetail extends StatefulWidget {
  const UserProfileDetail({Key? key, required this.user}) : super(key: key);
  static const route = "/ProfileDetail";
  final User user;

  @override
  _UserProfileDetailState createState() => _UserProfileDetailState();
}

class _UserProfileDetailState extends State<UserProfileDetail> {
  String? _name;
  String? _displayName;

  final _formKey = GlobalKey<FormState>();

  Widget _buildNameField() {
    return TextFormField(
      initialValue: widget.user.name,
      decoration: InputDecoration(labelText: 'Name'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Name is required';
        }
      },
      onSaved: (value) {
        _name = value!;
      },
    );
  }

  Widget _buildDisplayName() {
    return TextFormField(
      initialValue: widget.user.displayName,
      decoration: InputDecoration(labelText: 'Display name'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Display name is required';
        }
      },
      onSaved: (value) {
        _displayName = value!;
      },
    );
  }

  Widget _buildAffectDate() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Affect date'),
      initialValue: Util.ConvertDateTime(widget.user.affectDate),
      enabled: false,
    );
  }

  Widget _buildExpireDate() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Expire date'),
      initialValue: Util.ConvertDateTime(widget.user.expireDate),
      enabled: false,
    );
  }

  Widget _buildUserType() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'User type'),
      initialValue: widget.user.userType,
      enabled: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text('My Profile Detail'),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: FormEditProfile(),
      ),
    );
  }

  Container FormEditProfile() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildNameField(),
            _buildDisplayName(),
            _buildAffectDate(),
            _buildExpireDate(),
            _buildUserType(),
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    bool rs = await updateUserData(
                        http.Client(), widget.user.id, widget.user);
                    if (rs) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Success')),
                      );
                      print('ok');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('errors')),
                      );
                      print('not ok');
                    }
                  }
                },
                child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
