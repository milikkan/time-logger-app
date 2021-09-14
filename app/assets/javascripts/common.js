function initDateTimePickers() {
  $(".datetimepicker").datetimepicker({
    format: "d.m.Y H:i",
  });

  $(".datepicker").datetimepicker({
    timepicker: false,
    format: "d.m.Y",
  });
}

$(function () {
  $(document).foundation();

  initDateTimePickers();
});
