import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final List<String> imageList = [
    "https://scontent.fdac31-1.fna.fbcdn.net/v/t39.30808-6/278665529_517170846473471_3568189751142776934_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=YpPLi2pO7ZoAX8JX2K5&_nc_ht=scontent.fdac31-1.fna&oh=00_AT8IxX_AxAxxdi7J4aeZH4GqS9K0bk_-Q4ujecVbw-Xbtw&oe=6318B686",
    "https://scontent.fdac31-1.fna.fbcdn.net/v/t39.30808-6/278646034_517170649806824_8844831356564450097_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=pR9Y5h_Vgp0AX_D5eeB&_nc_ht=scontent.fdac31-1.fna&oh=00_AT8et4gu1Bd2fQLcLClJcbVESn0qwYW3urIxjf5I3FdPzQ&oe=631A23E6",
    "https://scontent.fdac31-1.fna.fbcdn.net/v/t1.6435-9/181674824_306949030828988_743896234960634677_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=174925&_nc_ohc=XegWedanB9cAX-V437G&_nc_ht=scontent.fdac31-1.fna&oh=00_AT-E65DyWb7X2a-jODLXnP7YjP-1RPI_rOjIiDZk7_m8ow&oe=6339031A"
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Slider"),
        centerTitle: true,
      ),
      backgroundColor: Colors.teal,
      body: Container(
        margin: EdgeInsets.all(15),
        child: CarouselSlider.builder(
          itemCount: imageList.length,
          options: CarouselOptions(

            scrollDirection: Axis.horizontal,
            viewportFraction: .7,
            enlargeCenterPage: true,
            height: double.infinity,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            reverse: true,
            aspectRatio: 4,
          ),
          itemBuilder: (context, i, id) {
            //for onTap to redirect to another screen
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.red,
                      width: 4
                    )),
                //ClipRRect for image border radius
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    imageList[i],
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onTap: () {
                var url = imageList[i];
                print(url.toString());
              },
            );
          },
        ),
      ),
    );
  }
}
