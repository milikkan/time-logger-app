function initDateTimePickers() {
  $(".datetimepicker").datetimepicker({
    format: "d.m.Y H:i",
  });

  $(".datepicker").datetimepicker({
    timepicker: false,
    format: "d.m.Y",
  });
}

function resetFilters(event) {
  event.preventDefault();
  var options = $("#selection option");
  $("#selection").val(options[0].val);
  var date = new Date();
  var datestr =
    ("0" + date.getDate()).slice(-2) +
    "." +
    ("0" + (date.getMonth() + 1)).slice(-2) +
    "." +
    date.getFullYear();
  $("#start").val(datestr);
  $("#end").val(datestr);
  $("#find-entries").prop("disabled", true);
}

$(function () {
  $(document).foundation();

  initDateTimePickers();

  $("#reset-filters").on("click", (event) => resetFilters(event));
  $("#selection").on("change", () => {
    if ($("#selection :selected").text() == "Select User") {
      $("#find-entries").prop("disabled", true);
    } else {
      $("#find-entries").prop("disabled", false);
    }
  });
});
