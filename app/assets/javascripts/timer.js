/*
- start button -> onclick
  - preventDefault()
  - change button to stop button
  - set #start-time value to current time
  - start #timer components

- stop_button
  - change button to stop button
  - set #end-time value to #start-time + elapsed time
  - reset #timer components
  - reset comment and category inputs
  - submit()
*/
function controlTimer() {
  const timerBtn = $("#timer-button");
  var t;
  timerBtn.on("click", function (event) {
    if (timerBtn.hasClass("fa-play-circle")) {
      event.preventDefault();
      timerBtn.removeClass("fa-play-circle");
      timerBtn.addClass("fa-stop-circle");
      $("#start-time").val(new Date());
      t = startTimer();
    } else {
      timerBtn.removeClass("fa-stop-circle");
      timerBtn.addClass("fa-play-circle");
      $("#end-time").val(new Date());
      clearInterval(t);
      $("#timer .seconds").html("00");
      $("#timer .minutes").html("00");
      $("#timer .minutes").html("00");
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

$(function () {
  controlTimer();
});
