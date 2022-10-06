import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';

import '../insult.dart';

class NIHSSScreen extends StatefulWidget {
  const NIHSSScreen({Key? key}) : super(key: key);

  @override
  State<NIHSSScreen> createState() => _NIHSSScreenState();
}

class _NIHSSScreenState extends State<NIHSSScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NIHSSLogic(),
    );
  }
}

class NIHSSLogic extends StatefulWidget {
  const NIHSSLogic({Key? key}) : super(key: key);

  @override
  State<NIHSSLogic> createState() => _NIHSSLogicState();
}

class _NIHSSLogicState extends State<NIHSSLogic> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        runApp(const InsultScreen());
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              runApp(const InsultScreen());
            },
          ),
          title: appBarText('NIHSS'),
          centerTitle: true,
        ),
        body: const Nihss(),
      ),
    );
  }
}

class Nihss extends StatefulWidget {
  const Nihss({Key? key}) : super(key: key);

  @override
  State<Nihss> createState() => _NihssState();
}

class _NihssState extends State<Nihss> {
  int bodr1a = 0;
  int bodr1b = 0;
  int bodr1v = 0;
  int eye = 0;
  int visionField = 0;
  int faceNeuro = 0;
  int armRight = 0;
  int armLeft = 0;
  int legRight = 0;
  int legLeft = 0;
  int ataks = 0;
  int sense = 0;
  int speak = 0;
  int disartr = 0;
  int neglect = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Card(
          elevation: 2,
          color: Colors.grey[200],
          child: ListTile(
            title: h1Text(
                '''Разработана американским Национальным Институтом Здоровья (National Institutes of Health Stroke Scale – NIH Stroke Scale) T.Brott et al, 1989, J.Biller et al, 1990. 

Используется для объективизации состояния пациента с ишемическим инсультом при поступлении, в динамике процесса и исхода инсульта к 21 суткам нахождения в стационаре. '''),
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text('''1a. Уровень бодрствования
Если полноценное исследование невозможно (например, из-за эндотрахеальной трубки, языкового барьера или повреждения оротрахеальной области), оценивается общий уровень ответов и реакций.
Оценка 3 ставится только в тех случаях, когда пациент в коме и не реагирует на болевые раздражители или его реакции носят рефлекторный характер (разгибание конечностей).'''),
              ),
              RadioListTile(
                  title: h2Text('Ясное сознание, живо реагирует.'),
                  value: bodr1a,
                  groupValue: 0,
                  onChanged: ((value) => setState(() {
                        bodr1a = 0;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Оглушение и/или сомноленция; можно добиться ответов и выполнения инструкций при минимальной стимуляции.'),
                  value: bodr1a,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        bodr1a = 1;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Глубокое оглушение или сопор, реагирует только на сильные и болевые раздражители, но движения не стереотипны.'),
                  value: bodr1a,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        bodr1a = 2;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Атония, арефлексия и ареактивность или ответы на раздражители состоят из рефлекторных нецеленаправленных движений и/или вегетативных реакций.'),
                  value: bodr1a,
                  groupValue: 3,
                  onChanged: ((value) => setState(() {
                        bodr1a = 3;
                      }))),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text('''1б. Уровень бодрствования: ответы на вопросы
Пациента просят назвать текущий месяц и свой возраст. Ответы должны быть точными, нельзя засчитывать ответ, который близок к правильному. Если пациент не воспринимает вопрос (афазия, значительное снижение уровня бодрствования), ставится оценка 2.
Если пациент не может говорить из-за механических препятствий (эндотрахеальная трубка, повреждение челюстно-лицевой области), тяжелой дизартрии или других проблем, не связанных с афазией, ставится оценка 1. Важно, чтобы оценивался только первый ответ и исследователь никак не помогал пациенту.'''),
              ),
              RadioListTile(
                  title: h2Text('Правильные ответы на оба вопроса.'),
                  value: bodr1b,
                  groupValue: 0,
                  onChanged: ((value) => setState(() {
                        bodr1b = 0;
                      }))),
              RadioListTile(
                  title: h2Text('Правильный ответ на один вопрос.'),
                  value: bodr1b,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        bodr1b = 1;
                      }))),
              RadioListTile(
                  title: h2Text('Не ответил на оба вопроса.'),
                  value: bodr1b,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        bodr1b = 2;
                      }))),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text('''1в. Уровень бодрствования: выполнение команд
Пациента просят открыть и затем закрыть глаза, сжать и разжать кулак непарализованной руки. Если есть препятствия (например, невозможно использовать руку), замените эту команду другой командой, предусматривающей одноэтапное действие. Если сделана явная попытка, но действие не завершено из-за слабости, результат зачитывается. Если пациент не реагирует на произнесение команды, ему следует продемонстрировать, что от него требуется, и затем оценить результат (повторил оба, одно или ни одного). Оценивается только первая попытка.'''),
              ),
              RadioListTile(
                  title: h2Text('Выполнил обе команды.'),
                  value: bodr1v,
                  groupValue: 0,
                  onChanged: ((value) => setState(() {
                        bodr1v = 0;
                      }))),
              RadioListTile(
                  title: h2Text('Выполнил одну команду.'),
                  value: bodr1v,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        bodr1v = 1;
                      }))),
              RadioListTile(
                  title: h2Text('Не выполнил ни одной из команд.'),
                  value: bodr1v,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        bodr1v = 2;
                      }))),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text('''2. Движения глазных яблок
Исследуются только горизонтальные движения. Оцениваются произвольные или рефлекторные (окулоцефалический рефлекс) движения, калорическая стимуляция не проводится. Если отмечается отведение обоих глазных яблок в сторону, но произвольные или рефлекторные движения возможны, ставится оценка 1. Если у пациента нарушена функция одного из глазодвигательных нервов (III, IV или VI), ставится оценка 1. Движения глазных яблок можно оценить у всех пациентов с афазией. У пациентов с травмой глаза, повязками на лице, слепотой и другими нарушениями остроты и/или полей зрения исследуют рефлекторные движения (метод выбирается на усмотрение исследователя). Иногда выявить парез взора помогает установление контакта глазами и движение в сторону от пациента.'''),
              ),
              RadioListTile(
                  title: h2Text('Норма.'),
                  value: eye,
                  groupValue: 0,
                  onChanged: ((value) => setState(() {
                        eye = 0;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Частичный парез взора; нарушены движения одного или обоих глаз, но нет тонической девиации глазных яблок и полного паралича взора.'),
                  value: eye,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        eye = 1;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Тоническая девиация глазных яблок или полный паралич взора, который сохраняется при проверке окулоцефалических рефлексов.'),
                  value: eye,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        eye = 2;
                      }))),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text('''3. Поля зрения
Поля зрения (верхние и нижние квадранты) исследуют методом конфронтации, путем подсчета количества пальцев или пугающих резких движений от периферии к центру глаза. Можно давать пациентам соответствующие подсказки, но если они смотрят в направлении движущихся пальцев, это можно расценивать как норму. Если один глаз не видит или отсутствует, исследуется второй. Оценка 1 ставится только в случае выявления четкой асимметрии (включая квадрантанопсию). Если пациент слеп (по любой причине), ставится 3. Здесь же исследуется одновременная стимуляция с обеих сторон, и, если есть гемиигнорирование, ставится 1 и результат используется в разделе 11.'''),
              ),
              RadioListTile(
                  title: h2Text('Поля зрения не нарушены.'),
                  value: visionField,
                  groupValue: 0,
                  onChanged: ((value) => setState(() {
                        visionField = 0;
                      }))),
              RadioListTile(
                  title: h2Text('Частичная гемианопсия.'),
                  value: visionField,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        visionField = 1;
                      }))),
              RadioListTile(
                  title: h2Text('Полная гемианопсия.'),
                  value: visionField,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        visionField = 2;
                      }))),
              RadioListTile(
                  title: h2Text('Слепота (включая корковую).'),
                  value: visionField,
                  groupValue: 3,
                  onChanged: ((value) => setState(() {
                        visionField = 3;
                      }))),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text('''4. Нарушение функции лицевого нерва
Попросить показать десны, поднять брови и зажмурить глаза (можно продемонстрировать с помощью пантомимы).
При нарушении контакта оценивается симметричность гримасы в ответ на болевые раздражители. Все повязки, скрывающие лицо, нужно удалить насколько это возможно.'''),
              ),
              RadioListTile(
                  title: h2Text(
                      'Нормальные симметричные движения мимических мышц.'),
                  value: faceNeuro,
                  groupValue: 0,
                  onChanged: ((value) => setState(() {
                        faceNeuro = 0;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Легкий парез мимических мышц (сглажена носо-губная складка, асимметричная улыбка).'),
                  value: faceNeuro,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        faceNeuro = 1;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Умеренный прозопарез (полный или выраженный парез нижней группы мимических мышц).'),
                  value: faceNeuro,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        faceNeuro = 2;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Паралич одной или обеих половин лица (отсутствие движений в верхней и нижней части лица).'),
                  value: faceNeuro,
                  groupValue: 3,
                  onChanged: ((value) => setState(() {
                        faceNeuro = 3;
                      }))),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text('''5a. Сила мышц правой руки
Разогнутую руку устанавливают под углом 90° (если пациент сидит) или 45° (если пациент лежит) к телу ладонями книзу и просят пациента удерживать ее в таком положении 10 с. Сначала оценивают непарализованную руку, затем другую. При афазии можно помочь принять исходное положение и использовать пантомиму, но не болевые раздражители. Если исследовать силу невозможно (конечность отсутствует, анкилоз в плечевом суставе, перелом), данный раздел помечается UN (от англ. untestable) и приводится объяснение причины.'''),
              ),
              RadioListTile(
                  title: h2Text('Рука не опускается в течение 10 с.'),
                  value: armRight,
                  groupValue: 0,
                  onChanged: ((value) => setState(() {
                        armRight = 0;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Рука начинает опускаться до истечения 10 с, но не касается кровати или другой поверхности.'),
                  value: armRight,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        armRight = 1;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Рука удерживается какое-то время, но в течение 10 с касается горизонтальной поверхности.'),
                  value: armRight,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        armRight = 2;
                      }))),
              RadioListTile(
                  title: h2Text('Рука сразу падает, но в ней есть движения.'),
                  value: armRight,
                  groupValue: 3,
                  onChanged: ((value) => setState(() {
                        armRight = 3;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Движения в руке отсутствуют. UN = исследовать невозможно.'),
                  value: armRight,
                  groupValue: 4,
                  onChanged: ((value) => setState(() {
                        armRight = 4;
                      }))),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text('''5б. Сила мышц левой руки'''),
              ),
              RadioListTile(
                  title: h2Text('Рука не опускается в течение 10 с.'),
                  value: armLeft,
                  groupValue: 0,
                  onChanged: ((value) => setState(() {
                        armLeft = 0;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Рука начинает опускаться до истечения 10 с, но не касается кровати или другой поверхности.'),
                  value: armLeft,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        armLeft = 1;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Рука удерживается какое-то время, но в течение 10 с касается горизонтальной поверхности.'),
                  value: armLeft,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        armLeft = 2;
                      }))),
              RadioListTile(
                  title: h2Text('Рука сразу падает, но в ней есть движения.'),
                  value: armLeft,
                  groupValue: 3,
                  onChanged: ((value) => setState(() {
                        armLeft = 3;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Движения в руке отсутствуют. UN = исследовать невозможно.'),
                  value: armLeft,
                  groupValue: 4,
                  onChanged: ((value) => setState(() {
                        armLeft = 4;
                      }))),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text('''6а. Сила мышц правой ноги
Всегда исследуется в положении лежа. Пациента просят поднять ногу под углом 30° к горизонтальной поверхности и удерживать в таком положении 5 с.
При афазии можно помочь принять исходное положение и использовать пантомиму, но не болевые раздражители. Сначала оценивают непарализованную ногу, затем другую.
Если исследовать силу невозможно (конечность отсутствует, анкилоз в тазобедренном суставе, перелом), данный раздел помечается UN (от англ. untestable) и приводится объяснение причины.'''),
              ),
              RadioListTile(
                  title: h2Text('Нога не опускается в течение 5 с.'),
                  value: legRight,
                  groupValue: 0,
                  onChanged: ((value) => setState(() {
                        legRight = 0;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Нога начинает опускаться до истечения 5 с, но не касается кровати.'),
                  value: legRight,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        legRight = 1;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Нога удерживается какое-то время, но в течение 5 с касается кровати.'),
                  value: legRight,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        legRight = 2;
                      }))),
              RadioListTile(
                  title: h2Text('Нога сразу падает, но в ней есть движения.'),
                  value: legRight,
                  groupValue: 3,
                  onChanged: ((value) => setState(() {
                        legRight = 3;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Движения в ноге отсутствуют. UN = исследовать невозможно.'),
                  value: legRight,
                  groupValue: 4,
                  onChanged: ((value) => setState(() {
                        legRight = 4;
                      }))),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text('''6б. Сила мышц левой ноги'''),
              ),
              RadioListTile(
                  title: h2Text('Нога не опускается в течение 5 с.'),
                  value: legLeft,
                  groupValue: 0,
                  onChanged: ((value) => setState(() {
                        legLeft = 0;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Нога начинает опускаться до истечения 5 с, но не касается кровати.'),
                  value: legLeft,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        legLeft = 1;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Нога удерживается какое-то время, но в течение 5 с касается кровати.'),
                  value: legLeft,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        legLeft = 2;
                      }))),
              RadioListTile(
                  title: h2Text('Нога сразу падает, но в ней есть движения.'),
                  value: legLeft,
                  groupValue: 3,
                  onChanged: ((value) => setState(() {
                        legLeft = 3;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Движения в ноге отсутствуют. UN = исследовать невозможно.'),
                  value: legLeft,
                  groupValue: 4,
                  onChanged: ((value) => setState(() {
                        legLeft = 4;
                      }))),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text('''7. Атаксия в конечностях
Данный раздел предусматривает выявление признаков поражения мозжечка с одной стороны. Исследование проводится с открытыми глазами. Если есть ограничение полей зрения, исследование проводится в той области, где нет нарушений.
С обеих сторон выполняются пальце-носо-пальцевая и коленно-пяточная проба. Баллы начисляются только в том случае, когда выраженность атаксии превосходит выраженность пареза. Если пациент не доступен контакту или парализован, атаксия отсутствует. Если пациент не видит, проводится пальце-носовая проба.
Если тест провести невозможно (конечность отсутствует, анкилоз, перелом), данный раздел помечается UN (от англ. untestable) и приводится объяснение причины.'''),
              ),
              RadioListTile(
                  title: h2Text('Атаксии нет.'),
                  value: ataks,
                  groupValue: 0,
                  onChanged: ((value) => setState(() {
                        ataks = 0;
                      }))),
              RadioListTile(
                  title: h2Text('Атаксия в одной конечности.'),
                  value: ataks,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        ataks = 1;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Атаксия в двух конечностях. UN = исследовать невозможно.'),
                  value: ataks,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        ataks = 2;
                      }))),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text('''8. Чувствительность
Исследуется с помощью уколов булавкой (зубочисткой) и прикосновений. При нарушении сознания или афазии оцениваются гримасы, отдергивание конечности. Оцениваются только гипестезия, вызванная инсультом (по гемитипу), поэтому для верификации необходимо сравнивать реакцию на уколы в различных частях тела (предплечья и плечи, бедра, туловище, лицо).
Оценка 2 ставится только в тех случаях, когда грубое снижение чувствительности в одной половине тела не вызывает сомнений, поэтому пациенты с афазией или нарушением сознания на уровне сопора получат 0 или 1.
При двусторонней гемигипестезии, вызванной стволовым инсультом, ставится 2. Пациенты в коме автоматически получают 2.'''),
              ),
              RadioListTile(
                  title: h2Text('Норма.'),
                  value: sense,
                  groupValue: 0,
                  onChanged: ((value) => setState(() {
                        sense = 0;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Легкая или умеренная гемигипестезия; на пораженной стороне пациент ощущает уколы как менее острые или как прикосновения.'),
                  value: sense,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        sense = 1;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Тяжелая гемигипестезия или гемианестезия; пациент не ощущает ни уколов, ни прикосновений.'),
                  value: sense,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        sense = 2;
                      }))),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text('''9. Речь
Сведения относительно понимания обращенной речи уже получены в ходе исследования предыдущих разделов. Для изучения речевой продукции пациента просят описать события на картинке, назвать предметы и прочесть отрывок текста (см. приложение). Если исследованию речи мешают проблемы со зрением, попросите пациента назвать предметы, помещаемые ему в руку, повторить фразу и рассказать о каком-либо событии из его жизни. Если установлена эндотрахеальная трубка, пациента следует попросить выполнить задания письменно. Больные в коме автоматически получают 3.
При нарушении сознания оценку определяет исследователь, но 3 ставится только при мутизме и полном игнорировании простых команд.'''),
              ),
              RadioListTile(
                  title: h2Text('Норма.'),
                  value: speak,
                  groupValue: 0,
                  onChanged: ((value) => setState(() {
                        speak = 0;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Легкая или умеренная афазия; речь искажена или нарушено понимание, но пациент может высказать свою мысль и понять исследователя.'),
                  value: speak,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        speak = 1;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Тяжелая афазия; возможна лишь фрагментарная коммуникация, понимание речи пациента сильно затруднено, со слов пациента исследователь не может понять, что изображено на картинках.'),
                  value: speak,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        speak = 2;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Мутизм, тотальная афазия; пациент не произносит никаких звуков и совершенно не понимает обращенной речи.'),
                  value: speak,
                  groupValue: 3,
                  onChanged: ((value) => setState(() {
                        speak = 3;
                      }))),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text('''10. Дизартрия
Не нужно говорить пациенту, что именно вы собираетесь оценивать. При нормальной артикуляции пациент говорит внятно, у него не вызывает затруднений произнесение сложных сочетаний звуков, скороговорок.
При тяжелой афазии оценивается произношение отдельных звуков и фрагментов слов, при мутизме ставится 2.
Если тест провести невозможно (интубация, травма лица), данный раздел помечается UN (от англ. untestable) и приводится объяснение причины.'''),
              ),
              RadioListTile(
                  title: h2Text('Норма.'),
                  value: disartr,
                  groupValue: 0,
                  onChanged: ((value) => setState(() {
                        disartr = 0;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Легкая или умеренная дизартрия; некоторые звуки «смазаны», понимание слов вызывает некоторые затруднения.'),
                  value: disartr,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        disartr = 1;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Грубая дизартрия; слова настолько искажены, что их очень трудно понять (причина не в афазии), или отмечается анартрия/мутизм. UN = исследовать невозможно.'),
                  value: disartr,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        disartr = 2;
                      }))),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text('''11. Гемиигнорирование (неглект)
Под сенсорным гемиигнорированием понимают нарушение восприятия на половине тела (обычно левой) при нанесении стимулов одновременно с обеих сторон при отсутствии гемигипестезии. Под визуальным гемиигнорированием понимают нарушение восприятия объектов в левой половине поля зрения при отсутствии левосторонней гемианопсии.
Как правило, достаточно данных из предыдущих разделов. Если исследовать зрительное гемиигнорирование невозможно ввиду зрительных нарушений, а восприятие болевых раздражителей не нарушено, оценка 0.
Анозогнозия свидетельствует о гемиигнорировании.
Оценка в данном разделе ставится только при наличии гемиишорирования, поэтому заключение «исследовать невозможно» к нему неприменимо.'''),
              ),
              RadioListTile(
                  title: h2Text('Норма.'),
                  value: neglect,
                  groupValue: 0,
                  onChanged: ((value) => setState(() {
                        neglect = 0;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Выявлены признаки гемиигнорирования одного вида раздражителей (зрительных, сенсорных, слуховых).'),
                  value: neglect,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        neglect = 1;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Выявлены признаки гемиигнорирования более чем одного вида раздражителей; не узнает свою руку или воспринимает лишь половину пространства.'),
                  value: neglect,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        neglect = 2;
                      }))),
            ],
          ),
        ),
        Card(
          elevation: 2,
          color: Colors.amber,
          child: nihssResult(
              bodr1a,
              bodr1b,
              bodr1v,
              eye,
              visionField,
              faceNeuro,
              armRight,
              armLeft,
              legRight,
              legLeft,
              ataks,
              sense,
              speak,
              disartr,
              neglect),
        )
      ],
    );
  }
}

Widget nihssResult(
    int bodr1a,
    int bodr1b,
    int bodr1v,
    int eye,
    int visionField,
    int faceNeuro,
    int armRight,
    int armLeft,
    int legRight,
    int legLeft,
    int ataks,
    int sense,
    int speak,
    int disartr,
    int neglect) {
  int total = bodr1a +
      bodr1b +
      bodr1v +
      eye +
      visionField +
      faceNeuro +
      armRight +
      armLeft +
      legRight +
      legLeft +
      ataks +
      sense +
      speak +
      disartr +
      neglect;
  String result = '';
  if (total >= 0 && total <= 2) {
    result =
        'Количество баллов пациента: $total\n\nСостояние удовлетворительное';
  }
  if (total >= 3 && total <= 8) {
    result =
        'Количество баллов пациента: $total\n\nНеврологические нарушения легкой степени';
  }
  if (total >= 9 && total <= 12) {
    result =
        'Количество баллов пациента: $total\n\nНеврологические нарушения средней степени';
  }
  if (total >= 13 && total <= 15) {
    result =
        'Количество баллов пациента: $total\n\nТяжелые неврологические нарушения';
  }
  if (total >= 16 && total <= 33) {
    result =
        'Количество баллов пациента: $total\n\nНеврологические нарушения крайней степени тяжести';
  }
  if (total >= 34) {
    result = 'Количество баллов пациента: $total\n\nКома';
  }

  return ListTile(title: h2Text(result));
}
