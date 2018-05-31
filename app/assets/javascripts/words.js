

    //////////////////////////////////////////
  
  // Word Colors
  let colorCurrentWord = "#dddddd";
  let colorCorrectWord = "#93C572";
  let colorIncorrectWord = "#e50000";
  var seconds, minutes, second, showTime, segundos, timeInput, wordData;

  function addWords(window, tiempo) {

   seconds = tiempo;
   timePad = seconds < 10 ? "0" + seconds : seconds;
   minutes = Math.floor(timePad/60);
   second = Math.floor(timePad % 3600 % 60);
   showTime = minutes + ":" + ((second < 10) ? "0" + second : second);
   segundos = 0, minutos = 0;

   window.$ = document.querySelectorAll.bind(document);
   document.getElementById("showTime").innerHTML = showTime;
   timeInput = showTime;
      // clear existing word-section
  // Word Count and other data.
      let text_test = document.getElementById("text_test").value.replace(/[# ]/g, "++").split("++");
      console.log(text_test);
      let wordList = text_test; //["Hola", "Esto,", "funciona"]
      let wordSection = $("#word-section")[0];
      wordSection.innerHTML = "";
      $("#typebox")[0].value = "";
  
      for (let i = 0; i < wordList.length ; i++) {
          let wordSpan = `<span>${wordList[i]}</span>`;

          if (wordList[i] != "*")
              wordSection.innerHTML += wordSpan;
            else 
              wordSection.innerHTML += '<br>';
      }
      // mark first word as current-word
      wordSection.firstChild.classList.add("current-word");

   wordData = {
      seconds: seconds,
      correct: 0,
      incorrect: 0,
      total: 0,
      typed: 0
    };
  }



  function checkIt(currentWord) {
      // how much we have of the current word.
      let current = $(".current-word")[0];
      let currentSubstring = current.innerHTML.substring(0, currentWord.length);
      // check if we have any typing errors
      if (currentWord != currentSubstring) 
          return false;
       else 
          return true;
  }
  
  
  function submitWord(word) {
      // update current-word and
      // keep track of correct & incorrect words
      let current = $(".current-word")[0];
      console.log("I will check **" + word + '**');
      if (checkIt(word)) {
        console.log(word + " is correct");
          current.classList.remove("current-word", "incorrect-word-c");
          current.classList.add("correct-word-c");
          wordData.correct += 1;
          document.getElementById("count_correct").value = wordData.correct;
      } else {
        console.log(word + " is incorrect");    
          current.classList.remove("current-word", "incorrect-word-bg");
          current.classList.add("incorrect-word-c");
          wordData.incorrect += 1;
          document.getElementById("count_incorrect").value = wordData.incorrect;
      }
      // update wordData
      wordData.total = wordData.correct + wordData.incorrect;
      document.getElementById("total_word").value = wordData.total;
  
      // make the next word the new current-word.
      current.nextSibling.classList.add("current-word");
      submitted_words++;
  }

  function goBack(word){
      // update current-word and
      // keep track of correct & incorrect words
      let current = $(".current-word")[0].previousSibling;
      //current.classList.remove("incorrect-word-c", "incorrect-word-bg", "correct-word-bg");
      if (current.classList.value == "correct-word-c") { 
          current.classList.remove("correct-word-c");
          current.classList.add("current-word");
          wordData.correct -= 1;
          document.getElementById("count_correct").value = wordData.correct;
      } else if(current.classList.value == "incorrect-word-c"){
          current.classList.remove("incorrect-word-c", "incorrect-word-bg");
          current.classList.add("current-word");
          wordData.incorrect -= 1;
          document.getElementById("count_incorrect").value = wordData.incorrect;
      }
      // update wordData
      wordData.total = wordData.correct + wordData.incorrect;
      document.getElementById("total_word").value = wordData.total;
  
      // make the next word the new current-word.
      current.classList.add("current-word");
      current.nextSibling.classList.remove("current-word");
  }
  
  function clearLine(sign) { // sign determina si sube o baja el scroll del cuadro de texto. Depende de si viene de SPACE o BACKSPACE
      // remove past words once you get to the next line
      let wordSection = $("#word-section")[0];
      let current = $(".current-word")[0]; // second line (first word)
      let previous = current.previousSibling; // first line (last word)
      console.log("offSet current=>"+current.offsetTop+" previous=>"+previous.offsetTop+"sign=>"+sign)
      if (current.offsetTop > previous.offsetTop)
           wordSection.scrollTop = wordSection.scrollTop + (sign*30);

  }



  let finished = false;
  function isTimer(seconds, timeInput) {
      // BUG: page refresh with keyboard triggers onkeyup and starts timer
      // Use restart button to reset timer
  
      let time = seconds;
      let timeInput2 = timeInput;

      // only set timer once
      let one = $("#timer > span")[0].innerHTML;
      if (one == timeInput2) {
          let typingTimer = setInterval(() => {
              if (time <= 0) {
                  clearInterval(typingTimer);
              } else {
                  time -= 1;
                  let timePad = time < 10 ? "0" + time : time; // zero padded
                  let minutes = Math.floor(timePad/60);
                  let second = Math.floor(timePad % 3600 % 60);
                  //console.log("minutes=>"+minutes+" second=>"+ second + " second_before=>"+second_before);
                  if (second_before-second>0) // Print WPM each second
                      document.getElementById("wpm").value = fastWPM(wordData);                     
                  second_before = second;
                  let showTime = minutes + ":" + ((second < 10) ? "0"+second : second);
                  $("#timer > span")[0].innerHTML = `${showTime}`;
                  minutos = Math.ceil(document.getElementById("tiempo").value/60) - minutes - 1; // 1 viene de numero de minutos de prueba -1
                  //console.log("minutes=>"+minutes+ " minutos=>"+minutos + " seconds=>" + seconds + "second=>" + second + "time=>"+time);
                  segundos = seconds - time + 1;
                  // seconds es el tiempo de la prueba fijo en segundos
                  // second es el "segundero" en el tiempo que se le muestra al usuario,
                  // minutes es el "minutero" en el tiempo que se le muestra al usuario
                  if (time == 0 && !finished)
                     {
                        let word = $("#typebox")[0];
                        word.value += " "; // Here we simulate a Space being hit on the keyboard
                        //console.log("wooord=>" + word.value);
                        let split =  word.value.split(" ");
                        let current_word = split[(split.length)-2];
                        console.log("LENGTH!"+current_word.length);
                        if (current_word.length)
                             submitWord(current_word);
                        clearLine(1); // get rid of old words
                        // Disabling typing text area
                         document.getElementById("typebox").disabled="true";
                        // Display typing test results.
                        // Disabling word-section
                        document.getElementById("test_box").style.display="none";
                        // Showing results
                        document.getElementById("result_box").style.display="block";
                        calculateWPM(wordData);
                        finished = true;        // This let this block executes only once
                     }
              }
          }, 1000);
      } else if (one == "0:00") {
          return false;
      }
      return true;
  }
  
  function speed(wpm)
  {
    if (wpm>=0 && wpm<20) return "Slow";
    if (wpm>20 && wpm<40) return "Average";
    if (wpm>40 && wpm<60) return "Fluent";
    if (wpm>60 && wpm<80) return "Fast";
    if (wpm>80) return "Pro";
  }


 /*
  * 
  *
      This is the formulae used in final calculateWPM(data) function
      let min = seconds / 60;
      let wpm = Math.ceil((typed / 5) / min) - Math.ceil(incorrect / min);
*/
  function fastWPM(data) {
      let { seconds, correct, incorrect, total, typed } = data;
      //console.log("minutos=>" + minutos+ " seconds=>"+seconds+" segundos=>"+segundos);
      let min = segundos / 60;
      let wpm = Math.ceil((typed / 5) / min) - Math.ceil(incorrect / min);
      let accuracy = Math.ceil(correct / total * 100);
      document.getElementById("accuracy").value = accuracy;
      document.getElementById("wpm").value = wpm
      console.log("typed ->" + typed);
      if (wpm < 0) {
          wpm = 0;
      } // prevent negative wpm from incorrect words
      return wpm;
  }

  var second_before=0;
  var submitted_words = 0;


  function typingTest(e) {
      // Char:        Key Code:
      // <space>      32
      // <backspace>  8
      // <shift>      16
      // [A-Z]        65-90
      // [' "]        222
  
      // Get key code of current key pressed.
      e = e || window.event;
      let kcode = e.keyCode;
      let word = $("#typebox")[0];
      //console.log(word.value);
  
      // check if empty (starts with space)
      if (word.value.match(/^\s/g)) {
          word.value = "";
      } else {
          // Only score when timer is on.
          if (isTimer(wordData.seconds, timeInput)) {
              // <space> submits words****
              if (kcode == 32){
                  let split =  word.value.split(" ");
                  let current_word = split[(split.length)-2];
                  submitWord(current_word);
                  clearLine(1); // get rid of old words
              }
              else if (kcode == 8)
              {
                let split =  word.value.split(" ");
                let number_of_spaces = split.length-1;
                //console.log("number of spaces=>"+number_of_spaces+ " submitted words=>" +submitted_words+" word=>*" + word.value+" extract=>*"+split[split.length-1]);
                while (number_of_spaces<submitted_words)
                    {
                       clearLine(-1); // get rid of old words
                       goBack(word);
                       submitted_words--;
                    }
                wordData.typed = word.value.length - number_of_spaces; // -number of spaces, en caso de querer excluir los espacios
              }
              else if (kcode != 16 && kcode != 20){ // Excluse SHIFT and MAYUS
                //console.log("just typed=>" + wordData.typed + "kcode=>" + kcode);
                wordData.typed += 1; // count each valid character typed
                document.getElementById("count_typed").value = wordData.typed;
              }
          } 
      }      
  }


    function calculateWPM(data) {
      let { seconds, correct, incorrect, total, typed } = data;
      let min = seconds / 60;
      let wpm = Math.ceil((typed / 5) / min) - Math.ceil(incorrect / min);
      //console.log("here i am " + wpm);
      let accuracy = Math.ceil(correct / total * 100);

      // Set final results
      document.getElementById("accuracy").value = accuracy;
      document.getElementById("wpm").value = wpm;
      document.getElementById("count_correct").value = correct;
      document.getElementById("count_typed").value = typed;
      document.getElementById("total_word").value = total;
      console.log("Here i am, wrapping it up, accuracy=>"+accuracy+" wpm=>"+wpm+" count_correct=>"+correct+ " count_typed=>"+typed+" total_word=>"+total);

      if (wpm < 0) {
          wpm = 0;
      } // prevent negative wpm from incorrect words
  
      // template strings are pretty cool
      let results = `<ul id="results">
          <li>WPM: <span class="wpm-value">${wpm}</span></li>
          <li>Accuracy: <span class="wpm-value">${accuracy}%</span></li>
          <li id="results-stats">
          Total Words: <span>${total}</span> |
          Correct Words: <span>${correct}</span> |
          Incorrect Words: <span>${incorrect}</span> |
          Characters Typed: <span>${typed}</span>
          </li>
          </ul>`;
          
      results = `<div class="points">
                <p>Typed</p> 
                <h2>${typed}</h2>
                </div>
                <div class="points">
      <p>Correct</p>
        <h2>${correct}</h2>
      </div>

      <div class="points">
        <p>Incorrect</p>
        <h2>${incorrect}</h2>
      </div>

      <div class="points">
        <p>WPM</p>
        <h2>${wpm}</h2>
      </div>

      <div class="points">
        <p>Accuracy</p>
        <h2>${accuracy}%</h2>
      </div>

      <div class="wrapper-bar">

        <h4>Your Adjusted Typing speed is <span>${speed(wpm)}</span></h4>

        <div class="result-bar">
          <div class="measurement">
            <span>
              Slow
            </span>
            <p>0</p>
          </div>

          <div class="measurement">
            <span>
              Average
            </span>
            <p>20</p>
          </div>


          <div class="measurement">
            <span>
              Fluent
            </span>
            <p>40</p>
          </div>


          <div class="measurement">
            <span>
            Fast
            </span>
            <p>60</p>
          </div>

          <div class="measurement">
            <span>
              Pro
            </span>
            <p>80</p>
          </div>
          <div class="result" id="dial" style="left:${wpm}%">
            <h4>${wpm}</h4>
          </div>
          
        </div> <!-- .result-bar -->
      </div><!-- .wrapper-bar -->
      <input type="submit" name="commit" value="Send results" class="button" 
      id="send_result" display="in-block" data-disable-with="Saving your results...">
      `;
      $("#result_box")[0].innerHTML = results;
      return wpm;
  }
 