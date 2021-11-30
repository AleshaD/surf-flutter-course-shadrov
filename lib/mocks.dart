import 'package:places/domain/sight.dart';

final List<Sight> sightMocks = [
  Sight(
      name: 'Мангуп',
      lat: 44.592976159,
      lon: 33.801300943,
      url: "https://en.travelcrimea.com/images/00/81/008105.jpg",
      details:
          'Мангу́п (Мангу́п-Кале́; укр. Мангуп, крымскотат. Mangup, Мангуп) — средневековый город-крепость в Бахчисарайском районе Крыма. Историческое название — Дорос. Столица княжества Феодоро (Крымская Готия), затем турецкая крепость. Расположен на вершине горы-останца, возвышающейся над уровнем окрестных долин на 250 м, а над уровнем моря на 583 м и образующей плато площадью около 90 га. На территории крепости расположены два больших родника (всего их больше пятнадцати), которые впоследствии стали называть Мужским и Женским. В 1975 году на территории крепости создан одноимённый комплексный памятник природы общегосударственного значения.',
      type: 'пещерный город',
      planToVisitDate: DateTime(2021, 12, 25),),
  Sight(
      name: 'Воронежский областной краеведческий музей',
      lat: 1.0,
      lon: 1.0,
      url:
          'https://visit-voronezh.ru/assets/components/phpthumbof/cache/0bd7bd9d67a0c362eca6811d8cd1a1e1-w2048-h2048.196a527c526537c45ead89437634006a264.jpg',
      details: 'О Воронеже',
      type: 'музей',
      visitedDate: DateTime(2021, 11, 23),),
  Sight(
      name: 'Бочка смерти',
      lat: 44.49245,
      lon: 33.6194,
      url:
          'https://www.krym4you.com/files/catalog/481/gallery/big/balaklava-bochka-smerti-b_1458199677.jpg',
      details:
          'Бочка смерти является частью укрепленного бастиона, который берет свое начало во второй Русско-Турецкой войне. Изначально Бочек Смерти в Балаклаве было две, одна из них не дошла до наших дней, а вторая находится в аварийном состоянии. Назначение бочек было сугубо практического характера. Высота скалы и небольшая удаленность от скальной породы делают эти объекты отличными наблюдательными пунктами. Бочки выполнены практически как башенные установки бронепоезда того времени. Двойная броня бойницы для ведения огня и прорези для обзора. Такое исполнение этого грозного наблюдательного пункта хорошо вписывалось в общую концепцию бастиона.',
      type: 'красивый вид',
      planToVisitDate: DateTime(2021, 12, 31),),
  Sight(
      name: 'Пряности и радости',
      lat: 1.0,
      lon: 2.2,
      url: 'https://media-cdn.tripadvisor.com/media/photo-s/0f/39/96/8d/caption.jpg',
      details:
          'Пряный вкус радостной жизни вместе с шеф-поваром Изо Дзандзава, благодаря которой у гостей ресторана есть возможность выбирать из двух направлений: европейского и восточного',
      type: 'ресторан',
      visitedDate: DateTime(2021, 11, 11))
];
