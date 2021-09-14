function controlTimer() {
  const timerBtn = $("#timer-button");
  var t;
  var selectedCategoryId = $("#time_entry_category_id option:selected").val();
  timerBtn.on("click", function (event) {
    if (timerBtn.hasClass("fa-play-circle")) {
      event.preventDefault();
      timerBtn.removeClass("fa-play-circle");
      timerBtn.addClass("fa-stop-circle");
      timerBtn.css("color", "red");
      $("#start-time").val(new Date());
      t = startTimer();
    } else {
      timerBtn.removeClass("fa-stop-circle");
      timerBtn.addClass("fa-play-circle");
      $("#end-time").val(new Date());
      clearInterval(t);
      $("body").on("ajax:complete", () => {
        resetTimeEntry(selectedCategoryId);
      });
    }
  });
}

function pad(val) {
  return val > 9 ? val : "0" + val;
}

function startTimer() {
  var sec = 0;

  return setInterval(function () {
    $("#timer .seconds").html(pad(++sec % 60));
    $("#timer .minutes").html(pad(parseInt((sec / 60) % 60, 10)));
    $("#timer .hours").html(pad(parseInt(sec / 3600, 10)));
  }, 1000);
}

function resetTimeEntry(categoryId) {
  $("#timer .seconds").html("00");
  $("#timer .minutes").html("00");
  $("#timer .minutes").html("00");
  $("#time_entry_comment")
    .val("")
    .attr("placeholder", "What are you working on?");
  $("#time_entry_category_id").val(categoryId);
}

$(function () {
  controlTimer();
});
