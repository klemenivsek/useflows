class ImageSwapper

  constructor: (element)->
    @image = $(element)
    @image_src = @image.attr('src')
    $(document).on('mouseenter', 'img', (e)=>
      @mouse_in(e)
    )

    $(document).on('mouseleave', 'img', (e)=>
      @mouse_out(e)
    )

  mouse_in: (e) =>
    img = $(e.currentTarget)
    $('.still').addClass('faded')
    img.removeClass('faded')
    @switch_image(img)

  mouse_out: (e) =>
    img = $(e.currentTarget)
    $('.still').removeClass('faded')
    @switch_image(img)


  replace_name: (file_name) ->
    if file_name.indexOf('still_') == 0
      return file_name.replace('still_', '')
    else
      return "still_#{file_name}"

  switch_image: (img) =>
    src = img.attr('src')
    src_arr = src.split("/")
    file_name = src_arr.pop()
    new_file_name = @replace_name(file_name)
    src_arr.push(new_file_name)
    new_path = src_arr.join("/")
    img.attr('src', new_path)




$.fn.image_swapper = () ->
  new ImageSwapper()
