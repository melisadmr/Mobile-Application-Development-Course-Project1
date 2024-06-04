# Mobile-Application-Development-Course-Project1
This project was developed as a homework project for Erciyes University Computer Engineering Department Mobile application development course. Lecturer of the course: Dr. Lecturer Its member is  Dr. Öğr. Üyesi Fehim KÖYLÜ
# Uygulama Adı: Country Flag App
Country Flag App, Flutter kullanarak geliştirdiğim bir mobil uygulamadır. Bu uygulama, kullanıcıların farklı ülkelerin listesini görüntülemesini ve seçilen ülkenin bayrağını görüntülemesini sağlar. Uygulama, TheMealDB API'sini kullanarak veri çekmektedir. 

# Uygulama Geliştirme Süreci
# Proje Oluşturma ve Paket Yükleme:

İlk olarak, Flutter SDK'sını kullanarak yeni bir Flutter projesi oluşturdum.
![image](https://github.com/melisadmr/Mobile-Application-Development-Course-Project1/assets/95651112/8de6dcc5-e976-48e5-b4e0-8b1de13034c0)

Daha sonra, gerekli bağımlılıkları 'pubspec.yaml' dosyasına ekledim ve 'flutter pub get' komutunu çalıştırarak bu bağımlılıkları yükledim.
![image](https://github.com/melisadmr/Mobile-Application-Development-Course-Project1/assets/95651112/a3777d24-0d6a-4f43-bb5e-322b739216d4)

# API Entegrasyonu:

TheMealDB API'sinden veri çekmek için bir servis oluşturmak gerekti. lib/services/api_service.dart dosyasını oluşturdum ve API çağrıları için gerekli metodları yazdım.

# State Management (Durum Yönetimi):

Uygulamanın durum yönetimini sağlamak için 'provider' paketini kullandım. 'lib/providers/country_provider.dart' dosyasını oluşturup, veri çekme ve seçim işlemlerini yöneten bir 'provider' sınıfı tanımladım.
# Ana Ekran ve Detay Ekranı:

Uygulamanın iki ana ekranı vardır: Ülkeler listesi ekranı ve ülke detay ekranı.
'lib/screens/country_list_screen.dart' dosyasında, ülkeler listesini gösteren ekranı oluşturdum. Bu ekranda, kullanıcı bir ülkeye tıkladığında seçilen ülke detay ekranına yönlendirilir.
'lib/screens/country_detail_screen.dart' dosyasında, seçilen ülkenin detaylarını ve bayrağını gösteren ekranı oluşturdum.
# Ana Uygulama Yapısı:

Son olarak, 'lib/main.dart' dosyasını oluşturup, uygulamanın başlangıç ekranını ve gerekli provider yapılandırmasını yaptım.


# Uygulamanın Özellikleri
Ülkeler Listesi: Ana ekranda, TheMealDB API'sinden çekilen ülkeler listelenir.

Ülke Detayları: Kullanıcı bir ülkeye tıkladığında, o ülkenin detay ekranı açılır ve seçilen ülkenin bayrağı gösterilir.

Asenkron Veri Çekme: API çağrıları asenkron olarak gerçekleştirilir, böylece kullanıcı arayüzü donmaz ve veri çekme işlemleri arka planda yapılır.

State Management: Uygulamanın durumu, Provider kullanılarak yönetilir. Bu, uygulamanın yeniden oluşturulması gerektiğinde verilerin kaybolmamasını sağlar.

Animasyonlu Geçişler: Hero animasyonu kullanılarak, ülkeler listesi ekranından ülke detay ekranına geçişler animasyonlu olarak gerçekleştirilir.
# Ekran Tasarımları
Uygulamanın iki ana ekranı vardır: Ülkeler Listesi Ekranı ve Ülke Detay Ekranı. Her iki ekranın tasarımı aşağıdaki gibidir:

# 1. Ülkeler Listesi Ekranı (Country List Screen)

Tasarım Özellikleri:

- Uygulama çubuğunda (AppBar) "Countries" başlığı.

- Veri yüklenirken dönen bir yükleme göstergesi (CircularProgressIndicator).

- Veri yüklendikten sonra bir liste (ListView) ile ülkeler gösterilir.

- Her liste öğesi (ListTile), ülke adını içerir ve tıklandığında ilgili ülkenin detay ekranına yönlendirir.
# 2. Ülke Detay Ekranı (Country Detail Screen)

Tasarım Özellikleri:

- Uygulama çubuğunda (AppBar), seçilen ülkenin adı başlık olarak gösterilir.
  
- Ülke seçilmediyse veya bayrak verisi henüz yüklenmediyse bir uyarı mesajı ("No country selected!") gösterilir.
  
- Ülke ve bayrak verisi yüklendiyse:
  
- Ülkenin adı büyük ve kalın bir yazı tipiyle gösterilir.
- Ülkenin bayrağı (Hero widget ile animasyonlu olarak) gösterilir.
  
# Kullanılan Widget'lar ve Özellikleri
1. Scaffold:

- Temel ekran yapısını sağlar.
- appBar özelliği ile üstte bir uygulama çubuğu oluşturur.
- body özelliği ile ekranın ana içeriğini oluşturur.
  
2. AppBar:

- Ekranın üst kısmında bir başlık barı oluşturur.
- Başlık olarak seçilen ülkenin adını veya "Countries" metnini gösterir.

3. FutureBuilder:

- Asenkron veri yüklemeyi yönetir.
- snapshot.connectionState ile veri yükleme durumunu kontrol eder ve uygun widget'ı gösterir (yükleme göstergesi, hata mesajı veya veriler).

4. Consumer:

- provider paketini kullanarak veri sağlayıcısına erişir ve dinamik olarak güncellemeleri alır.
- countryProvider.countries verisini kullanarak bir liste oluşturur.

5. ListView.builder:

- Dinamik olarak liste öğeleri oluşturur.
- itemCount ile öğe sayısını belirler ve itemBuilder ile her öğeyi oluşturur.

6. ListTile:

- Liste öğelerini temsil eder.
- title özelliği ile ülke adını gösterir.
- onTap olayı ile tıklandığında ülke detay ekranına yönlendirme yapar.

7. Hero:

- İki ekran arasında animasyonlu geçiş sağlar.
- tag özelliği ile aynı değeri paylaşan iki widget arasında geçiş yapar.

Bu tasarımlar, kullanıcıların kolayca ülkeler arasında gezinmesini ve seçilen ülkenin bayrağını görmesini sağlar. Ayrıca, animasyonlu geçişler ve asenkron veri yükleme sayesinde kullanıcı deneyimi iyileştirilmiştir.

# SONUÇ
Bu uygulamayı geliştirirken Flutter'ın sunduğu güçlü araçları ve TheMealDB API'sinin esnekliğini kullandım. Bu süreçte asenkron programlama, state management ve animasyon gibi temel Flutter konularını uygulamalı olarak öğrenme fırsatı buldum.

# --------------------------AS ENGLISH------------------------
# Application Name: Country Flag App

# Description:
Country Flag App is a mobile application developed using Flutter. This application allows users to view a list of different countries and displays the flag of the selected country. The application fetches data from TheMealDB API.

# Development Process
Project Setup and Package Installation:

First, I created a new Flutter project using the Flutter SDK.
![image](https://github.com/melisadmr/Mobile-Application-Development-Course-Project1/assets/95651112/8de6dcc5-e976-48e5-b4e0-8b1de13034c0)

Then, I added the necessary dependencies to the pubspec.yaml file and ran flutter pub get to install these dependencies.
![image](https://github.com/melisadmr/Mobile-Application-Development-Course-Project1/assets/95651112/a3777d24-0d6a-4f43-bb5e-322b739216d4)



# API Integration:

I needed to create a service to fetch data from TheMealDB API. I created the lib/services/api_service.dart file and wrote the necessary methods for API calls.
# State Management:

I used the provider package to manage the application's state. I created the lib/providers/country_provider.dart file and defined a provider class that manages data fetching and selection operations.

# Main Screen and Detail Screen:

The application has two main screens: the countries list screen and the country detail screen.
In the lib/screens/country_list_screen.dart file, I created the screen that displays the list of countries. When a user taps on a country, they are navigated to the country detail screen.
In the lib/screens/country_detail_screen.dart file, I created the screen that displays the details and flag of the selected country.
# Main Application Structure:

Finally, I created the lib/main.dart file, set up the starting screen of the application, and configured the necessary provider.
# Features of the Application
Country List: The main screen displays a list of countries fetched from TheMealDB API.

Country Details: When a user taps on a country, the detail screen opens, showing the flag of the selected country.

Asynchronous Data Fetching: API calls are performed asynchronously to ensure the UI remains responsive, and data fetching operations run in the background.

State Management: The application state is managed using Provider, which ensures that data is preserved across the application lifecycle.

Animated Transitions: Hero animations are used to create smooth transitions from the country list screen to the country detail screen.

# Screen Designs
The application has two main screens: the Country List Screen and the Country Detail Screen. The designs of these screens are as follows:

# 1. Country List Screen
   
Design Features:

- An AppBar with the title "Countries".

- A loading indicator (CircularProgressIndicator) while data is being fetched.

- A ListView displaying countries once data is loaded.

- Each ListTile contains the name of a country and navigates to the detail screen of the selected country when tapped.
# 2. Country Detail Screen
Design Features:

- An AppBar displaying the name of the selected country as the title.

- A message ("No country selected!") if no country is selected or flag data is still loading.

- If country and flag data are loaded:
- The country's name displayed in a large, bold font.
- The country's flag displayed with a Hero widget for an animated transition.

# Widgets and Their Features
1. Scaffold:

- Provides the basic structure for the screen.
- appBar property creates a top app bar.
- body property contains the main content of the screen.
  
2. AppBar:

- Creates a title bar at the top of the screen.
- Displays "Countries" or the selected country's name as the title.
  
3. FutureBuilder:

- Manages asynchronous data fetching.
- Uses snapshot.connectionState to check the state of the data fetching process and displays the appropriate widget (loading indicator, error message, or data).

4. Consumer:

- Accesses the data provider using the provider package and dynamically updates the UI based on the data.
- Uses countryProvider.countries to create a list of countries.

5. ListView.builder:

- Dynamically creates list items.
- itemCount specifies the number of items, and itemBuilder creates each item.

6. ListTile:

- Represents individual list items.
- Displays the country name with the title property.
- Navigates to the country detail screen when tapped using the onTap event.

7. Hero:

- Provides animated transitions between screens.
- Uses the tag property to create transitions between two widgets with the same tag.
  
These designs ensure that users can easily navigate through countries and view the selected country's flag. Additionally, animated transitions and asynchronous data fetching enhance the user experience.

# RESULT
By developing this application, I leveraged Flutter's powerful tools and the flexibility of TheMealDB API. Through this process, I gained practical experience with asynchronous programming, state management, and animations in Flutter.
