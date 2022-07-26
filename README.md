# VGA-Framebuffer(v. 1.0)
ФБ для статичных изображений
Сделан для платы OMDAZZ с чипом Cyclone IV E: EP4CE10E22C8

# Содержание
[- Краткое описание папок](#краткое-описание-папок)
[- Описание дизайна](#описание-дизайна)
[- Предполагаемый алгоритм работы с фреймбуфером](#предполагаемый-алгоритм-работы-с-фреймбуфером)

# Краткое описание папок
- assets - файлы изображений для данного руководства
- BitStreams - набор готовых програмных файлов для загрузки на ПЛИС.
	- Checkmates.sof - дизайн, хранящий изображение в виде чередующихся черных и белых пикселей
	- TestPicture1.sof - дизайн, хранящий случайное тестовое изображение №1
	- TestPicture2.sof - дизайн, хранящий случайное тестовое изображение №2
	- TestPicture3.sof - дизайн, хранящий случайное тестовое изображение №3
	- Working.sof - дизайн, хранящий изображение с надписью "It's working"
- FBTest - папка проектов ModelSim для отладки дизайна
	- FIFO_Test.mpf - проект отладочной симуляции работы ФИФО
	- MEM_Tb.mpf - проект отладочной симуляции работы модуля памяти
	- ROM_Tb.mpf - проект отладочной симуляции работы ROM
	- TOP_Tb.mpf - проект отладочной симулации всего фреймбуфера
- Project - рабочая папка проекта Quartus
- RGBPaint - папка проекта графического редактора для Visual Studio
- Sourcefiles - папки с файлами-исходниками
	- FIFO - папка с файлами ФИФО
	- MEM - папка с файлами модуля памяти
	- PictureData - папка с файлами тестовых изображений
	- PLL - папка с файлами IP-модуля ФАПЧ
	- ROM - папка с файлами модуля ROM
	- TOP - папка с файлами VGA, сброса памяти и верхних модулей проекта

# Описание дизайна
Дизайн представляет собой кадровый буфер для вывода изображений посредством VGA-интерфейса. При его создании делался акцент на минимизацию требуемых аппаратных ресурсов ПЛИС и предоставление максимальных возможностей для будущей модификации, расширения и использования в других проектах. Кроме непосредственно буфера, к нему идет отладочное ПО, позволяющее легче искать ошибки при модификации.

## Особенности
- Разрешение данной версии кадрового буфера фиксированно и составляет 80x60.
- Разрешение экрана (пока) также фиксированно как 640x480.
- Буфер может осуществлять сброс памяти и перезапись изображения, в случае необходимости.
- Структурно память буфера является однопортовой памятью с произвольным доступом
- Алгоритм чтения и записи в кадровый буфер реализован по схеме "пинг-понг". Таким образом обновление изображение происходит в реальном времени.
- Максимальная частота обновления изображения: 781 Гц (1,28 мс/кадр).
- Память буфера расчитана на цветность VGA-RGB. Это позволяет хранить изображения с цветовым диапазоном до 7 цветов.

## Узкие места
- Из-за размера памяти и ее конфигурации, операция записи имеет латентность в 5 тактов, в то время как операция чтения - 1 такт.
- Низкого разрешения кадра хватает для экспериментальных целей и малых проектов, но обьективно мало для современной графики.
- Цветность изображения также обьективно мала.
- При наличии интерфейса выхода данных (VGA), отсутствует интерфейс входа. Из чего следует невозможность записи нового изображения после загрузки на ПЛИС.
- Модель однопортовой RAM, имитирующая работу графической памяти реальных видеоадаптеров, не в полной мере использует возможности блоков двухпортовой памяти внутри ПЛИС.

## Планы разработки.
- Реализация курсора-кисти, управляемого с кнопок платы OMDAZZ, способного закрашивать пиксели на экране. Также будет возможность менять размер кисти.

# Предполагаемый алгоритм работы с фреймбуфером
1. Открыть проект графического редактора в среде Visual Studio и запустить программу.
![2. Нарисовать желаемое изображение](/ToCE2020LABS/assets/1.png)
![3. Открыть раздел "Файл"](/ToCE2020LABS/assets/2.png)
![3.5 (по желанию)Сохранить изображение в разрешении 80x60, выбрав функцию "Save"](/ToCE2020LABS/assets/Smile80x60.tiff)
![4 Сохранить сжатое изображение в палитре "RGB-3bit", выбрав функцию "SaveRGB"](/ToCE2020LABS/assets/SmileRGB.tiff)
![5 Конвертировать изображение в текстовый hex-файл и сохранить, выбрав функцию "SaveTXT-s"](/ToCE2020LABS/assets/5.png)
![6 Переместить(если нужно) hex-файл в папку проекта фреймбуфера, затем открыть файл ROM-модуля "ROM.v". Далее нужно отредактировать одну из строчек 39-47, раскомментировав ее и заменив старое имя hex-файла на имя hex-файла вашего изображения](/ToCE2020LABS/assets/3.png)
7. Скомпиллировать проект и загрузить его на OMDAZZ, подключенный к монитору через VGA.
