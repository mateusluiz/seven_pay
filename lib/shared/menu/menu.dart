import 'package:flutter/material.dart';
import 'package:seven_pay/theme/appGallery/app_gallery.dart';
import 'package:seven_pay/theme/app_theme.dart';

class Menu extends StatelessWidget {
  final String title;
  final String description;

  final List<Widget> children;

  final bool isMobile;

  const Menu({
    Key? key,
    required this.title,
    required this.description,
    required this.children,
    this.isMobile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const iconColor = Colors.white;
    final size = MediaQuery.of(context).size;

    final drawerWidth = size.width * 0.12;
    const double spacerIcon = 30;

    return Row(
      children: [
        Container(
          width: isMobile ? 0 : drawerWidth,
          color: AppTheme.darkGrey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 75,
                    child: DrawerHeader(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      padding: EdgeInsets.zero,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      child: Image.asset(
                        AppGallery.png.sevenPayLogo,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    child: const Icon(
                      Icons.menu,
                      color: iconColor,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Column(
                    children: [
                      GestureDetector(
                        child: const Icon(
                          Icons.home,
                          color: iconColor,
                        ),
                      ),
                      const SizedBox(height: spacerIcon),
                      GestureDetector(
                        child: const Icon(
                          Icons.home,
                          color: iconColor,
                        ),
                      ),
                      const SizedBox(height: spacerIcon),
                      GestureDetector(
                        child: const Icon(
                          Icons.home,
                          color: iconColor,
                        ),
                      ),
                      const SizedBox(height: spacerIcon),
                      GestureDetector(
                        child: const Icon(
                          Icons.home,
                          color: iconColor,
                        ),
                      ),
                      const SizedBox(height: spacerIcon),
                      GestureDetector(
                        child: const Icon(
                          Icons.home,
                          color: iconColor,
                        ),
                      ),
                      const SizedBox(height: spacerIcon),
                      GestureDetector(
                        child: const Icon(
                          Icons.home,
                          color: iconColor,
                        ),
                      ),
                      const SizedBox(height: spacerIcon),
                      GestureDetector(
                        child: const Icon(
                          Icons.home,
                          color: iconColor,
                        ),
                      ),
                      const SizedBox(height: spacerIcon),
                      GestureDetector(
                        child: const Icon(
                          Icons.home,
                          color: iconColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.home,
                            color: iconColor,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Get Help',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.home,
                            color: iconColor,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Configurações',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 100,
              width: isMobile ? size.width : (size.width - drawerWidth),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              description,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: AppTheme.darkGreyOpacity,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                AppGallery.png.chatBubble,
                                width: 30,
                              ),
                            ),
                            const SizedBox(width: 14),
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                AppGallery.png.chatBubble,
                                width: 30,
                              ),
                            ),
                            const SizedBox(width: 14),
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                AppGallery.png.chatBubble,
                                width: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 2,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: const Divider(
                      color: Color.fromARGB(255, 192, 192, 192),
                      thickness: 4,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                width: isMobile ? size.width : (size.width - drawerWidth),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...children,
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
