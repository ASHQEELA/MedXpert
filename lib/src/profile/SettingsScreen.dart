import 'package:flutter/material.dart';
import 'package:medxpert/src/home/HomeScreen.dart';
import 'package:medxpert/src/profile/ProfileScreen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const primaryColor =
      Color(0xFF1DA1F2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF8F9FD),
      appBar: AppBar(
        backgroundColor:
            Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
            fontWeight:
                FontWeight.bold,
          ),
        ),
        iconTheme:
            const IconThemeData(
          color: Colors.black,
        ),
      ),
      body:
          SingleChildScrollView(
        padding:
            const EdgeInsets.all(
                20),
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration:
                  BoxDecoration(
                color:
                    Colors.white,
                borderRadius:
                    BorderRadius
                        .circular(
                            16),
                boxShadow: [
                  BoxShadow(
                    color: Colors
                        .black
                        .withOpacity(
                            0.04),
                    blurRadius:
                        10,
                    offset:
                        const Offset(
                            0, 4),
                  ),
                ],
              ),
              child:
                  const TextField(
                decoration:
                    InputDecoration(
                  hintText:
                      "Search settings...",
                  hintStyle:
                      TextStyle(
                    color:
                        Colors
                            .grey,
                  ),
                  border:
                      InputBorder
                          .none,
                  icon: Icon(
                    Icons.search,
                    color: Colors
                        .grey,
                  ),
                ),
              ),
            ),
            const SizedBox(
                height: 24),
            _sectionHeader(
                "General"),
            _settingsGroup([
              _modernSettingsTile(
                icon: Icons
                    .palette_outlined,
                iconColor:
                    Colors.purple,
                title:
                    "Appearance",
                subtitle:
                    "Theme, Display",
                onTap: () {},
              ),
              _modernSettingsTile(
                icon: Icons
                    .notifications_outlined,
                iconColor:
                    Colors.orange,
                title:
                    "Notifications",
                subtitle:
                    "Ringtones, Vibrations",
                onTap: () {},
              ),
              _switchTile(
                icon: Icons
                    .dark_mode_outlined,
                iconColor:
                    Colors.indigo,
                title:
                    "Dark Mode",
                value: false,
              ),
            ]),
            _sectionHeader(
                "Account & Security"),
            _settingsGroup([
              _modernSettingsTile(
                icon: Icons
                    .lock_outline,
                iconColor:
                    Colors.blue,
                title:
                    "Security & Login",
                subtitle:
                    "2FA, Password",
                onTap: () {},
              ),
              _modernSettingsTile(
                icon: Icons
                    .attach_money,
                iconColor:
                    Colors.green,
                title:
                    "Payment Methods",
                subtitle:
                    "Visa **42",
                onTap: () {},
              ),
              _modernSettingsTile(
                icon:
                    Icons.history,
                iconColor:
                    Colors.teal,
                title:
                    "Activity Log",
                onTap: () {},
              ),
            ]),
          ],
        ),
      ),
      bottomNavigationBar:
          Container(
        decoration:
            BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(
                      0.05),
              blurRadius: 20,
              offset:
                  const Offset(
                      0, -5),
            ),
          ],
        ),
        child:
            BottomNavigationBar(
          backgroundColor:
              Colors.white,
          elevation: 0,
          currentIndex: 2,
          selectedItemColor:
              primaryColor,
          unselectedItemColor:
              Colors
                  .grey.shade400,
          showUnselectedLabels:
              false,
          type:
              BottomNavigationBarType
                  .fixed,
          onTap: (index) {
            if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const HomeScreen(),
                ),
              );
            } else if (index ==
                3) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const ProfileScreen(),
                ),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons
                  .description_outlined),
              activeIcon: Icon(
                  Icons
                      .description),
              label:
                  "Records",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons
                  .home_outlined),
              activeIcon:
                  Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons
                  .settings_outlined),
              activeIcon: Icon(
                  Icons.settings),
              label:
                  "Settings",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons
                  .person_outline),
              activeIcon: Icon(
                  Icons.person),
              label:
                  "Profile",
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(
    String title,
  ) {
    return Padding(
      padding:
          const EdgeInsets.only(
        bottom: 12,
        left: 4,
      ),
      child: Align(
        alignment:
            Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            color: Colors
                .grey.shade600,
            fontWeight:
                FontWeight.bold,
            fontSize: 14,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  Widget _settingsGroup(
    List<Widget> children,
  ) {
    return Container(
      margin:
          const EdgeInsets.only(
              bottom: 24),
      decoration:
          BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius
                .circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey
                .withOpacity(
                    0.05),
            blurRadius: 10,
            offset:
                const Offset(
                    0, 4),
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _modernSettingsTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    String? subtitle,
    required VoidCallback
        onTap,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          leading: Container(
            padding:
                const EdgeInsets
                    .all(10),
            decoration:
                BoxDecoration(
              color: iconColor
                  .withOpacity(
                      0.1),
              borderRadius:
                  BorderRadius
                      .circular(
                          12),
            ),
            child: Icon(
              icon,
              color:
                  iconColor,
              size: 22,
            ),
          ),
          title: Text(
            title,
            style:
                const TextStyle(
              fontWeight:
                  FontWeight
                      .w600,
              fontSize: 16,
            ),
          ),
          subtitle:
              subtitle != null
                  ? Text(
                      subtitle,
                      style:
                          TextStyle(
                        color: Colors
                            .grey
                            .shade500,
                        fontSize:
                            12,
                      ),
                    )
                  : null,
          trailing: Icon(
            Icons
                .arrow_forward_ios_rounded,
            size: 16,
            color: Colors
                .grey.shade300,
          ),
          onTap: onTap,
        ),
        Divider(
          height: 1,
          color: Colors
              .grey.shade100,
          indent: 70,
          endIndent: 16,
        ),
      ],
    );
  }

  Widget _switchTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required bool value,
  }) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      leading: Container(
        padding:
            const EdgeInsets
                .all(10),
        decoration:
            BoxDecoration(
          color: iconColor
              .withOpacity(0.1),
          borderRadius:
              BorderRadius
                  .circular(12),
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 22,
        ),
      ),
      title: Text(
        title,
        style:
            const TextStyle(
          fontWeight:
              FontWeight.w600,
          fontSize: 16,
        ),
      ),
      trailing: Switch(
        value: value,
        activeColor:
            primaryColor,
        onChanged: (val) {},
      ),
    );
  }
}
