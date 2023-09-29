part of features.rickandmorty.presentation.views;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: size16),
      child: FadeInDown(
        child: Column(
          children: <Widget>[
            const FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: AssetImage('assets/logo.jpg'),
            ),
            gapy16,
            Padding(
              padding: px16,
              child: Text(
                'Cillum eiusmod excepteur aliqua deserunt labore dolore ex in ullamco irure fugiat. Eiusmod labore adipisicing culpa culpa enim officia nulla ipsum ipsum ipsum. Ea veniam proident duis aliquip laborum exercitation et voluptate do ex ullamco duis. Labore ex consequat occaecat do esse exercitation eu cillum ipsum consequat in adipisicing enim sint.',
                textAlign: TextAlign.center,
                style: textStyle.bodyMedium,
              ),
            ),
            gapy8,
            Padding(
              padding: px16,
              child: Text(
                'Cillum eiusmod excepteur aliqua deserunt labore dolore ex in ullamco irure fugiat. Eiusmod labore adipisicing culpa culpa enim officia nulla ipsum ipsum ipsum. Ea veniam proident duis aliquip laborum exercitation et voluptate do ex ullamco duis. Labore ex consequat occaecat do esse exercitation eu cillum ipsum consequat in adipisicing enim sint.',
                textAlign: TextAlign.center,
                style: textStyle.bodyMedium,
              ),
            ),
            gapy16,
            CardOfView(
              srcImage: 'assets/rick-morty.png',
              title: 'Character',
              textStyle: textStyle,
            ),
            CardOfView(
              srcImage: 'assets/tv.png',
              title: 'Episodes',
              textStyle: textStyle,
            ),
            CardOfView(
              icon: Icons.location_on_outlined,
              isIcon: true,
              title: 'Locations',
              textStyle: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class CardOfView extends StatelessWidget {
  const CardOfView({
    super.key,
    required this.title,
    required this.textStyle,
    this.isIcon = false,
    this.icon,
    this.srcImage,
  });

  final String? srcImage;
  final String title;
  final TextTheme textStyle;
  final bool isIcon;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: p16,
      child: DecoratedBox(
          decoration: BoxDecoration(
            color: colorGreyLight,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: colorGray.withOpacity(0.3),
                blurRadius: size4,
                spreadRadius: 0,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Padding(
            padding: p12,
            child: Opacity(
              opacity: 0.5,
              child: Row(
                children: <Widget>[
                  isIcon
                      ? Icon(icon, size: size.width * 0.25)
                      : Image.asset(
                          srcImage!,
                          width: size.width * 0.25,
                        ),
                  gapx16,
                  Text(title, style: textStyle.titleMedium)
                ],
              ),
            ),
          )),
    );
  }
}
