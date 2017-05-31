module LayoversHelper
  def link_to_add_layover(form, schedule)
    # Создаём новый объект. Аналог build в ранних примерах
    new_layover = Layover.new()
    fields = form.fields_for(:layovers, new_layover, 
      :child_index => 'new_lo') do |lo|
      render('layover_form', lo: lo, i: 'Новая')
    end
    # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
    link_to(?#, class: 'btn btn-info', 
        id: 'add_layover_link', data: {content: "#{fields}"}) do 
      fa_icon("plus") + " Новая остановка" 
    end
  end
  def link_to_new_station()
    link_to(?#, class: 'show-new', 
        id: 'new_station_link', "data-content" => "#{link_to_cancel_edit()}") do 
      fa_icon('plus', title: 'Создать станцию') + ' Новая'
    end 
  end

  def link_to_edit_station()
    link_to(?#, class: 'show-edit', 
        id: 'edit_station_link', "data-content" => "#{link_to_cancel_edit()}") do 
      fa_icon('edit', title: 'Редактировать станцию') + ' Править'
    end 
  end

  def link_to_cancel_edit()
    link_to(?#, class: 'cancel_edit',
        id: 'cancel_edit_link') do 
      fa_icon('ban', title: 'Отменить') + ' Отменить'
    end 
  end

  def link_to_remove_layover(form)
    form.hidden_field(:_destroy, class: 'remove_fields') + 
        link_to(?#, class: 'remove_fields remove_layover') do 
      fa_icon('times', title: 'Удалить остановку') + ' Удалить'      
    end
  end

  def panel_type(form)
    return 'danger' if form.invalid?
    return 'info' if form.new_record?
    return 'default' if form.ignor
    return 'success'
  end
  


end
