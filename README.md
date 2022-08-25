# VGA-Framebuffer(v. 2.0)
ФБ с кистью для рисования

Реализован на плате OMDAZZ с чипом Cyclone IV E: EP4CE10E22C8

# Содержание
[- Краткое описание папок](#краткое-описание-папок)

[- Описание дизайна](#описание-дизайна)

[- Предполагаемый алгоритм работы с фреймбуфером](#предполагаемый-алгоритм-работы-с-фреймбуфером)

# Краткое описание папок
- assets - файлы изображений для данного руководства
- bitstreams - набор готовых програмных файлов для загрузки на ПЛИС.
	- FrameBuffer_with_Brush.sof - текущий дизайн
- modelsim - папка проектов ModelSim для отладки дизайна
	- Brush_TB.mpf - проект отладочной симуляции работы кисти (только спрайт, без записи в память)
	- DEBOUNCER.mpf - проект отладочной симуляции модуля антидребезга кнопок
	- FIFO_Test.mpf - проект отладочной симуляции работы ФИФО
	- MEM_Tb.mpf - проект отладочной симуляции работы модуля памяти
	- MEM-BRUSH.mpf - проект отладочной симуляции работы кисти с памятью
	- TOP_Tb.mpf - проект отладочной симуляции всего фреймбуфера
- quartus - рабочая папка проекта Quartus
- src - папки с файлами-исходниками 
	- brush - папка с файлами кисти
	- debouncer - папка с файлами модуля антидребезга
	- fifo - папка с файлами ФИФО
	- memory - папка с файлами модуля памяти
	- memsyncreset - папка с файлом модуля синхронного сброса памяти
	- pll - папка с файлами IP-модуля ФАПЧ
	- rom - папка с файлами модуля ROM
	- top - папка с файлами верхних модулей проекта
	- vga - папка с файлом модуля VGA
# Описание дизайна
Проект по рисованию на экране с помощью кисти. По сути, является демонстрацией использования фреймбуфера в составе большего проекта. Кисть представляет собой квадратный спрайт определенного цвета(в диапазоне 3bit-RGB. Спрайт может перемещаться по всему экрану и раскрашивать область под собой. Размер спрайта(а точнее половина длины стороны квадрата) можно менять. Управление осуществляется с кнопок на плате:
![](/../ToCE2020LABS-2/assets/1.png)

Кнопка 4 - закрасить, кнопка 3 - режим перемещения, кнопка 2 - перемещение вверх/вниз, кнопка 1 - перемещение влево/вправо. Кнопка 3 меняет направление перемещения на кнопках 2 и 1. Нажатие кнопки 4, одновременно удерживая кнопку 3, циклически изменяет размер кисти.

RTL-схема верхнего уровня
![](/../ToCE2020LABS-2/assets/2.png)

## Особенности
- Разрешение данной версии кадрового буфера фиксированно и составляет 80x60.
- Разрешение экрана (пока) также фиксированно как 640x480.
- Область движения кисти ограничена рамками экрана
- В данной конфигурации, размер кисти(половина длины ее стороны) может меняться от 10 до 30 пикселей.
- Кисть способна раскрашивать во время перемещения

## Узкие места
- Из-за ограничений периферии на плате OMDAZZ, отсутствует возможность менять цвет кисти во время работы. Поменять цвет возможно только изменив параметр в verilog-коде.
- Изменение размера кисти с помощью комбинации двух уже задействованных кнопок ненадежно. Во время изменения размера кисти, она закрашивает область под собой.
- При изменении размера кисти на границе холста, кисть пропадает с экрана. Это связано с несовершенством механизма ограничения движения кисти на границах.
- Механизм сброса не совершенен. Он способен вернуть курсор в центр экрана, но не способен очистить холст. Причина неизвестна. 
