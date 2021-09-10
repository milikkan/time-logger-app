function a() {
	const timerBtn = $(".timer-button");
	var t;
  timerBtn.click(function() {
    if (timerBtn.hasClass("fa-play-circle")) {
      timerBtn.removeClass("fa-play-circle");
      timerBtn.addClass("fa-stop-circle");
      t = startTimer();
    } else {
      timerBtn.removeClass("fa-stop-circle");
      timerBtn.addClass("fa-play-circle");
      clearInterval(t);
      $("#seconds").html("00");
      $("#minutes").html("00");  
    }
  });
}

function pad(val) { 
	return val > 9 ? val : "0" + val; 
}

function startTimer() {
	var sec = 0;
  
  return setInterval(function() {
    $("#seconds").html(pad(++sec%60));
    $("#minutes").html(pad(parseInt(sec/60,10)));
  }, 1000);
}




$(function() {
  a();
});
