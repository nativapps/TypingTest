  function addW(window) {
      console.log("I'm in man");
      window.$ = window;
      console.log("window"+window);
      // clear existing word-section
      let wordSection = $("#word-section")[0];
      wordSection.innerHTML = "";
      $("#typebox")[0].value = "";
  
      for (let i = 0; i < wordList.length ; i++) {
          let wordSpan = `<span>${wordList[i]}</span>`;
          wordSection.innerHTML += wordSpan;
      }
      // mark first word as current-word
      wordSection.firstChild.classList.add("current-word");

      // mark last word with magic-box
      // let magicBox = document.createElement("DIV");
      // magicBox.classList.add("magic-box");
      // wordSection.appendChild(magicBox);
  }