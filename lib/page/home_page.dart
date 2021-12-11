import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:intereiws/model/model.dart';
import 'package:intereiws/servises/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DioClient _client = DioClient();

  ImageData? userimage;
  List<String> userdata = [];
  @override
  void initState() {
    getuserInfo();
    super.initState();
  }

  void getuserInfo() async {
    userimage = await _client.getUser();
    userdata.add(userimage!.toJson());
    print("userimage $userimage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wellpapers Online",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
          size: 20,
        ),
        elevation: 18.0,
      ),
      body: userimage != null
          ? ListView.builder(
              itemCount: userdata.length,
              itemBuilder: (context, index) {
                return Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      userdata[index].toString(),
                      fit: BoxFit.fill,
                    );
                  },
                  autoplay: true,
                  itemCount: userdata.length,
                  pagination: const SwiperPagination(),
                  control: const SwiperControl(),
                );
              })
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
