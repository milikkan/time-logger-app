$(function () {
  $(document).foundation();

  jQuery(".datetimepicker").datetimepicker({
    format: "d.m.Y H:i",
  });

  jQuery(".datepicker").datetimepicker({
    timepicker: false,
    format: "d.m.Y",
  });
});
