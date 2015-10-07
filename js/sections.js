

            //var active = $(".zen");
            //var ctrl_buttons = $(".ctrl-button");
            var ctrl_buttons = $("#control-buttons");

            

            $("h1.teht").each(function(i){

                  $(this).append("Tehtävä ").append(i+1).append(".");

            });             

      

            //ctrl_buttons.hide();

            $('section.ex').click(function(){
              toggleSection( $(this) );
            });

            ctrl_buttons.find('a').click(function(e){
              e.preventDefault();

              var active = $(".zen");
              var id = $(this).attr('id');

              switch(id) {
                case 'prev': {
                  toggleSection( active.prev() );
                  break;
                }
                case 'next': {
                  toggleSection( active.next() );
                  break;
                }
                case 'answer': {
                  $(".zen").find('.answer').toggle();
                }
              }
            });



            function toggleSection(s){
              if( s.objectType !== 'undefined' ){

                $('section').not(s).removeClass('zen');
                s.toggleClass('zen');

                toggleButtons( s );
                hideAnswers();

                        // Where to scroll
                        var divPosition = s.offset();

                        // Scroll...
                        $('html, body').scrollTop(divPosition.top);
                      }
                    }

                    function toggleButtons(e){
                      if ( e.hasClass('zen') ) {
                        ctrl_buttons.show();
                      }
                      else{
                        ctrl_buttons.hide();
                      }
                    }

                    function hideAnswers() {
                      $("div.answer").hide();
                    }
                    function toggleAnswer(e) {
                      var answer = e.find("div.answer");
                      if ( e.hasClass('zen') ) {
                        answer.show();
                      }
                      else{
                        answer.hide();
                      }
                    }


                    $(document).keydown(function(e) {

                      switch(e.which) {
                    case 37: // left
                    break;

                    case 38: // up
                    break;

                    case 39: // right
                    break;

                    case 40: // down
                    break;

                    default: return; // exit this handler for other keys
                  }
                e.preventDefault(); // prevent the default action (scroll / move caret)
              });

