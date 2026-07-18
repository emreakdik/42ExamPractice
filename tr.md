# 42 Exam Practice — Turkce Kilavuz

> **Yeni (18 Temmuz 2026):** **Exam Rank 03 eklendi!** Level 1 (`get_next_line`, `ft_scanf`, `filter`) ve Level 2 (`n_queens`, `permutations`, `powerset`, `rip`, `tsp`). Ana menuden dogrudan secebilirsiniz.

42 Exam Practice, sinav pratigini daha derli toplu ve tekrarlanabilir hale getiren terminal tabanli bir pratik shell'idir. Klasorler, daginik subject'ler ve elle test kurulumu arasinda gezinmek yerine tek bir akista kalirsiniz: rank sec, level sec, coz, test et, devam et.

English instructions: [README.md](https://github.com/emreakdik/42ExamPractice/blob/main/README.md)

## Kurulum

Once repoyu istediginiz dizine klonlayin:

```bash
git clone https://github.com/emreakdik/42ExamPractice
cd 42ExamPractice
bash exampractice.sh
```

Shell acildiginda dogrudan pratik akisinin icindesiniz.

## Ana Menu

Menude ok tuslariyla (↑/↓) gezinip Enter ile secim yaparsiniz. Alternatif olarak secmek istediginiz sirayi rakamla yazip Enter'a da basabilirsiniz.

- **Exam Rank 02** — Level 0-3, kisa C egzersizleri
- **Exam Rank 03  (NEW)** — Level 1 ve Level 2
- **Command Reference** — komutlarin aciklamalari
- **Update Script** — pratik shell'i gunceller
- **Open Rendu Folder** — rendu klasorunu acar
- **Exit Without Deleting Rendu** — rendu'yu silmeden cikar (arsivler)
- **Exit** — rendu'yu silip cikar

## Ranklar ve Leveller

### Exam Rank 02
- **Level 0-3** — string, bit islemleri, matematik, bagli listeler gibi klasik piscine tarzi kisa egzersizler.

### Exam Rank 03  (NEW)
- **Level 1:** `get_next_line`, `ft_scanf`, `filter`
- **Level 2:** `n_queens`, `permutations`, `powerset`, `rip`, `tsp`

Her egzersiz kendi subject'i, referans cozumu ve tester'i ile gelir. Rank 03'un Level 2 egzersizleri agirlikli olarak backtracking uzerinedir.

## Pratik Sirasinda Komutlar

Bir subject karsiniza ciktiktan sonra `/>` isaretine su komutlari yazabilirsiniz:

- `test` — kodunuzu mevcut soru icin test eder.
- `next` — siradaki soruya gecer.
- `previous` — bir onceki soruya doner.
- `menu` — ana menuye doner (rendu temizlenir).
- `exit` — shell'den cikar.

> Komutlarin detaylarini ana menudeki **Command Reference** seceneginden de gorebilirsiniz. Yukari ok ile onceki komutlarinizi geri cagirabilirsiniz.

## Kodlarimi Nereye Yazacagim?

Shell'in kodunuzu dogru sekilde bulup test edebilmesi icin dosyanizi sinavdaymis gibi bir `rendu` klasorune yerlestirmeniz gerekir. Menuye ilk eristiginizde program `42ExamPractice` icinde bir `rendu` klasoru olusturur.

Ornek olarak `first_word` sorusunu cozdugunuzu dusunelim:

```text
42ExamPractice/
└── rendu/
    └── first_word/
        └── first_word.c
```

Rank 03'ten `get_next_line` cozerken:

```text
42ExamPractice/
└── rendu/
    └── get_next_line/
        ├── get_next_line.c
        └── get_next_line.h
```

Yani kural basit: `rendu/<soru_adi>/<soru_adi>.c`. Bazi Rank 03 egzersizleri
(ornegin `get_next_line`) ek olarak bir `.h` dosyasi da bekler.

## Platform Notlari

- En iyi deneyim: macOS ve Linux.
- Windows kullanicilari WSL veya Git Bash tercih etmeli.
- Sonsuz donguye giren cozumler test sirasinda otomatik olarak zaman asimina ugratilip sonlandirilir, ekran kitlenmez.

## Katki

Bu, gercek kullanim ve gercek sinav sikintisindan dogmus acik kaynak bir pratik aracidir. Gelistirmek isterseniz issue acabilir, PR gonderebilir veya bir sonraki rank desteginin sekillenmesine yardim edebilirsiniz.
