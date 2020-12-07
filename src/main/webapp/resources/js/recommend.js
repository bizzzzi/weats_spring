(() => {
  const stepElems = document.querySelectorAll('.step');
  const graphicElems = document.querySelectorAll('.image-item');
  let currentItem = graphicElems[0];
  let ioIndex;

  const io = new IntersectionObserver((entries, observer) => {
    ioIndex = entries[0].target.dataset.index * 1;
  });

  for (let i = 0; i < stepElems.length; i++) {
    io.observe(stepElems[i]);
    stepElems[i].dataset.index = i;
    graphicElems[i].dataset.index = i;
  }

  function activate(action) {
    currentItem.classList.add('visible');
    if (action) {
      actions[action](true);
    }
  }

  function inactivate(action) {
    currentItem.classList.remove('visible');
    if (action) {
      actions[action](false);
    }
  }

  window.addEventListener('scroll', () => {
    let step;
    let boundingRect;

    for (let i = ioIndex - 1; i < ioIndex + 2; i++) {
      step = stepElems[i];
      if (!step) continue;
      boundingRect = step.getBoundingClientRect();

      if (boundingRect.top > window.innerHeight * 0.1 &&
        boundingRect.top < window.innerHeight * 0.8) {

        inactivate(currentItem.dataset.action);
        currentItem = graphicElems[step.dataset.index];
        activate(currentItem.dataset.action);
      }
    }
  });

  window.addEventListener('load', () => {
    setTimeout(() => scrollTo(0, 0), 100);
  });

  activate();

})();
