let imgSrc = document.querySelector('#image_container img');
      function thumbnail(e) {
        let tgt = e.target || window.event.srcElement,
          files = tgt.files;
        // FileReader support
        if (FileReader && files && files.length) {
          let fr = new FileReader();
          fr.onload = function () {
            imgSrc.src = fr.result;
          };
          fr.readAsDataURL(files[0]);
        }
      }