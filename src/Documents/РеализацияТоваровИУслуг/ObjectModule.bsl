
#Область ОбработчикиФормы

Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	
	Если ОбменДанными.Загрузка Тогда
		Возврат
	КонецЕсли;
		
	СуммаДокумента = Товары.Итог("Сумма");
КонецПроцедуры

Процедура ОбработкаЗаполнения(ДанныеЗаполнения, СтандартнаяОбработка)
	
	Если ТипЗнч(ДанныеЗаполнения) = Тип("СправочникСсылка.Контрагенты") Тогда
		// Заполнение шапки
		Контрагент = ДанныеЗаполнения.Ссылка;
		КонтактноеЛицо = ПолучитьПоследнийДокумент(Контрагент);
	КонецЕсли;

КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Функция ПолучитьПоследнийДокумент(НашКонтрагент)

	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ ПЕРВЫЕ 1
		|	РеализацияТоваровИУслуг.КонтактноеЛицо КАК КонтактноеЛицо
		|ИЗ
		|	Документ.РеализацияТоваровИУслуг КАК РеализацияТоваровИУслуг
		|ГДЕ
		|	РеализацияТоваровИУслуг.Контрагент = &Контрагент
		|	И РеализацияТоваровИУслуг.Проведен = ИСТИНА
		|
		|УПОРЯДОЧИТЬ ПО
		|	РеализацияТоваровИУслуг.Дата УБЫВ";
	
	Запрос.УстановитьПараметр("Контрагент", НашКонтрагент);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();
	
	Пока Выборка.Следующий() Цикл
		Возврат Выборка.КонтактноеЛицо;
	КонецЦикла;	
	
КонецФункции

#КонецОбласти