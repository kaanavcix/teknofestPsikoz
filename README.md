# Psikoz

Arkadaşlar merhaba aşağı todo ve projeyi nasıl install edebilirsiniz onları yazıcam buna göre ilerleme yaparız

## Installation
Projeyi git clone ile local bilgisiyarınıza indirebilirsiniz.
```
git clone https://github.com/kaanavcix/teknofestPsikoz

```
Projeyi ayağı kaldırmak için. Device kısmından mobil emülatörün seçili olması gerekmekte dikkat ediniz.

``` 
flutter run 

```

Eğer projeyi güncellemek isterseniz 

``` 
git pull

```
Yazdığınız kodları projeye import etmek isterseniz 
``` 
git pull 
git push -u origin main 

```
eğer isterseniz farklı bir branch (dal oluşturup projeyi orayada atabilirsiniz) şuanlık öyle yapmanız daha mantıklı olucaktır.

>branch oluşturmak için
git checkout -b “carpma_islemi”
``` 
git checkout -b “develop”

```
brancha geçmek için
``` 
git checkout  “develop”

```

ardından 
``` 
git pull 
git push -u origin develop 

```

yazmanız yeterlidir proje otomatik güncellenicektir.
## Package

Burda kullandığım paketleri yazıcam bakarsınız.
>Getx

>Dio

>Image Picker

>Hive etc. 

ayrıca pubspec.yaml dosyasına bakabilirsiniz
## TODO 

Uygulamada iki farklı kısım olucak 

Giriş kısmı aynı arayüz olucak. 
### Psikolog (Doktor)
 -Kayıt olma kısmı 
 - [x] giriş yapma kısmı 
 - Post görünteleme kısmı
 -posta cevap verme kısmı
 - [x] Kendi makalelerini yazabilecekleri kısım 
 - podcast paylaşma sayfası
 - görüntülü görüşme ve randevu sistemi kısmı

 ileride eklemeye devam edeceğiz muhtamelen.
### Kullanıcı (Hasta) 

- [x] Giriş yapma ekranı 
- [x] Kayıt olma ekranı (Hasta bitti Doktor kısmı yapılacak)
- [x] Profil Sayfası(Güncellenicek ama)
- [x] Post ekleme sayfası( Validate sayfasında mini quiz kısmı için tasarlamalarını bekliyeceğim o kısım kaldı)
- [x] Ana sayfa Ui bitti (api entegrasyon yapılacak placeholder bulunan kısımları değiştireceğiz api iyileştirme yapılacak bir karma veri döndürme sistemi oluşturalacak)
- [x] Arama Ui %87 (api entegrasyon yapılacak ve ilgili sayfalara gidebilmesi için tasarım yapılacak)
- [x] post görünteleme sayfası ui bitti (güncellenebilir ui ve api entegrasyon)
- [x] Özel oda isminde bir kısım oluşturuldu doktor ile hasta oradan konuşacaklar
- [ ] Mesajlaşma kısmını yeniden tasarlayalım o kısımda kişi kendi problemlerini cevaplarını ve görüntülü konuşma yapabilmesi için randevu sistemini orada oluşturalım.
- [ ] Bildirim sayfası yapılacak bunun tasarımı gerekli
- [ ] ayarlar kısmına ekleme yapılacak 
- []
> eğer eksik gördüğünüz yerleri doldurabilirsiniz.

>altta kalan kısımları zamanla dolduracağım 


### API URL LINKLERI
Hurakoya bağlamayı deniyorum olmazsa eğer localhost üzerinden ilerleriz yada kendi pc ipmi globale çekerim
### Onboarding Screen
#### Login
- /api/login

- [x] General login processing (Onam formu kabulu gibi şeyler daha eklenmedi eklenilecek son aşamada).


#### Register
- /api/register
- [x] General register processing 
- Ui kısmında eksiklikler mevcut doktor kayıt olma ekranı için bir tasarım gerekli



### Home Screen

#### Search 



#### Natifications
#### Book Article Music Podcast Suggestion System 

- [x] get music
> /api/musics

- [x] get book
> /api/books

- [x] get article 
> /api/articles

- [x] get podcast
> /api/podcasts

> add update delete article getby id also 

> add update delete podcast  getby id also

#### Post Screen
> verify post return 
-[x]

> add post

> Relating to post comment wait page

#### Profile Screen 

> User data return 

> Doctor data return or any article or etc.









