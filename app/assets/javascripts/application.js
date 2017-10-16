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

//= require rails-ujs
//= require turbolinks
//= require_tree .
//= jquery3

// Braintree Java
$(document).on('turbolinks:load', function() {
    var submit = document.querySelector('.button');
    var form = document.querySelector('#cardForm');
    var authorization = $('#mydiv').data('myval');

    braintree.client.create({
        authorization: authorization
      }, function (clientErr, clientInstance) {
        if (clientErr) {
          console.error(clientErr);
          return;
        }

        // This example shows Hosted Fields, but you can also use this
        // client instance to create additional components here, such as
        // PayPal or Data Collector.

        braintree.hostedFields.create({
          client: clientInstance,
          styles: {
            'input': {
              'font-size': '14px'
            },
            'input.invalid': {
              'color': 'red'
            },
            'input.valid': {
              'color': 'green'
            }
          },
          fields: {
            number: {
              selector: '#card-number',
              placeholder: '4111 1111 1111 1111'
            },
            cvv: {
              selector: '#cvv',
              placeholder: '123'
            },
            expirationDate: {
              selector: '#expiration_date',
              placeholder: '10/2019'
            }
          }
        }, function (hostedFieldsErr, hostedFieldsInstance) {
          if (hostedFieldsErr) {
            console.error(hostedFieldsErr);
            return;
          }

          submit.removeAttribute('disabled');

          form.addEventListener('submit', function (event) {
            event.preventDefault();

            hostedFieldsInstance.tokenize(function (tokenizeErr, payload) {
              if (tokenizeErr) {
                console.error(tokenizeErr);
                return;
              }

              // If this was a real integration, this is where you would
              // send the nonce to your server.
              console.log('Got a nonce: ' + payload.nonce);
              document.querySelector('input[name="checkout_form[payment_method_nonce]"]').value = payload.nonce;
              form.submit()
            });
          }, false);
        });
      });
});


// Timer Java
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
            }, 10);
        }
    }
