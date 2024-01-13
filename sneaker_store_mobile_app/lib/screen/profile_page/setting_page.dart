
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});


  @override
  State<SettingPage> createState() => _SettingPage();
}

class _SettingPage extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Language Setup'.tr(),
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Container(      // Use Container then column because Column cant have BG color, 
                            // but when it's the child of Container it can have
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            option(
                context: context,
                title: 'English Language',
                subtitle: 'Hello',
                locale:
                    context.supportedLocales[0] //BuildContext extension method

                //locale: EasyLocalization.of(context)!.supportedLocales[0]
                ),
            nl(),
            option(
                context: context,
                title: 'ພາສາລາວ',
                subtitle: 'ສະບາຍດີ',
                locale: context.supportedLocales[1]),
            nl(),
            option(
                context: context,
                title: 'ภาษาไทย',
                subtitle: 'สวัสดี',
                locale: context.supportedLocales[2]),
            nl(),
            option(
                context: context,
                title: '中国人',
                subtitle: '你好',
                locale:
                    context.supportedLocales[3] //BuildContext extension method
                ),
            nl(),
          ],
        ),
      ),
    );
  }

//ef
  Container nl() => Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: const Divider(
          color: Colors.grey,
        ),
      );

// Function to Create Widget (It uses Stack memory)
  Container option({
    required BuildContext context,
    required String title,
    required String subtitle,
    required Locale locale,
  }) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
      ),
      child: ListTile(
          dense: true,
          // isThreeLine: true,
          title: Text(
            title,
  style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            subtitle,
              style: Theme.of(context).textTheme.bodyMedium,

          ),
          onTap: () {
            print(locale.toString());
            context.setLocale(locale);
            Navigator.pop(context);

          }),
    );
  }
}//ec

