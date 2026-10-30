local L = LibStub("AceLocale-3.0"):NewLocale("TidyPlatesThreat", "ruRU", false)
if not L then return end

----------------------
--[[ Commands.lua ]]--
----------------------

L["-->>|cffff0000DPS Plates Enabled|r<<--"] = "-->>|cffff0000Неймплейти ДПС увімкнено|r<<--"
L["|cff89F559Threat Plates|r: DPS switch detected, you are now in your |cff89F559"] = "|cff89F559Threat Plates|r: виявлено перемикання на ДПС, зараз ви в |cff89F559"
L["|r spec and are now in your |cffff0000dpsing / healing|r role."] = "|r спеціалізації та в ролі |cffff0000дпс / лікування|r."

L["-->>|cff00ff00Tank Plates Enabled|r<<--"] = "-->>|cff00ff00Неймплейти танка увімкнено|r<<--"
L["|cff89F559Threat Plates|r: Tank switch detected, you are now in your |cff89F559"] = "|cff89F559Threat Plates|r: виявлено перемикання на танка, зараз ви в |cff89F559"
L["|r spec and are now in your |cff00ff00tanking|r role."] = "|r спеціалізації та в ролі |cff00ff00танкування|r."

L["-->>Nameplate Overlapping is now |cff00ff00ON!|r<<--"] = "-->>Накладання неймплейтів зараз |cff00ff00УВІМКНЕНО!|r<<--"
L["-->>Nameplate Overlapping is now |cffff0000OFF!|r<<--"] = "-->>Накладання неймплейтів зараз |cffff0000ВИМКНЕНО!|r<<--"

L["-->>Threat Plates verbose is now |cff00ff00ON!|r<<--"] = "-->>Докладні повідомлення Threat Plates зараз |cff00ff00УВІМКНЕНО!|r<<--"
L["-->>Threat Plates verbose is now |cffff0000OFF!|r<<-- shhh!!"] = "-->>Докладні повідомлення Threat Plates зараз |cffff0000ВИМКНЕНО!|r<<-- тсс!!"

------------------------------
--[[ TidyPlatesThreat.lua ]]--
------------------------------

L["|cff00ff00tanking|r"] = "|cff00ff00танкування|r"
L["|cffff0000dpsing / healing|r"] = "|cffff0000дпс / лікування|r"

L["primary"] = "основній"
L["secondary"] = "другорядній"
L["unknown"] = "невідомій"
L["Undetermined"] = "Не визначено"

L["|cff89f559Welcome to |rTidy Plates: |cff89f559Threat Plates!\nThis is your first time using Threat Plates and you are a(n):\n|r|cff"] = "|cff89f559Вітаємо в |rTidy Plates: |cff89f559Threat Plates!\nВи вперше користуєтеся Threat Plates, і ви:\n|r|cff"

L["|cff89f559Your dual spec's have been set to |r"] = "|cff89f559Обидві ваші спеціалізації встановлено на роль |r"
L["|cff89f559You are currently in your "] = "|cff89f559Зараз ви в ролі "
L["|cff89f559 role.|r"] = "|cff89f559.|r"
L["|cff89f559Your role can not be determined.\nPlease set your dual spec preferences in the |rThreat Plates|cff89f559 options.|r"] = "|cff89f559Не вдалося визначити вашу роль.\nВкажіть спеціалізації в налаштуваннях |rThreat Plates|cff89f559.|r"
L["|cff89f559Additional options can be found by typing |r'/tptp'|cff89F559.|r"] = "|cff89f559Інші налаштування відкриваються командою |r'/tptp'|cff89F559.|r"
L[":\n----------\nWould you like to \nset your theme to |cff89F559Threat Plates|r?\n\nClicking '|cff00ff00Yes|r' will set you to Threat Plates & reload UI. \n Clicking '|cffff0000No|r' will open the Tidy Plates options."] = ":\n----------\nХочете \nвстановити тему |cff89F559Threat Plates|r?\n\n«|cff00ff00Так|r» встановить Threat Plates і перезавантажить інтерфейс. \n «|cffff0000Ні|r» відкриє налаштування Tidy Plates."

L["Yes"] = "Так"
L["Cancel"] = "Скасувати"
L["No"] = "Ні"

L["-->>|cffff0000Activate Threat Plates from the Tidy Plates options!|r<<--"] = "-->>|cffff0000Увімкніть Threat Plates у налаштуваннях Tidy Plates!|r<<--"
L["|cff89f559Threat Plates:|r Welcome back |cff"] = "|cff89f559Threat Plates:|r З поверненням, |cff"

L["|cff89F559Threat Plates|r: Player spec change detected: |cff"] = "|cff89F559Threat Plates|r: виявлено зміну спеціалізації: |cff"
L[")|r, you are now in your |cff89F559"] = ")|r, зараз ви в |cff89F559"
L["|r spec and are now in your "] = "|r спеціалізації та в ролі "
L[" role."] = "."

-- Creature names stay in Russian, since the addon matches them against the unit name.
L["Shadow Fiend"] = "Исчадье тьмы"
L["Spirit Wolf"] = "Дух волка"
L["Ebon Gargoyle"] = "Вороная горгулья"
L["Water Elemental"] = "Водный элементаль"
L["Treant"] = "Древень"
L["Viper"] = "Гадюка"
L["Venomous Snake"] = "Ядовитая змея"
L["Army of the Dead Ghoul"] = "Вурдалак из войска мертвых"
L["Shadowy Apparition"] = "Сумеречный призрак"
L["Shambling Horror"] = "Шаркающий ужас"
L["Web Wrap"] = "Кокон"
L["Immortal Guardian"] = "Бессмертный страж"
L["Marked Immortal Guardian"] = "Выбранный бессмертный страж"
L["Empowered Adherent"] = "Могущественный последователь"
L["Deformed Fanatic"] = "Кособокий фанатик"
L["Reanimated Adherent"] = "Воскрешенный последователь"
L["Reanimated Fanatic"] = "Воскрешенный фанатик"
L["Bone Spike"] = "Костяной шип"
L["Onyxian Whelp"] = "Дракончик Ониксии"
L["Gas Cloud"] = "Облако газа"
L["Volatile Ooze"] = "Неустойчивый слизнюк"
L["Darnavan"] = "Дарнаван"
L["Val'kyr Shadowguard"] = "Валь'кира - страж Тьмы"
L["Kinetic Bomb"] = "Кинетическая бомба"
L["Lich King"] = "Король-лич"
L["Raging Spirit"] = "Гневный дух"
L["Drudge Ghoul"] = "Вурдалак-приспешник"
L["Living Inferno"] = "Живое адское пламя"
L["Living Ember"] = "Живой огонь"
L["Fanged Pit Viper"] = "Клыкастая глубинная гадюка"
L["Canal Crab"] = "Сточный краб"
L["Muddy Crawfish"] = "Ильный рак"

---------------------
--[[ Options.lua ]]--
---------------------

L["None"] = "Немає"
L["Outline"] = "Контур"
L["Thick Outline"] = "Товстий контур"
L["No Outline, Monochrome"] = "Без контуру, монохромний"
L["Outline, Monochrome"] = "Контур, монохромний"
L["Thick Outline, Monochrome"] = "Товстий контур, монохромний"

L["White List"] = "Білий список"
L["Black List"] = "Чорний список"
L["White List (Mine)"] = "Білий список (мої)"
L["Black List (Mine)"] = "Чорний список (мої)"
L["All Debuffs"] = "Усі дебафи"
L["All Debuffs (Mine)"] = "Усі дебафи (мої)"
L["By Prefix"] = "За префіксом"

-- Tab Titles
L["Nameplate Settings"] = "Налаштування неймплейтів"
L["Threat System"] = "Система загрози"
L["Widgets"] = "Віджети"
L["Totem Nameplates"] = "Неймплейти тотемів"
L["Custom Nameplates"] = "Власні неймплейти"
L["About"] = "Про аддон"

------------------------
-- Nameplate Settings --
------------------------
L["General Settings"] = "Загальні налаштування"
L["Hiding"] = "Приховування"
L["Show Neutral"] = "Показувати нейтральних"
L["Show Normal"] = "Показувати звичайних"
L["Show Elite"] = "Показувати елітних"
L["Show Boss"] = "Показувати босів"

L["Blizzard Settings"] = "Налаштування Blizzard"
L["Open Blizzard Settings"] = "Відкрити налаштування Blizzard"

L["Friendly"] = "Дружні"
L["Show Friends"] = "Показувати дружніх"
L["Show Friendly Totems"] = "Показувати дружні тотеми"
L["Show Friendly Pets"] = "Показувати дружніх улюбленців"
L["Show Friendly Guardians"] = "Показувати дружніх стражів"

L["Enemy"] = "Вороги"
L["Show Enemies"] = "Показувати ворогів"
L["Show Enemy Totems"] = "Показувати ворожі тотеми"
L["Show Enemy Pets"] = "Показувати ворожих улюбленців"
L["Show Enemy Guardians"] = "Показувати ворожих стражів"

----
L["Healthbar"] = "Смужка здоров'я"
L["Textures"] = "Текстури"
L["Show Border"] = "Показувати рамку"
L["Normal Border"] = "Звичайна рамка"
L["Show Elite Border"] = "Показувати рамку еліти"
L["Elite Border"] = "Рамка еліти"
L["Mouseover"] = "Наведення"
L["Target"] = "Ціль"
L["Width"] = "Ширина"
L["Height"] = "Висота"
----
L["Placement"] = "Розташування"
L["Changing these settings will alter the placement of the nameplates, however the mouseover area does not follow. |cffff0000Use with caution!|r"] = "Ці налаштування змінюють розташування неймплейтів, але зона наведення миші за ними не переміщується. |cffff0000Обережно!|r"
L["Offset X"] = "Зсув по X"
L["Offset Y"] = "Зсув по Y"
L["X"] = "X"
L["Y"] = "Y"
L["Anchor"] = "Прив'язка"
----
L["Coloring"] = "Забарвлення"
L["Enable Coloring"] = "Увімкнути забарвлення"
L["Color HP by amount"] = "Колір за кількістю здоров'я"
L["Changes the HP color depending on the amount of HP the nameplate shows."] = "Змінює колір смужки здоров'я залежно від його кількості."
----
L["Class Coloring"] = "Кольори класів"
L["Enemy Class Colors"] = "Кольори класів ворогів"
L["Enable Enemy Class colors"] = "Увімкнути кольори класів ворогів"
L["Friendly Class Colors"] = "Кольори класів союзників"
L["Enable Friendly Class Colors"] = "Увімкнути кольори класів союзників"
L["Enable the showing of friendly player class color on hp bars."] = "Показує колір класу на смужках здоров'я дружніх гравців."
L["Friendly Caching"] = "Запам'ятовувати класи союзників"
L["This allows you to save friendly player class information between play sessions or nameplates going off the screen.|cffff0000(Uses more memory)"] = "Зберігає клас дружніх гравців між сеансами гри та після зникнення неймплейта з екрана.|cffff0000(Використовує більше пам'яті)"
L["Name Only"] = "Лише ім'я"
L["Show only names above friendly units."] = "Над дружніми цілями показувати лише ім'я."
L["Click Through"] = "Кліки навскрізь"
----
L["Custom HP Color"] = "Власний колір здоров'я"
L["Enable Custom HP colors"] = "Увімкнути власні кольори"
L["Friendly Color"] = "Колір дружніх"
L["Neutral Color"] = "Колір нейтральних"
L["Enemy Color"] = "Колір ворогів"
----
L["Raid Mark HP Color"] = "Колір рейдових міток"
L["Enable Raid Marked HP colors"] = "Увімкнути кольори рейдових міток"
L["Colors"] = "Кольори"
----
L["Threat Colors"] = "Кольори загрози"
L["Show Threat Glow"] = "Показувати світіння загрози"
L["|cff00ff00Low threat|r"] = "|cff00ff00Низька загроза|r"
L["|cffffff00Medium threat|r"] = "|cffffff00Середня загроза|r"
L["|cffff0000High threat|r"] = "|cffff0000Висока загроза|r"
L["|cffff0000Low threat|r"] = "|cffff0000Низька загроза|r"
L["|cff00ff00High threat|r"] = "|cff00ff00Висока загроза|r"
L["Low Threat"] = "Низька загроза"
L["Medium Threat"] = "Середня загроза"
L["High Threat"] = "Висока загроза"

----
L["Castbar"] = "Смужка вимови"
L["Enable"] = "Увімкнути"
L["Non-Target Castbars"] = "Смужки вимови поза ціллю"
L["This allows the castbar to attempt to create a castbar on nameplates of players or creatures you have recently moused over."] = "Намагається показати смужку вимови на неймплейтах гравців і істот, на яких ви нещодавно наводили курсор."
L["Interruptable Casts"] = "Заклинання, які можна перервати"
L["Shielded Coloring"] = "Колір захищених"
L["Uninterruptable Casts"] = "Заклинання, які не можна перервати"

----
L["Alpha"] = "Прозорість"
L["Blizzard Target Fading"] = "Згасання нецільових"
L["Enable Blizzard 'On-Target' Fading"] = "Увімкнути згасання нецільових неймплейтів"
L["Enabling this will allow you to set the alpha adjustment for non-target nameplates."] = "Дозволяє задати прозорість неймплейтів, які не є вашою ціллю."
L["Non-target fading is handled by the NamePlates API (nameplateNonTargetAlpha), so this setting is ignored while it is enabled."] = "Прозорістю нецільових неймплейтів керує NamePlates API (nameplateNonTargetAlpha), тому це налаштування не діє, поки його ввімкнено."
L["Non-Target Alpha"] = "Прозорість поза ціллю"
L["Alpha Settings"] = "Налаштування прозорості"

----
L["Scale"] = "Масштаб"
L["Scale Settings"] = "Налаштування масштабу"

----
L["Name Text"] = "Текст імені"
L["Enable Name Text"] = "Увімкнути текст імені"
L["Enables the showing of text on nameplates."] = "Показує текст на неймплейтах."
L["Options"] = "Параметри"
L["Font"] = "Шрифт"
L["Font Style"] = "Стиль шрифту"
L["Set the outlining style of the text."] = "Задає стиль контуру тексту."
L["Enable Shadow"] = "Увімкнути тінь"
L["Color"] = "Колір"
L["Text Bounds and Sizing"] = "Межі та розмір тексту"
L["Font Size"] = "Розмір шрифту"
L["Text Boundaries"] = "Межі тексту"
L["These settings will define the space that text can be placed on the nameplate.\nHaving too large a font and not enough height will cause the text to be not visible."] = "Ці налаштування задають простір, у якому розміщується текст на неймплейті.\nНадто великий шрифт за недостатньої висоти робить текст невидимим."
L["Text Width"] = "Ширина тексту"
L["Text Height"] = "Висота тексту"
L["Horizontal Align"] = "Вирівнювання по горизонталі"
L["Vertical Align"] = "Вирівнювання по вертикалі"

----
L["Health Text"] = "Текст здоров'я"
L["Enable Health Text"] = "Увімкнути текст здоров'я"
L["Display Settings"] = "Налаштування показу"
L["Text at Full HP"] = "Текст при повному здоров'ї"
L["Display health text on targets with full HP."] = "Показує текст здоров'я для цілей із повним запасом здоров'я."
L["Percent Text"] = "Відсотки"
L["Display health percentage text."] = "Показує здоров'я у відсотках."
L["Amount Text"] = "Кількість"
L["Display health amount text."] = "Показує кількість здоров'я."
L["Amount Text Formatting"] = "Формат кількості"
L["Truncate Text"] = "Скорочувати"
L["This will format text to a simpler format using M or K for millions and thousands. Disabling this will show exact HP amounts."] = "Скорочує числа: M для мільйонів і K для тисяч. Якщо вимкнути, показується точна кількість здоров'я."
L["Max HP Text"] = "Максимальне здоров'я"
L["This will format text to show both the maximum hp and current hp."] = "Показує і поточне, і максимальне здоров'я."
L["Deficit Text"] = "Втрачене здоров'я"
L["This will format text to show hp as a value the target is missing."] = "Показує, скільки здоров'я цілі бракує."

----
L["Spell Text"] = "Текст заклинання"
L["Enable Spell Text"] = "Увімкнути текст заклинання"

----
L["Level Text"] = "Текст рівня"
L["Enable Level Text"] = "Увімкнути текст рівня"

----
L["Elite Icon"] = "Значок еліти"
L["Enable Elite Icon"] = "Увімкнути значок еліти"
L["Enables the showing of the elite icon on nameplates."] = "Показує значок еліти на неймплейтах."
L["Texture"] = "Текстура"
L["Preview"] = "Попередній перегляд"
L["Elite Icon Style"] = "Стиль значка еліти"
L["Size"] = "Розмір"

----
L["Skull Icon"] = "Значок черепа"
L["Enable Skull Icon"] = "Увімкнути значок черепа"
L["Enables the showing of the skull icon on nameplates."] = "Показує значок черепа на неймплейтах."

----
L["Spell Icon"] = "Значок заклинання"
L["Enable Spell Icon"] = "Увімкнути значок заклинання"
L["Enables the showing of the spell icon on nameplates."] = "Показує значок заклинання на неймплейтах."

----
L["Raid Marks"] = "Рейдові мітки"
L["Enable Raid Mark Icon"] = "Увімкнути значок рейдової мітки"
L["Enables the showing of the raid mark icon on nameplates."] = "Показує рейдові мітки на неймплейтах."

-------------------
-- Threat System --
-------------------

L["Enable Threat System"] = "Увімкнути систему загрози"

----
L["Additional Toggles"] = "Додаткові перемикачі"
L["Ignore Non-Combat Threat"] = "Ігнорувати загрозу поза боєм"
L["Disables threat feedback from mobs you're currently not in combat with."] = "Вимикає індикацію загрози від істот, з якими ви не в бою."
L["Show Neutral Threat"] = "Загроза від нейтральних"
L["Disables threat feedback from neutral mobs regardless of boss or elite levels."] = "Вимикає індикацію загрози від нейтральних істот, зокрема босів і еліти."
L["Show Normal Threat"] = "Загроза від звичайних"
L["Disables threat feedback from normal mobs."] = "Вимикає індикацію загрози від звичайних істот."
L["Show Elite Threat"] = "Загроза від еліти"
L["Disables threat feedback from elite mobs."] = "Вимикає індикацію загрози від елітних істот."
L["Show Boss Threat"] = "Загроза від босів"
L["Disables threat feedback from boss level mobs."] = "Вимикає індикацію загрози від босів."

----
L["Set alpha settings for different threat reaction types."] = "Налаштування прозорості для різних рівнів загрози."
L["Enable Alpha Threat"] = "Прозорість від загрози"
L["Enable nameplates to change alpha depending on the levels you set below."] = "Неймплейти змінюють прозорість відповідно до рівнів, заданих нижче."
L["|cff00ff00Tank|r"] = "|cff00ff00Танк|r"
L["|cffff0000DPS/Healing|r"] = "|cffff0000ДПС/Лікування|r"
----
L["Marked Targets"] = "Позначені цілі"
L["Ignore Marked Targets"] = "Ігнорувати позначені цілі"
L["This will allow you to disabled threat alpha changes on marked targets."] = "Вимикає зміну прозорості від загрози для цілей із рейдовою міткою."
L["Ignored Alpha"] = "Прозорість ігнорованих"

----
L["Set scale settings for different threat reaction types."] = "Налаштування масштабу для різних рівнів загрози."
L["Enable Scale Threat"] = "Масштаб від загрози"
L["Enable nameplates to change scale depending on the levels you set below."] = "Неймплейти змінюють масштаб відповідно до рівнів загрози, заданих нижче."
L["This will allow you to disabled threat scale changes on marked targets."] = "Вимикає зміну масштабу від загрози для позначених цілей."
L["Ignored Scaling"] = "Масштаб ігнорованих"
----
L["Additional Adjustments"] = "Додаткові поправки"
L["Enable Adjustments"] = "Увімкнути поправки"
L["This will allow you to add additional scaling changes to specific mob types."] = "Додає окремі зміни масштабу для певних типів істот."

----
L["Toggles"] = "Перемикачі"
L["Color HP by Threat"] = "Колір здоров'я за загрозою"
L["This allows HP color to be the same as the threat colors you set below."] = "Робить колір смужки здоров'я таким самим, як кольори загрози, задані нижче."

----
L["Dual Spec Roles"] = "Ролі двох спеціалізацій"
L["Set the role your primary and secondary spec represent."] = "Задає роль основної та другорядної спеціалізації."
L["Primary Spec"] = "Основна спеціалізація"
L["Sets your primary spec to tanking."] = "Основна спеціалізація — танкування."
L["Sets your primary spec to DPS."] = "Основна спеціалізація — ДПС."
L["Secondary Spec"] = "Другорядна спеціалізація"
L["Sets your secondary spec to tanking."] = "Другорядна спеціалізація — танкування."
L["Sets your secondary spec to DPS."] = "Другорядна спеціалізація — ДПС."

----
L["Set threat textures and their coloring options here."] = "Тут задаються текстури загрози та їхні кольори."
L["These options are for the textures shown on nameplates at various threat levels."] = "Ці параметри задають текстури на неймплейтах для різних рівнів загрози."
----
L["Art Options"] = "Графіка"
L["Style"] = "Стиль"
L["This will allow you to disabled threat art on marked targets."] = "Вимикає графіку загрози на позначених цілях."

-------------
-- Widgets --
-------------

L["Class Icons"] = "Значки класів"
L["This widget will display class icons on nameplate with the settings you set below."] = "Цей віджет показує значки класів на неймплейтах із параметрами, заданими нижче."
L["Enable Friendly Icons"] = "Увімкнути значки союзників"
L["Enable the showing of friendly player class icons."] = "Показує значки класів дружніх гравців."

----
L["Combo Points"] = "Прийоми в серії"
L["This widget will display combo points on your target nameplate."] = "Цей віджет показує прийоми в серії на неймплейті вашої цілі."

----
L["Debuffs"] = "Дебафи"
L["This widget will display debuffs that match your filtering on your target nameplate and others you recently moused over."] = "Цей віджет показує дебафи, що відповідають вашим фільтрам, на неймплейті цілі та на тих, на кого ви нещодавно наводили курсор."
L["Sizing"] = "Розмір"
L["Filtering"] = "Фільтрування"
L["Mode"] = "Режим"
L["Filtered Debuffs"] = "Відфільтровані дебафи"

----
L["Social Widget"] = "Соціальний віджет"
L["Enables the showing if indicator icons for friends, guildmates, and BNET Friends"] = "Показує значки для друзів, соратників по гільдії та друзів Battle.net"

----
L["Threat Line"] = "Смужка загрози"
L["This widget will display a small bar that will display your current threat relative to other players on your target nameplate or recently mousedover namplates."] = "Цей віджет показує невелику смужку вашої загрози відносно інших гравців на неймплейті цілі або нещодавно наведеного неймплейта."

----
L["Tanked Targets"] = "Затанковані цілі"
L["This widget will display a small shield or dagger that will indicate if the nameplate is currently being tanked. |cffff00ffRequires tanking role.|r"] = "Цей віджет показує маленький щит або кинджал, якщо когось зараз танкує. |cffff00ffПотрібна роль танка.|r"

----
L["Target Highlight"] = "Підсвічування цілі"
L["Enables the showing of a texture on your target nameplate"] = "Показує текстуру на неймплейті вашої цілі"
L["Invert Texture"] = "Інвертувати текстуру"

----------------------
-- Totem Nameplates --
----------------------

L["|cffffffffTotem Settings|r"] = "|cffffffffНалаштування тотемів|r"
L["Toggling"] = "Перемикачі"
L["Hide Healthbars"] = "Сховати смужки здоров'я"
----
L["Icon"] = "Значок"
L["Icon Size"] = "Розмір значка"
L["Totem Alpha"] = "Прозорість тотема"
L["Totem Scale"] = "Масштаб тотема"
----
L["Show Nameplate"] = "Показувати неймплейт"
----
L["Health Coloring"] = "Колір здоров'я"
L["Enable Custom Colors"] = "Увімкнути власні кольори"

-----------------------
-- Custom Nameplates --
-----------------------

L["|cffffffffGeneral Settings|r"] = "|cffffffffЗагальні налаштування|r"
L["Disabling this will turn off any all icons without harming custom settings per nameplate."] = "Вимикає всі значки, не зачіпаючи власні налаштування окремих неймплейтів."
----
L["Set Name"] = "Задати ім'я"
L["Use Target's Name"] = "Взяти ім'я цілі"
L["No target found."] = "Ціль не знайдено."
L["Clear"] = "Очистити"
L["Copy"] = "Копіювати"
L["Copied!"] = "Скопійовано!"
L["Paste"] = "Вставити"
L["Pasted!"] = "Вставлено!"
L["Nothing to paste!"] = "Нічого вставляти!"
L["Restore Defaults"] = "Відновити стандартні"
----
L["Use Custom Settings"] = "Використовувати власні налаштування"
L["Custom Settings"] = "Власні налаштування"
----
L["Disable Custom Alpha"] = "Вимкнути власну прозорість"
L["Disables the custom alpha setting for this nameplate and instead uses your normal alpha settings."] = "Вимикає власну прозорість цього неймплейта і використовує звичайні налаштування прозорості."
L["Custom Alpha"] = "Власна прозорість"
----
L["Disable Custom Scale"] = "Вимкнути власний масштаб"
L["Disables the custom scale setting for this nameplate and instead uses your normal scale settings."] = "Вимикає власний масштаб цього неймплейта і використовує звичайні налаштування масштабу."
L["Custom Scale"] = "Власний масштаб"
----
L["Allow Marked HP Coloring"] = "Дозволити колір мічених цілей"
L["Allow raid marked hp color settings instead of a custom hp setting if the nameplate has a raid mark."] = "Для неймплейта з рейдовою міткою використовує колір мітки замість власного кольору здоров'я."

----
L["Enable the showing of the custom nameplate icon for this nameplate."] = "Показує власний значок для цього неймплейта."
L["Type direct icon texture path using '\\' to separate directory folders, or use a spellid."] = "Вкажіть прямий шлях до текстури значка, розділяючи теки через «\\», або вкажіть spellid."
L["Set Icon"] = "Встановити значок"

-----------
-- About --
-----------

L["\n\nThank you for supporting my work!\n"] = "\n\nДякую за підтримку моєї роботи!\n"
L["Click to Donate!"] = "Підтримати автора!"
L["Clear and easy to use nameplate theme for use with TidyPlates.\n\nFeel free to email me at |cff00ff00bkader@mail.com|r"] = "Зрозуміла й проста тема неймплейтів для TidyPlates.\n\nПишіть мені на |cff00ff00bkader@mail.com|r"

--------------------------------
-- Default Game Options Frame --
--------------------------------

L["You can access the "] = "Налаштування "
L[" options by typing: /tptp"] = " відкриваються командою: /tptp"
L["Open Config"] = "Відкрити налаштування"

------------------------
-- Additional Stances --
------------------------
L["Presences"] = "Присутності"
L["Shapeshifts"] = "Форми"
L["Auras"] = "Аури"
L["Stances"] = "Стійки"
