import 'package:places/data/model/place.dart';
import 'package:places/data/model/sight_filter.dart';
import 'package:places/data/model/enums/sight_type.dart';

import 'data/model/coordinate.dart';

final myCoordinateMock = Coordinate(
  lat: 44.467748,
  lon: 33.691336,
);

SightFilter mockSightFilter = SightFilter.dafult();

final List<String> mockImagesPaths = List.generate(6, (index) => 'assets/images/photo_$index.jpeg');

List<Sight> mockWantToVisitSights = sightMocks.where((sight) => sight.wantToVisit).toList();
List<Sight> mockVisitedSights = sightMocks.where((sight) => sight.visited).toList();

List<Sight> sightMocks = [
  Sight(
    id: '1',
    name: 'Орли',
    lat: 44.435251,
    lng: 33.780875,
    urls: ['https://media-cdn.tripadvisor.com/media/photo-s/0b/ca/a4/ea/caption.jpg'],
    description: 'Отличный ресторан',
    placeType: SightType.cafe,
    visitedDate: DateTime(2022, 1, 20),
    wantToVisit: true,
    visited: false,
    liked: false,
  ),
  Sight(
    id: '2',
    name: 'Источник Варналы',
    lat: 44.465456,
    lng: 33.696824,
    urls: [
      'https://avatars.mds.yandex.net/get-altay/1975185/2a0000016d546336b31d92762c999c239f15/XXXL',
      'https://avatars.mds.yandex.net/i?id=22f7ccefa4deef705502e389428aaecc-5910407-images-thumbs&n=13&exp=1',
      'https://avatars.mds.yandex.net/get-altay/1975185/2a0000016d54f112c642a14ca55d9cea42b3/XXXL',
      'https://avatars.mds.yandex.net/i?id=22f7ccefa4deef705502e389428aaecc-5910407-images-thumbs&n=13&exp=1',
      'https://avatars.mds.yandex.net/i?id=9c224314735b00b961234b18fcc0dc74-5523440-images-thumbs&n=13&exp=1',
      'https://avatars.mds.yandex.net/i?id=b7a6cbf535d6e6459999b9e17ea0e221-5109160-images-thumbs&n=13&exp=1',
    ],
    description: 'Отличный ресторан',
    placeType: SightType.other,
    visitedDate: DateTime(2022, 1, 20),
    wantToVisit: true,
    visited: false,
    liked: false,
  ),
  Sight(
    id: '13',
    name: 'Балаклавский подземный музейный комплекс',
    lat: 44.500751,
    lng: 33.598167,
    urls: [
      'https://avatars.mds.yandex.net/get-altay/4537001/2a00000179f50eb18d7cc17e59180ac3a570/L',
      'https://avatars.mds.yandex.net/i?id=22f7ccefa4deef705502e389428aaecc-5910407-images-thumbs&n=13&exp=1',
    ],
    description: 'Музей базирования подводных лодок',
    placeType: SightType.museum,
    visitedDate: DateTime(2022, 1, 20),
    wantToVisit: true,
    visited: false,
    liked: false,
  ),
  Sight(
    id: '14',
    name: 'Крепость Чембало',
    lat: 44.494673,
    lng: 33.599951,
    urls: [
      'https://avatars.mds.yandex.net/get-altay/1975185/2a0000016d54f112c642a14ca55d9cea42b3/XXXL',
      'https://avatars.mds.yandex.net/i?id=22f7ccefa4deef705502e389428aaecc-5910407-images-thumbs&n=13&exp=1',
      'https://avatars.mds.yandex.net/i?id=9c224314735b00b961234b18fcc0dc74-5523440-images-thumbs&n=13&exp=1',
      'https://avatars.mds.yandex.net/i?id=b7a6cbf535d6e6459999b9e17ea0e221-5109160-images-thumbs&n=13&exp=1',
    ],
    description: 'Древняя Этрусская крепость',
    placeType: SightType.other,
    wantToVisitAtDate: DateTime(2022, 1, 20),
    wantToVisit: true,
    visited: false,
    liked: false,
  ),
  Sight(
    id: '15',
    name: 'Мемориальный комплекс Сапун-гора',
    lat: 44.554698,
    lng: 33.586735,
    urls: [
      'https://avatars.mds.yandex.net/get-altay/5236391/2a0000017b7f675abfc93a59763ed82986fa/L'
    ],
    description: 'Гора с военной техникой',
    placeType: SightType.museum,
    wantToVisitAtDate: DateTime(2022, 1, 20),
    wantToVisit: false,
    visited: true,
    liked: false,
  ),
  Sight(
    id: '16',
    name: 'Музей-заповедник Херсонес Таврический',
    lat: 44.568491,
    lng: 33.55713,
    urls: [
      'https://avatars.mds.yandex.net/get-altay/1879929/2a0000016ae2fd9a1e0f897adb972249c6ba/L'
    ],
    description: 'Хорошо сохранившиеся развалины древнего города',
    placeType: SightType.museum,
    wantToVisitAtDate: DateTime(2022, 1, 20),
    wantToVisit: false,
    visited: true,
    liked: false,
  ),
  Sight(
    id: '17',
    name: 'Винодельня 78',
    lat: 44.533711,
    lng: 33.617736,
    urls: [
      'https://avatars.mds.yandex.net/get-tycoon/1534662/2a00000179d0d1a2f830c2c70489044f03f8/priority-headline-main-narrow'
    ],
    description: 'Хорошо сохранившиеся развалины древнего города.   Мангу́п (Мангу́п-Кале́; укр. Мангуп, крымскотат. Mangup, Мангуп) — средневековый город-крепость в Бахчисарайском районе Крыма. Историческое название — Дорос. Столица княжества Феодоро (Крымская Готия), затем турецкая крепость. Расположен на вершине горы-останца, возвышающейся над уровнем окрестных долин на 250 м, а над уровнем моря на 583 м и образующей плато площадью около 90 га. На территории крепости расположены два больших родника (всего их больше пятнадцати), которые впоследствии стали называть Мужским и Женским. В 1975 году на территории крепости создан одноимённый комплексный памятник природы общегосударственного значения. Мангу́п (Мангу́п-Кале́; укр. Мангуп, крымскотат. Mangup, Мангуп) — средневековый город-крепость в Бахчисарайском районе Крыма. Историческое название — Дорос. Столица княжества Феодоро (Крымская Готия), затем турецкая крепость. Расположен на вершине горы-останца, возвышающейся над уровнем окрестных долин на 250 м, а над уровнем моря на 583 м и образующей плато площадью около 90 га. На территории крепости расположены два больших родника (всего их больше пятнадцати), которые впоследствии стали называть Мужским и Женским. В 1975 году на территории крепости создан одноимённый комплексный памятник природы общегосударственного значения.Мангу́п (Мангу́п-Кале́; укр. Мангуп, крымскотат. Mangup, Мангуп) — средневековый город-крепость в Бахчисарайском районе Крыма. Историческое название — Дорос. Столица княжества Феодоро (Крымская Готия), затем турецкая крепость. Расположен на вершине горы-останца, возвышающейся над уровнем окрестных долин на 250 м, а над уровнем моря на 583 м и образующей плато площадью около 90 га. На территории крепости расположены два больших родника (всего их больше пятнадцати), которые впоследствии стали называть Мужским и Женским. В 1975 году на территории крепости создан одноимённый комплексный памятник природы общегосударственного значения.',
    placeType: SightType.restaurant,
    wantToVisitAtDate: DateTime(2022, 1, 20),
    wantToVisit: false,
    visited: true,
    liked: false,
  ),
  Sight(
    id: '18',
    name: 'Старик Хинкалыч',
    lat: 44.552229,
    lng: 33.530981,
    urls: [
      'https://avatars.mds.yandex.net/get-altay/4660612/2a0000017a80bb8a5ebcf07cfa1841ea14d5/L'
    ],
    description: 'Хорошо сохранившиеся развалины древнего города',
    placeType: SightType.restaurant,
    wantToVisit: false,
    visited: true,
    liked: false,
  ),
  Sight(
    id: '19',
    name: 'Мангуп',
    lat: 44.592976159,
    lng: 33.801300943,
    urls: [
      "https://en.travelcrimea.com/images/00/81/008105.jpg",
      'https://avatars.mds.yandex.net/i?id=22f7ccefa4deef705502e389428aaecc-5910407-images-thumbs&n=13&exp=1',
      'https://avatars.mds.yandex.net/i?id=9c224314735b00b961234b18fcc0dc74-5523440-images-thumbs&n=13&exp=1',
    ],
    description:
        'Мангу́п (Мангу́п-Кале́; укр. Мангуп, крымскотат. Mangup, Мангуп) — средневековый город-крепость в Бахчисарайском районе Крыма. Историческое название — Дорос. Столица княжества Феодоро (Крымская Готия), затем турецкая крепость. Расположен на вершине горы-останца, возвышающейся над уровнем окрестных долин на 250 м, а над уровнем моря на 583 м и образующей плато площадью около 90 га. На территории крепости расположены два больших родника (всего их больше пятнадцати), которые впоследствии стали называть Мужским и Женским. В 1975 году на территории крепости создан одноимённый комплексный памятник природы общегосударственного значения. Мангу́п (Мангу́п-Кале́; укр. Мангуп, крымскотат. Mangup, Мангуп) — средневековый город-крепость в Бахчисарайском районе Крыма. Историческое название — Дорос. Столица княжества Феодоро (Крымская Готия), затем турецкая крепость. Расположен на вершине горы-останца, возвышающейся над уровнем окрестных долин на 250 м, а над уровнем моря на 583 м и образующей плато площадью около 90 га. На территории крепости расположены два больших родника (всего их больше пятнадцати), которые впоследствии стали называть Мужским и Женским. В 1975 году на территории крепости создан одноимённый комплексный памятник природы общегосударственного значения.Мангу́п (Мангу́п-Кале́; укр. Мангуп, крымскотат. Mangup, Мангуп) — средневековый город-крепость в Бахчисарайском районе Крыма. Историческое название — Дорос. Столица княжества Феодоро (Крымская Готия), затем турецкая крепость. Расположен на вершине горы-останца, возвышающейся над уровнем окрестных долин на 250 м, а над уровнем моря на 583 м и образующей плато площадью около 90 га. На территории крепости расположены два больших родника (всего их больше пятнадцати), которые впоследствии стали называть Мужским и Женским. В 1975 году на территории крепости создан одноимённый комплексный памятник природы общегосударственного значения.',
    placeType: SightType.other,
    wantToVisitAtDate: DateTime(2021, 12, 25),
    wantToVisit: false,
    visited: true,
    liked: true,
  ),
  Sight(
    id: '111',
    name: 'Воронежский областной краеведческий музей',
    lat: 1.0,
    lng: 1.0,
    urls: [
      'https://visit-voronezh.ru/assets/components/phpthumbof/cache/0bd7bd9d67a0c362eca6811d8cd1a1e1-w2048-h2048.196a527c526537c45ead89437634006a264.jpg'
    ],
    description: 'О Воронеже',
    placeType: SightType.museum,
    visitedDate: DateTime(2021, 11, 23),
    wantToVisit: false,
    visited: true,
    liked: false,
  ),
  Sight(
    id: '112',
    name: 'Бочка смерти',
    lat: 44.49245,
    lng: 33.6194,
    urls: [
      'https://www.krym4you.com/files/catalog/481/gallery/big/balaklava-bochka-smerti-b_1458199677.jpg'
    ],
    description:
        'Бочка смерти является частью укрепленного бастиона, который берет свое начало во второй Русско-Турецкой войне. Изначально Бочек Смерти в Балаклаве было две, одна из них не дошла до наших дней, а вторая находится в аварийном состоянии. Назначение бочек было сугубо практического характера. Высота скалы и небольшая удаленность от скальной породы делают эти объекты отличными наблюдательными пунктами. Бочки выполнены практически как башенные установки бронепоезда того времени. Двойная броня бойницы для ведения огня и прорези для обзора. Такое исполнение этого грозного наблюдательного пункта хорошо вписывалось в общую концепцию бастиона.',
    placeType: SightType.other,
    wantToVisitAtDate: DateTime(2021, 12, 31),
    wantToVisit: false,
    visited: true,
    liked: false,
  ),
  Sight(
    id: '113',
    name: 'Пряности и радости',
    lat: 1.0,
    lng: 2.2,
    urls: ['https://media-cdn.tripadvisor.com/media/photo-s/0f/39/96/8d/caption.jpg'],
    description:
        'Пряный вкус радостной жизни вместе с шеф-поваром Изо Дзандзава, благодаря которой у гостей ресторана есть возможность выбирать из двух направлений: европейского и восточного',
    placeType: SightType.restaurant,
    visitedDate: DateTime(2021, 11, 11),
    wantToVisit: false,
    visited: true,
    liked: false,
  )
];
