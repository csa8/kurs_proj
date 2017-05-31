@delete_one_layover = (link)->
  if confirm("Удалить остановку из маршрута?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1")
    link.parent().parent().parent().parent().hide()

@del_all_layovers = ->
  $('a.remove_layover').on 'click', ->
    window.delete_one_layover($(this))
    false
  false

@add_new_layover = ->
  $('#add_layover_link').on 'click', ->
    new_id = new Date().getTime()
    regexp = new RegExp("new_lo", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)
    # Вставляем на страницу
    $(this).parent().parent().after(content)
    panel = $(this).parent().parent().parent().find('.panel-info').first()
    # Её раньше не было, поэтому при зарузке страницы она не включалась
    panel.find('a.show-new').on 'click', ->
      window.new_station_form($(this))
      false
    panel.find('a.remove_layover').on 'click', ->
      window.delete_one_layover($(this))
      false    
    false

@edit_one_station = (link)->
  # собсна панель
  panel = link.parent().parent().parent()

  # достаем значение выбранной станции из select
  station_id = panel.find('.selected_station').val()

  # ищем нашу форму для редактирования станции
  element = panel.find(".station_edit_form")
  edit_form = element.attr("data-content")
  # нашли и вставили
  element.html(edit_form)

  # ищем данные для заполнения полей редактирвания "старыми" 
  # значениями, тип мы крутые
  name = $(document).find('.name-'+station_id).attr("data-content")
  tariff = $(document).find('.tariff-'+station_id).attr("data-content")
  ordern = $(document).find('.order_num-'+station_id).attr("data-content")

  # вставляем значения
  panel.find("input[type=hidden].station-id").val(station_id)
  panel.find("input[type=text].station-name").val(name)
  panel.find("input[type=text].station-tariff").val(tariff)
  panel.find("input[type=text].station-order_num").val(ordern)

  # создаем ссылку отмены и вставляем
  cancel_link = link.attr("data-content")
  link.after(cancel_link)
  
  # прячем старую ссылку, прячем форму для выбора
  link.hide()
  panel.find('.station-select').hide()

  # так как ссылки не было - добавим для нее магии
  panel.find('a.cancel_edit').on 'click', ->
    # возвращаем старую форму для выбора
    panel.find('.station-select').show()
    # удаляем форму для редактирования
    panel.find('.station-edit').remove()
    # творим такую же магию для кнопок
    link.show()
    $(this).remove()
    false
  false

@edit_all_stations = ->
  $('.show-edit').on 'click', ->
    window.edit_one_station($(this))
    false    
  false

@new_station_form = (link) ->
  # собсна панель
  panel = link.parent().parent().parent()

  # ищем нашу форму для создания станции
  element = panel.find(".station_new_form")
  new_form = element.attr("data-content")
  # нашли и вставили
  element.html(new_form)

  # создаем ссылку отмены и вставляем
  cancel_link = link.attr("data-content")
  link.after(cancel_link)
  
  # прячем старую ссылку, удаляем(!) форму для выбора
  link.hide()
  panel.find('.station-select').remove()

  # по традиции включаем магию для новой кнопки
  panel.find('a.cancel_edit').on 'click', ->
    window.cancel_edit_form($(this))
    link.show()
    $(this).remove()
    false
  false

@cancel_edit_form = (link) ->
  panel = link.parent().parent().parent().parent()
  element = panel.find(".station_select_form")
  form = element.attr("data-content")
  element.html(form)
  panel.find(".station-new").remove()
  false

@check_change = (checkbox)->
  panel = $(checkbox).parent().parent().parent().parent().parent()
  if checkbox.checked 
    panel.find('.time-arrive').hide()
    panel.removeClass('panel-success')
    panel.addClass('panel-default')
  else
    panel.find('.time-arrive').show()
    panel.removeClass('panel-default')
    panel.addClass('panel-success')
  false

@ignor_style = ->
  $('.panel-default').find('.time-arrive').hide()

layover_ready = ->
  window.add_new_layover()
  window.del_all_layovers()
  window.edit_all_stations()
  window.ignor_style()
$(document).on 'page:load', layover_ready # Включаем при ajax обновлении страницы
$(document).ready layover_ready # Включаем при обычном обновлении страницы

