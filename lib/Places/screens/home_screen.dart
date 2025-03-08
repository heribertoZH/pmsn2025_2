import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pmsn2025_2/Places/views/item_carousel.dart';
import 'package:pmsn2025_2/Places/views/item_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<String> buttonLabels = ["Most Viewed", "Nearby", "Latest"];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> lugares = [
      {
        "id": "1",
        "nombre": "Hotel Paraíso",
        "ciudad": "Cancún",
        "pais": "México",
        "calificacion": "4.8",
        "precio": "120",
        "descripcion":"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
        "tiempo": "10",
        "temperatura": "20",
        "imgUrl" :"https://images.unsplash.com/photo-1494500764479-0c8f2919a3d8?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Zm9uZG8lMjBkZSUyMHBhbnRhbGxhJTIwZGUlMjBwYWlzYWplfGVufDB8fDB8fHww",
      },
      {
        "id": "2",
        "nombre": "Montaña Azul",
        "ciudad": "Bogotá",
        "pais": "Colombia",
        "calificacion": "4.5",
        "precio": "80",
        "descripcion":"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
        "tiempo": "14",
        "temperatura": "23",
        "imgUrl" :"https://images.unsplash.com/photo-1519681393784-d120267933ba?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Zm9uZG8lMjBkZSUyMHBhbnRhbGxhJTIwZGUlMjBwYWlzYWplfGVufDB8fDB8fHww",
      },
      {
        "id": "3",
        "nombre": "Resort del Sol",
        "ciudad": "Madrid",
        "pais": "España",
        "calificacion": "4.7",
        "precio": "150",
        "descripcion":"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.",
        "tiempo": "3",
        "temperatura": "18",
        "imgUrl" : "https://images.unsplash.com/photo-1502790671504-542ad42d5189?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9uZG8lMjBkZSUyMHBhbnRhbGxhJTIwZGUlMjBwYWlzYWplfGVufDB8fDB8fHww",
      },
    ];

    return Padding(
      padding: EdgeInsets.only(top: 34),
      child: Column(
        children: [
          ListTile(
            trailing: CircleAvatar(
              radius: 36,
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/41008/cowboy-ronald-reagan-cowboy-hat-hat-41008.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
            ),
            title: Padding(
              padding: const EdgeInsets.only(right: 5, left: 8),
              child: Row(
                spacing: 15,
                children: [
                  Text(
                    'Hi, Heriberto',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.waving_hand_sharp,
                    color: const Color.fromRGBO(255, 206, 71, 1),
                  ),
                ],
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "Explore the world",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  color: const Color.fromRGBO(136, 136, 136, 1),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 38, right: 28, left: 28, bottom: 42),
            child: ItemSearchBar(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26, right: 27),
            child: Row(
              children: [
                Text(
                  "Popular places",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  "View all",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.grey[500],
                    
                    fontSize: 16,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: CarouselSlider(
              options: CarouselOptions(
                enableInfiniteScroll: true,
                initialPage: 0,
                height: 54,
                viewportFraction: .4,
              ),
              items: List.generate(buttonLabels.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: _buildButton(
                      buttonLabels[index], index == _selectedIndex),
                );
              }),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: ItemCarousel(
              lugares: lugares,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, bool isSelected) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: isSelected
            ? Colors.black
            : Color.fromRGBO(251, 251, 251, 1), // Color dinámico
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : Colors.grey, // Color del texto dinámico
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
