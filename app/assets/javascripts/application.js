// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require cocoon
//= require rails-ujs
//= require turbolinks
//= require_tree .
var status = 0; //0:stop 1:running
var time = 0;
                 
    function start(){
        status = 1;
        document.getElementById("startBtn").disabled = true;
        timer();
    }
    function stop(){
        status = 0;
        document.getElementById("startBtn").disabled = false;
    }
    function reset(){
        status = 0;
        time = 0;
        document.getElementById('timerLabel').innerHTML = '00:00:00';
        document.getElementById("startBtn").disabled = false;
    }
    function timer(){
        if(status == 1){
            setTimeout(function(){
                time++;
                var hour = Math.floor(time/100/60/60);
                var min = Math.floor(time/100/60);
                var sec = Math.floor(time/100);

                if(min >= 60) {
                    min = min % 60;
                }
                if(min < 10) {
                    min = "0" + min;
                }
                if(sec >= 60) {
                    sec = sec % 60;
                }
                if(sec < 10) {
                    sec = "0" + sec;
                }
                 
                document.getElementById('timerLabel').innerHTML = hour + ":" + min + ":" + sec;
                timer();
            }, 1);
        }
    }