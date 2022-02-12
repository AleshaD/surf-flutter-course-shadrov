import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_filter.dart';
import 'package:places/domain/sight_type.dart';

import 'domain/coordinate.dart';

final myCoordinateMock = Coordinate(
  lat: 44.467748,
  lon: 33.691336,
);

SightFilter mockSightFilter = SightFilter.dafult();

final List<String> mockImagesPaths =
    List.generate(6, (index) => 'assets/images/photo_$index.jpeg');

List<Sight> sightMocks = [
  Sight(
    name: 'Орли',
    lat: 44.435251,
    lon: 33.780875,
    url: 'https://media-cdn.tripadvisor.com/media/photo-s/0b/ca/a4/ea/caption.jpg',
    details: 'Отличный ресторан',
    type: SightType.cafe,
    visitedDate: DateTime(2022, 1, 20),
    wantToVisit: true,
    visited: false,
    liked: false,
  ),
  Sight(
    name: 'Источник Варналы',
    lat: 44.465456,
    lon: 33.696824,
    url:
        'https://avatars.mds.yandex.net/get-altay/1975185/2a0000016d546336b31d92762c999c239f15/XXXL',
    details: 'Отличный ресторан',
    type: SightType.specialPlace,
    visitedDate: DateTime(2022, 1, 20),
    wantToVisit: true,
    visited: false,
    liked: false,
  ),
  Sight(
    name: 'Балаклавский подземный музейный комплекс',
    lat: 44.500751,
    lon: 33.598167,
    url: 'https://avatars.mds.yandex.net/get-altay/4537001/2a00000179f50eb18d7cc17e59180ac3a570/L',
    details: 'Музей базирования подводных лодок',
    type: SightType.museum,
    visitedDate: DateTime(2022, 1, 20),
    wantToVisit: true,
    visited: false,
    liked: false,
  ),
  Sight(
    name: 'Крепость Чембало',
    lat: 44.494673,
    lon: 33.599951,
    url:
        'https://avatars.mds.yandex.net/get-altay/1975185/2a0000016d54f112c642a14ca55d9cea42b3/XXXL',
    details: 'Древняя Этрусская крепость',
    type: SightType.specialPlace,
    wantToVisitAtDate: DateTime(2022, 1, 20),
    wantToVisit: true,
    visited: false,
    liked: false,
  ),
  Sight(
    name: 'Мемориальный комплекс Сапун-гора',
    lat: 44.554698,
    lon: 33.586735,
    url: 'https://avatars.mds.yandex.net/get-altay/5236391/2a0000017b7f675abfc93a59763ed82986fa/L',
    details: 'Гора с военной техникой',
    type: SightType.museum,
    wantToVisitAtDate: DateTime(2022, 1, 20),
    wantToVisit: false,
    visited: true,
    liked: false,
  ),
  Sight(
    name: 'Музей-заповедник Херсонес Таврический',
    lat: 44.568491,
    lon: 33.55713,
    url: 'https://avatars.mds.yandex.net/get-altay/1879929/2a0000016ae2fd9a1e0f897adb972249c6ba/L',
    details: 'Хорошо сохранившиеся развалины древнего города',
    type: SightType.museum,
    wantToVisitAtDate: DateTime(2022, 1, 20),
    wantToVisit: false,
    visited: true,
    liked: false,
  ),
  Sight(
    name: 'Винодельня 78',
    lat: 44.533711,
    lon: 33.617736,
    url:
        'https://avatars.mds.yandex.net/get-tycoon/1534662/2a00000179d0d1a2f830c2c70489044f03f8/priority-headline-main-narrow',
    details: 'Хорошо сохранившиеся развалины древнего города',
    type: SightType.restaurant,
    wantToVisitAtDate: DateTime(2022, 1, 20),
    wantToVisit: false,
    visited: true,
    liked: false,
  ),
  Sight(
    name: 'Старик Хинкалыч',
    lat: 44.552229,
    lon: 33.530981,
    url: 'https://avatars.mds.yandex.net/get-altay/4660612/2a0000017a80bb8a5ebcf07cfa1841ea14d5/L',
    details: 'Хорошо сохранившиеся развалины древнего города',
    type: SightType.restaurant,
    wantToVisit: false,
    visited: true,
    liked: false,
  ),
  Sight(
    name: 'Мангуп',
    lat: 44.592976159,
    lon: 33.801300943,
    url: "https://en.travelcrimea.com/images/00/81/008105.jpg",
    details:
        'Мангу́п (Мангу́п-Кале́; укр. Мангуп, крымскотат. Mangup, Мангуп) — средневековый город-крепость в Бахчисарайском районе Крыма. Историческое название — Дорос. Столица княжества Феодоро (Крымская Готия), затем турецкая крепость. Расположен на вершине горы-останца, возвышающейся над уровнем окрестных долин на 250 м, а над уровнем моря на 583 м и образующей плато площадью около 90 га. На территории крепости расположены два больших родника (всего их больше пятнадцати), которые впоследствии стали называть Мужским и Женским. В 1975 году на территории крепости создан одноимённый комплексный памятник природы общегосударственного значения.',
    type: SightType.specialPlace,
    wantToVisitAtDate: DateTime(2021, 12, 25),
    wantToVisit: false,
    visited: true,
    liked: false,
  ),
  Sight(
    name: 'Воронежский областной краеведческий музей',
    lat: 1.0,
    lon: 1.0,
    url:
        'https://visit-voronezh.ru/assets/components/phpthumbof/cache/0bd7bd9d67a0c362eca6811d8cd1a1e1-w2048-h2048.196a527c526537c45ead89437634006a264.jpg',
    details: 'О Воронеже',
    type: SightType.museum,
    visitedDate: DateTime(2021, 11, 23),
    wantToVisit: false,
    visited: true,
    liked: false,
  ),
  Sight(
    name: 'Бочка смерти',
    lat: 44.49245,
    lon: 33.6194,
    url:
        'https://www.krym4you.com/files/catalog/481/gallery/big/balaklava-bochka-smerti-b_1458199677.jpg',
    details:
        'Бочка смерти является частью укрепленного бастиона, который берет свое начало во второй Русско-Турецкой войне. Изначально Бочек Смерти в Балаклаве было две, одна из них не дошла до наших дней, а вторая находится в аварийном состоянии. Назначение бочек было сугубо практического характера. Высота скалы и небольшая удаленность от скальной породы делают эти объекты отличными наблюдательными пунктами. Бочки выполнены практически как башенные установки бронепоезда того времени. Двойная броня бойницы для ведения огня и прорези для обзора. Такое исполнение этого грозного наблюдательного пункта хорошо вписывалось в общую концепцию бастиона.',
    type: SightType.specialPlace,
    wantToVisitAtDate: DateTime(2021, 12, 31),
    wantToVisit: false,
    visited: true,
    liked: false,
  ),
  Sight(
    name: 'Пряности и радости',
    lat: 1.0,
    lon: 2.2,
    url: 'https://media-cdn.tripadvisor.com/media/photo-s/0f/39/96/8d/caption.jpg',
    details:
        'Пряный вкус радостной жизни вместе с шеф-поваром Изо Дзандзава, благодаря которой у гостей ресторана есть возможность выбирать из двух направлений: европейского и восточного',
    type: SightType.restaurant,
    visitedDate: DateTime(2021, 11, 11),
    wantToVisit: false,
    visited: true,
    liked: false,
  )
];
