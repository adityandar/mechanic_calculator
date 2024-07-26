class ContributionList {
  const ContributionList._();

  static const data = [
    ContributionMdl(
      name: 'Chris Hartley',
      description: 'UI Design Inspiration',
    ),
    ContributionMdl(
      name: 'Anggah',
      description: 'BRIDGE88',
    ),
    ContributionMdl(
      name: 'Julizarisya01',
      description: 'BRIDGE88',
    ),
    ContributionMdl(
      name: 'Fauzan7',
      description: 'First Youtube Live Viewer',
    ),
    ContributionMdl(
      name: 'MANFRED LAVIOSIER',
      description: 'First Youtube Live Viewer',
    ),
    ContributionMdl(
      name: 'Fawaz8581',
      description: 'First Youtube Live Viewer',
    ),
    ContributionMdl(
      name: 'Akimitsu Benjiro',
      description: 'First Youtube Live Viewer',
    ),
    ContributionMdl(
      name: 'yumsha',
      description: 'First Youtube Live Viewer',
    ),
    ContributionMdl(
      name: 'razemc',
      description: 'First Youtube Live Viewer',
    ),
    ContributionMdl(
      name: 'Firds Meldova',
      description: 'First Youtube Live Viewer',
    ),
  ];
}

class ContributionMdl {
  final String name;
  final String description;

  const ContributionMdl({this.name = '', this.description = ''});
}
