jQuery ->
  $('a.combo_box_item').click( ->
    $("#" + $(this).parent("li").parent("ul").attr("data-for")).val($(this).attr("data-value"))
    $(this).closest(".btn-group").find(".combo_box_text").text($(this).text())
    $('a.combo_box_item').parent("li").removeClass("active")
    $(this).parent("li").addClass("active")
    true
  )
