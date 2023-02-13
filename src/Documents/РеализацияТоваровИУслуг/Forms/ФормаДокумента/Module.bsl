
#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ОрганизацияОбработкаВыбора(Элемент, ВыбранноеЗначение, СтандартнаяОбработка)
		
	УчётСкладаВедётся = РаботаСДокументамиКлиент.ВедётЛиОрганизацияУчётСклада(ВыбранноеЗначение);
	
	Элементы.ТоварыСклад.Видимость = ?(УчётСкладаВедётся, Истина, Ложь);
		
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыНоменклатураОбработкаВыбора(Элемент, ВыбранноеЗначение, СтандартнаяОбработка)
	
	ТекДанные = Элементы.Товары.ТекущиеДанные;
	
	ДанныеНоменклатуры = ПолучитьДанныеНоменклатуры(ВыбранноеЗначение, Объект.ТипПрайсЛиста);
	
	ТекДанные.Цена 		  = ДанныеНоменклатуры.Цена;
	ТекДанные.ЕдИзмерения = ДанныеНоменклатуры.ЕдИзмеренеия;
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)      
	
	ТекДанные 		= Элементы.Товары.ТекущиеДанные;	
	ТекДанные.Сумма = ТекДанные.Количество * ТекДанные.Цена;

КонецПроцедуры

&НаКлиенте
Процедура ТоварыБракПриИзменении(Элемент)
	
    ТекДанные = Элементы.Товары.ТекущиеДанные; 
	
	Элементы.ТоварыСтепеньБрака.Доступность = ТекДанные.Брак;
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервереБезКонтекста
Функция ПолучитьДанныеНоменклатуры(Номенклатура, ТипПрайсЛиста)
	Возврат РаботаСДокументамиСервер.ПолучитьДанныеНоменклатуры(Номенклатура, ТипПрайсЛиста);	
КонецФункции

#КонецОбласти
