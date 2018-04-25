# Проверка на валидность телефона
is_valid_phone = (phone) ->
  if (phone == undefined)
    return false;

  pattern = /^[+]?[78]\d{10}$/
  if (pattern.test(phone))
    return true;
  else
    return false

# Переводит телефон в нужный формат - +79XXXXXXXXX. Убирает все ненужные знаки
format_phone = (phone) ->
  if (phone == undefined)
    return '';

  pattern = /^(8|7)/
  phone = phone.replace(pattern, '+7')
  phone = phone.replace(/(\(|\)|\.|\-)/g, '')
  return phone;

# Чекает телефон и показывает/скрывает форму заполнения пароля, если такой телефон есть в базе
window.check_phone = (phone) ->
  if (is_valid_phone(phone))
    callback = (response) ->
      console.log(response);
      if (response.user_exists == true)
        $('#sign-in-form').removeClass('d-none')
      else
        $('#sign-in-form').addClass('d-none')

    $.get '/user_exists', { login: phone }, callback
  else
    $('#sign-in-form').addClass('d-none')

$(document).on 'keyup', '#login-input', () ->
  phone = format_phone($(this).val());
  check_phone(phone);


# Изменяет роль на организатора
$(document).on 'click', '#pills-organizer-tab', () ->
  $('#role-input').val('organizer');

# Изменяет роль на доктора
$(document).on 'click', '#pills-doctor-tab', () ->
  $('#role-input').val('doctor');
