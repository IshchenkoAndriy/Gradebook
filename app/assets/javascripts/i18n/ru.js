var I18n = I18n || {};
I18n.translations = {"ru":{"active_admin":{"dashboard":"Dashboard","dashboard_welcome":{"welcome":"Добро пожаловать в Active Admin. Это стандартная страница управления сайтом.","call_to_action":"Чтобы добавить сюда что-нибудь загляните в 'app/admin/dashboards.rb'"},"view":"Открыть","edit":"Изменить","delete":"Удалить","delete_confirmation":"Вы уверены, что хотите удалить это?","new_model":"Создать %{model}","create_model":"Создать %{model}","edit_model":"Изменить %{model}","update_model":"Изменить %{model}","delete_model":"Удалить %{model}","details":"%{model} подробнее","cancel":"Отмена","empty":"Пусто","previous":"Пред.","next":"След.","download":"Загрузка:","has_many_new":"Добавить %{model}","has_many_delete":"Удалить","filter":"Фильтровать","clear_filters":"Очистить","search_field":"Искать по %{field}","equal_to":"=","greater_than":"больше","less_than":"меньше","main_content":"Создайте %{model}#main_content для отображения содержимого.","logout":"Выйти","powered_by":"Powered by %{active_admin} %{version}","sidebars":{"filters":"Фильтры"},"pagination":{"empty":"%{model} не найдено","one":"Результат: <b>1</b> %{model}","one_page":"Результат: <b>%{n}</b> %{model}","multiple":"Результат: %{model} <b>%{from}&nbsp;-&nbsp;%{to}</b> из <b>%{total}</b>","entry":{"one":"запись","other":"записей"}},"any":"Любой","blank_slate":{"content":"Пока нет %{resource_name}.","link":"Создать"},"batch_actions":{"button_label":"Групповые операции","delete_confirmation":"Вы уверены, что хотите удалить %{plural_model}? Вы не сможете это отменить.","succesfully_destroyed":{"one":"Успешно удалено: 1 %{model}","other":"Успешно удалено: %{count} %{plural_model}"},"selection_toggle_explanation":"(Отметить всё / Снять выделение)","link":"Создать","action_label":"%{title} выбранное","labels":{"destroy":"Удалить"}},"comments":{"body":"Текст","author":"Автор","title":"Комментарий","add":"Добавить Комментарий","resource":"Ресурс","no_comments_yet":"Пока нет комментариев.","title_content":"Комментарии (%{count})","errors":{"empty_text":"Комментарий не сохранен, текст не должен быть пустым."}},"devise":{"login":{"title":"Войти","remember_me":"Запомнить меня","submit":"Войти"},"reset_password":{"title":"Забыли пароль?","submit":"Сбросить пароль"},"change_password":{"title":"Изменение пароля","submit":"Изменение пароля"},"links":{"sign_in":"Войти","forgot_your_password":"Забыли пароль?"}}},"errors":{"messages":{"expired":"устарела. Пожалуйста, запросите новую","not_found":"не найдена","already_confirmed":"уже подтверждена. Пожалуйста, попробуйте войти в систему","not_locked":"не заблокирована","not_saved":{"one":"%{resource}: сохранение не удалось из-за %{count} ошибки","few":"%{resource}: сохранение не удалось из-за %{count} ошибок","many":"%{resource}: сохранение не удалось из-за %{count} ошибок","other":"%{resource}: сохранение не удалось из-за %{count} ошибки"},"inclusion":"имеет непредусмотренное значение","exclusion":"имеет зарезервированное значение","invalid":"имеет неверное значение","confirmation":"не совпадает с подтверждением","accepted":"нужно подтвердить","empty":"не может быть пустым","blank":"не может быть пустым","too_long":{"one":"слишком большой длины (не может быть больше чем %{count} символ)","few":"слишком большой длины (не может быть больше чем %{count} символа)","many":"слишком большой длины (не может быть больше чем %{count} символов)","other":"слишком большой длины (не может быть больше чем %{count} символа)"},"too_short":{"one":"недостаточной длины (не может быть меньше %{count} символа)","few":"недостаточной длины (не может быть меньше %{count} символов)","many":"недостаточной длины (не может быть меньше %{count} символов)","other":"недостаточной длины (не может быть меньше %{count} символа)"},"wrong_length":{"one":"неверной длины (может быть длиной ровно %{count} символ)","few":"неверной длины (может быть длиной ровно %{count} символа)","many":"неверной длины (может быть длиной ровно %{count} символов)","other":"неверной длины (может быть длиной ровно %{count} символа)"},"taken":"уже существует","not_a_number":"не является числом","not_an_integer":"не является целым числом","greater_than":"может иметь значение большее %{count}","greater_than_or_equal_to":"может иметь значение большее или равное %{count}","equal_to":"может иметь лишь значение, равное %{count}","less_than":"может иметь значение меньшее чем %{count}","less_than_or_equal_to":"может иметь значение меньшее или равное %{count}","odd":"может иметь лишь четное значение","even":"может иметь лишь нечетное значение","record_invalid":"Возникли ошибки: %{errors}"},"format":"%{attribute} %{message}"},"devise":{"failure":{"already_authenticated":"Вы уже вошли в систему.","unauthenticated":"Вам необходимо войти в систему или зарегистрироваться.","unconfirmed":"Вы должны подтвердить вашу учётную запись.","locked":"Ваша учётная запись заблокирована.","invalid":"Неверный адрес e-mail или пароль.","invalid_token":"Неверный ключ аутентификации.","timeout":"Ваш сеанс закончился. Пожалуйста, войдите в систему снова.","inactive":"Ваша учётная запись ещё не активирована.","user":{"not_found_in_database":"Неверный адрес e-mail или пароль."},"admin_user":{"not_found_in_database":"Неверный адрес e-mail или пароль."}},"sessions":{"signed_in":"Вход в систему выполнен.","signed_out":"Выход из системы выполнен."},"passwords":{"send_instructions":"В течение нескольких минут вы получите письмо с инструкциями по восстановлению вашего пароля.","updated":"Ваш пароль изменён. Теперь вы вошли в систему.","updated_not_active":"Ваш пароль изменен.","send_paranoid_instructions":"Если ваш адрес e-mail есть в нашей базе данных, то в течение нескольких минут вы получите письмо с инструкциями по восстановлению вашего пароля."},"confirmations":{"send_instructions":"В течение нескольких минут вы получите письмо с инструкциями по подтверждению вашей учётной записи.","send_paranoid_instructions":"Если ваш адрес e-mail есть в нашей базе данных, то в течение нескольких минут вы получите письмо с инструкциями по подтверждению вашей учётной записи.","confirmed":"Ваша учётная запись подтверждена. Теперь вы вошли в систему."},"registrations":{"signed_up":"Добро пожаловать! Вы успешно зарегистрировались.","inactive_signed_up":"Добро пожаловать! Вы успешно зарегистрировались. Но пока вы не можете войти в систему, т.к. ваша учётная запись %{reason}.","updated":"Ваша учётная запись изменена.","destroyed":"До свидания! Ваша учётная запись удалена. Надеемся снова увидеть вас.","reasons":{"inactive":"неактивна","unconfirmed":"не подтверждена","locked":"заблокирована"}},"unlocks":{"send_instructions":"В течение нескольких минут вы получите письмо с инструкциями по разблокировке вашей учётной записи.","unlocked":"Ваша учётная запись разблокирована. Теперь вы вошли в систему.","send_paranoid_instructions":"Если ваша учётная запись существует, то в течение нескольких минут вы получите письмо с инструкциями по её разблокировке."},"omniauth_callbacks":{"success":"Вход в систему выполнен с учётной записью из %{kind}.","failure":"Вы не можете войти в систему с учётной записью из %{kind}, т.к. \"%{reason}\"."},"mailer":{"confirmation_instructions":{"subject":"Инструкции по подтверждению учётной записи"},"reset_password_instructions":{"subject":"Инструкции по восстановлению пароля"},"unlock_instructions":{"subject":"Инструкции по разблокировке учётной записи"}},"back":"Назад","forgot_pass":{"title":"Забыли пароль?","submit":"Пришлите мне указания для сброса пароля"},"change_pass":{"title":"Изменение пароля","new_pass":"Новый пароль","confirm_pass":"Подтвердите новый пароль","submit":"Изменить пароль"},"edit":{"title":"Редактировать","pass_hint":"оставьте это поле пустым, если вы не хотите изменять пароль","current_pass_hint":"нам необходима ваш текущий пароль для подтверждения изменений","submit":"Обновить","cancel_acc":"Отменить регистрацию","unhappy":"Недовольны?","destroy_confirm":"Вы уверены?"}},"unauthorized":{"default":"Вы не авторизованы для доступа к этой странице."},"date":{"formats":{"default":"%d.%m.%Y","short":"%d %b","long":"%d %B %Y"},"day_names":["воскресенье","понедельник","вторник","среда","четверг","пятница","суббота"],"standalone_day_names":["Воскресенье","Понедельник","Вторник","Среда","Четверг","Пятница","Суббота"],"abbr_day_names":["Вс","Пн","Вт","Ср","Чт","Пт","Сб"],"month_names":[null,"января","февраля","марта","апреля","мая","июня","июля","августа","сентября","октября","ноября","декабря"],"standalone_month_names":[null,"Январь","Февраль","Март","Апрель","Май","Июнь","Июль","Август","Сентябрь","Октябрь","Ноябрь","Декабрь"],"abbr_month_names":[null,"янв.","февр.","марта","апр.","мая","июня","июля","авг.","сент.","окт.","нояб.","дек."],"standalone_abbr_month_names":[null,"янв.","февр.","март","апр.","май","июнь","июль","авг.","сент.","окт.","нояб.","дек."],"order":["day","month","year"]},"time":{"formats":{"default":"%a, %d %b %Y, %H:%M:%S %z","short":"%d %b, %H:%M","long":"%d %B %Y, %H:%M"},"am":"утра","pm":"вечера"},"number":{"format":{"separator":".","delimiter":" ","precision":3,"significant":false,"strip_insignificant_zeros":false},"currency":{"format":{"format":"%n %u","unit":"руб.","separator":".","delimiter":" ","precision":2,"significant":false,"strip_insignificant_zeros":false}},"percentage":{"format":{"delimiter":""}},"precision":{"format":{"delimiter":""}},"human":{"format":{"delimiter":"","precision":1,"significant":false,"strip_insignificant_zeros":false},"storage_units":{"format":"%n %u","units":{"byte":{"one":"байт","few":"байта","many":"байт","other":"байта"},"kb":"КБ","mb":"МБ","gb":"ГБ","tb":"ТБ"}},"decimal_units":{"format":"%n %u","units":{"unit":"","thousand":{"one":"Тысяча","few":"Тысяч","many":"Тысяч","other":"Тысяч"},"million":{"one":"Миллион","few":"Миллионов","many":"Миллионов","other":"Миллионов"},"billion":{"one":"Миллиард","few":"Миллиардов","many":"Миллиардов","other":"Миллиардов"},"trillion":{"one":"Триллион","few":"Триллионов","many":"Триллионов","other":"Триллионов"},"quadrillion":{"one":"Квадриллион","few":"Квадриллионов","many":"Квадриллионов","other":"Квадриллионов"}}}}},"datetime":{"distance_in_words":{"half_a_minute":"меньше минуты","less_than_x_seconds":{"one":"меньше %{count} секунды","few":"меньше %{count} секунд","many":"меньше %{count} секунд","other":"меньше %{count} секунды"},"x_seconds":{"one":"%{count} секунда","few":"%{count} секунды","many":"%{count} секунд","other":"%{count} секунды"},"less_than_x_minutes":{"one":"меньше %{count} минуты","few":"меньше %{count} минут","many":"меньше %{count} минут","other":"меньше %{count} минуты"},"x_minutes":{"one":"%{count} минуту","few":"%{count} минуты","many":"%{count} минут","other":"%{count} минуты"},"about_x_hours":{"one":"около %{count} часа","few":"около %{count} часов","many":"около %{count} часов","other":"около %{count} часа"},"x_days":{"one":"%{count} день","few":"%{count} дня","many":"%{count} дней","other":"%{count} дня"},"about_x_months":{"one":"около %{count} месяца","few":"около %{count} месяцев","many":"около %{count} месяцев","other":"около %{count} месяца"},"x_months":{"one":"%{count} месяц","few":"%{count} месяца","many":"%{count} месяцев","other":"%{count} месяца"},"about_x_years":{"one":"около %{count} года","few":"около %{count} лет","many":"около %{count} лет","other":"около %{count} лет"},"over_x_years":{"one":"больше %{count} года","few":"больше %{count} лет","many":"больше %{count} лет","other":"больше %{count} лет"},"almost_x_years":{"one":"почти 1 год","other":"почти %{count} лет"}},"prompts":{"year":"Год","month":"Месяц","day":"День","hour":"Часов","minute":"Минут","second":"Секунд"}},"helpers":{"select":{"prompt":"Выберите: "},"submit":{"create":"Создать %{model}","update":"Сохранить %{model}","submit":"Сохранить %{model}","article":{"create":"Создать новость","update":"Сохранить новость","submit":"Сохранить новость"}}},"activerecord":{"errors":{"template":{"header":{"one":"%{model}: сохранение не удалось из-за %{count} ошибки","few":"%{model}: сохранение не удалось из-за %{count} ошибок","many":"%{model}: сохранение не удалось из-за %{count} ошибок","other":"%{model}: сохранение не удалось из-за %{count} ошибки"},"body":"Проблемы возникли со следующими полями:"},"messages":{"inclusion":"имеет непредусмотренное значение","exclusion":"имеет зарезервированное значение","invalid":"имеет неверное значение","confirmation":"не совпадает с подтверждением","accepted":"нужно подтвердить","empty":"не может быть пустым","blank":"не может быть пустым","too_long":{"one":"слишком большой длины (не может быть больше чем %{count} символ)","few":"слишком большой длины (не может быть больше чем %{count} символа)","many":"слишком большой длины (не может быть больше чем %{count} символов)","other":"слишком большой длины (не может быть больше чем %{count} символа)"},"too_short":{"one":"недостаточной длины (не может быть меньше %{count} символа)","few":"недостаточной длины (не может быть меньше %{count} символов)","many":"недостаточной длины (не может быть меньше %{count} символов)","other":"недостаточной длины (не может быть меньше %{count} символа)"},"wrong_length":{"one":"неверной длины (может быть длиной ровно %{count} символ)","few":"неверной длины (может быть длиной ровно %{count} символа)","many":"неверной длины (может быть длиной ровно %{count} символов)","other":"неверной длины (может быть длиной ровно %{count} символа)"},"taken":"уже существует","not_a_number":"не является числом","greater_than":"может иметь значение большее %{count}","greater_than_or_equal_to":"может иметь значение большее или равное %{count}","equal_to":"может иметь лишь значение, равное %{count}","less_than":"может иметь значение меньшее чем %{count}","less_than_or_equal_to":"может иметь значение меньшее или равное %{count}","odd":"может иметь лишь четное значение","even":"может иметь лишь нечетное значение","record_invalid":"Возникли ошибки: %{errors}"},"full_messages":{"format":"%{attribute} %{message}"}},"models":{"article":"новость"}},"support":{"select":{"prompt":"Выберите: "},"array":{"sentence_connector":"и","skip_last_comma":true,"words_connector":", ","two_words_connector":" и ","last_word_connector":" и "}},"article":{"news":"Новости","title":"Заголовок","back":"Вернуться","show":{"action":"Посмотреть"},"create":{"action":"Новая новость","notice":"Новость была успешно создана."},"update":{"action":"Редактировать","title":"Редактирование новости","notice":"Новость была успешно обновлена."},"destroy":{"action":"Удалить","notice":"Новость была успешно уничтожена.","alert":"Новость не может быть уничтожена."}},"developers":{"v1":{"title":"Документация по серверному API версии 1","request_params":"Параметри:","samples":"Примеры","topics":{"title":"Темы","basic":{"title":"Основные принципи"},"architecture":{"title":"Архитектура API"},"semesters":{"title":"Семестры"},"groups":{"title":"Групы"},"students":{"title":"Студенты"},"subjects":{"title":"Предметы"}}}},"formtastic":{"yes":"Да","no":"Нет","create":"Создать","update":"Сохранить","submit":"Сохранить","cancel":"Отменить","reset":"Сбросить","required":"обязательное"},"simple_form":{"да":"Да","нет":"Нет","required":{"text":"обязательное","mark":"*"},"error_notification":{"default_message":"Пожалуйста, ознакомьтесь с проблемами ниже:"},"labels":{"defaults":{"password":"Пароль","password_confirmation":"Подтверждение пароля","email":"Электронная почта","current_password":"Текущий пароль"},"user":{"new":{"email":"Электронная почта"},"edit":{"email":"Электронная почта"}}}},"login":"Войти","sign_up":"Зарегестрироваться","logout":"Выйти","edit_account":"Редактировать","remember_me":"Запомнить меня","didnt_recive_confirm":"Не получили инструкции подтверждения?","didnt_recive_unlock":"Не получили инструкции разблокировки?","wellcome":"Приветствуем","app":{"logo":"Журнал успеваемости","study_title":"Учебный процесс","my_subjects_title":"Мои предметы","copyright":"Все права защищены. КНТУ 2013","author":"Ищенко А.А. КИ(ПМ)-12М","description":"Разработка программного обеспечения анализа динамики успеваемости студентов в учебном процессе"},"languages":{"select":"Выберите язык","uk":"Українська","ru":"Русский","en":"English"},"ckeditor":{"page_title":"CKEditor Загрузка файлов","confirm_delete":"Удалить файл?","buttons":{"cancel":"Отмена","upload":"Загрузить","delete":"Удалить"}}}};