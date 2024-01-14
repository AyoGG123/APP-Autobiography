import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final tabs = [
    screen1(),
    screen2(),
    screen3(),
    screen4(),
  ];

  int previousIndex = 0;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '我的自傳',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('我的自傳')),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.deepPurple,
          // 新的颜色
          selectedItemColor: Colors.white,
          selectedFontSize: 18,
          unselectedFontSize: 14,
          iconSize: 30,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: currentIndex == 0
                  ? Image.asset('images/1.png', width: 40, height: 40)
                  : Image.asset('images/1.png', width: 20, height: 20),
              label: '自我介紹',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: '學習歷程',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule_outlined),
              label: '學習計畫',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.engineering),
              label: '專業方向',
            ),
          ],
          onTap: (index) {
            setState(() {
              previousIndex = currentIndex;
              currentIndex = index;
              if (index == 0) {
                if (previousIndex == currentIndex) player.resume();
                player.stop();
                // player.play(AssetSource('1.mp3'));
              }
              if (index == 1) {
                if (previousIndex == currentIndex) player.resume();
                player.stop();
                // player.play(AssetSource('2.mp3'));
              }
              if (index == 2) {
                if (previousIndex == currentIndex) player.resume();
                player.stop();
                // player.play(AssetSource('3.mp3'));
              }
              if (index == 3) {
                if (previousIndex == currentIndex) player.resume();
                player.stop();
                // player.play(AssetSource('4.mp3'));
              }
            });
          },
        ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {
  final String s1 =
      '我誕生在一個平凡卻幸福的小家庭，父親在台電服務，是一位公務員，而母親則是位貼心的家庭主婦。我和弟弟都在學校努力學習，父母以民主的方式教導我們，期望培養我們獨立自主的品格，並鼓勵我們積極參與生活，累積寶貴的人生經驗。他們強調兩項基本要求，首先是保持身體健康，其次是注重學業。因為他們深知，只有擁有健康的身體，才能充分發揮才華和實現抱負。由於家境不富裕，我們也被要求專注於學業，學習一技之長，為將來的自立奠定基礎。'
      '在小學時期，我活潑好動，雖然在課業上表現平平，但在課外活動方面取得不錯的成績。曾擔任過班長等幹部，參加樂隊、糾察隊，並有幸被選為校隊參加跳高比賽。小學畢業後，我進入了一所私立中學，校規嚴格使我轉變為較為文靜的個性，但在這段時期，我學到了禮節與待人處世的重要原則。在國中時，我代表學校接受了縣政府的表揚，並在國三畢業典禮上代表全體畢業生領取畢業證書。'
      '進入附中後，我的生活充實而快樂。附中學生以能K、能玩聞名，我不斷努力學習，希望達到這個目標。在課業方面，我能保持一定水準，因為我專心聽講、深思熟慮，積極參與老師的教學。我喜愛的科目包括數學、化學和生物，因為這些科目能夠培養我的組織與思考能力，而生物更讓我深入瞭解人體的奧秘。'
      '與此同時，我對資訊科技充滿好奇心，擁有實踐力。喜歡不斷探索科技的發展，並在實際應用中挑戰自己。除了學術上的追求，我還對生物、社會和科學有著濃厚的興趣，深信這些領域的知識能夠豐富我的人生視野。同時，喜好健身的我將健康視為生活的重要一環，努力保持良好的身體狀態。';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 标题
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              '自我介紹',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                s1,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 20),
          // 放一张照片（使用圆形剪裁）
          ClipOval(
            child: Container(
              color: Colors.deepPurple, // 新的颜色
              child: Image.asset(
                'images/1.png',
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 30),
          // 图片展示（使用圆形剪裁和灵活布局）
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCircularImage('images/1.png'),
              _buildCircularImage('images/1.png'),
            ],
          ),
        ],
      ),
    );
  }

  // 辅助方法：构建圆形图片
  Widget _buildCircularImage(String imagePath) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2, color: Colors.deepPurple), // 新的颜色
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '學習歷程',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height: 20),
          _buildEducationItem(
            '永信國小',
            '在永信國小的學習歷程中，我培養了基礎的學科知識，並參與了多項課外活動，培養了合作和溝通的能力。',
          ),
          _buildEducationItem(
            '大橋國中',
            '進入大橋國中後，我開始對科學和數學產生濃厚興趣，參與了一些科學競賽和數學競賽，獲得了一些獎項。',
          ),
          _buildEducationItem(
            '台南高工',
            '在台南高工的學習歷程中，我專業知識得到了更深入的拓展，並積極參與校內的技能培訓和專案實作。',
          ),
          _buildEducationItem(
            '高科大',
            '進入高科大後，我選擇資訊工程作為我的主修，深入學習了軟體開發、資料庫管理等相關知識。同時，我積極參與學校的科研項目，擔任了一些學生組織的幹部，培養了領導和管理的能力。',
          ),
          SizedBox(height: 20),
          Text(
            '未來規劃：',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '我將繼續不斷學習和成長，探索新的學術領域，並將所學應用於實際問題的解決中。未來，我希望能夠在資訊科技領域取得更深厚的專業知識，並為社會做出更有意義的貢獻。',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationItem(String school, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            school,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 18, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTermSection('大一時期', [
              '學好英文',
              '了解科系',
              '人際關係',
            ]),
            SizedBox(height: 20),
            _buildTermSection('大二時期', [
              '多益測驗550分',
              '刷leetcode',
              '參加校內競賽',
              '維持成績',
            ]),
            SizedBox(height: 20),
            _buildTermSection('大三時期', [
              '多益測驗750分',
              '刷leetcode',
              '做好實務專題',
            ]),
            SizedBox(height: 20),
            _buildTermSection('大四時期', [
              '參加校外實習',
              '維持英文水平',
              '做好實務專題',
              '考慮是否讀研',
            ]),
          ],
        ),
      ),
    );
  }

  // 辅助方法：构建学期的目标列表
  Widget _buildTermSection(String term, List<String> goals) {
    return Column(
      children: [
        Text(
          term,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          padding: EdgeInsets.all(10),
          child: ListView(
            children: goals.map((goal) => _buildListItem(goal)).toList(),
          ),
        ),
      ],
    );
  }

  // 辅助方法：构建目标列表项
  Widget _buildListItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            '• ',
            style: TextStyle(
              fontSize: 20,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '專業方向：資訊工程',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '我是一位資訊工程的學生，對於科技和程式設計充滿熱情。我的專業方向主要集中在以下領域：',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ),
          SizedBox(height: 20),
          _buildListItem('軟體開發：熟練使用多種程式語言，包括但不限於Java、Python、Dart等。'),
          _buildListItem('前端開發：擁有豐富的前端開發經驗，熟悉HTML、CSS、JavaScript等技術。'),
          _buildListItem('資料庫管理：具有良好的資料庫管理和SQL語言的能力。'),
          _buildListItem('專案經驗：參與過多個實際專案，熟悉團隊協作和項目管理。'),
          _buildListItem('新技術探索：對新興技術和趨勢保持敏感，不斷學習和探索。'),
          SizedBox(height: 20),
          Text(
            '未來規劃：',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '我期望將我的資訊工程專業知識應用於解決現實世界的問題。將來我希望能夠深入研究人工智慧、大數據分析等前沿領域，並在軟體開發領域取得更多的成就。',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(
            Icons.arrow_forward,
            color: Colors.deepPurple,
            size: 24,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
