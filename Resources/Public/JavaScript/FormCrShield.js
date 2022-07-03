/**
 * Required JavaScript for challenge/response spam protection
 */
document.addEventListener('DOMContentLoaded', function () {
  let elements = document.querySelectorAll('[data-cr-challenge]');
  if (typeof elements === 'undefined' || elements === null || elements.length === 0) {
    return;
  }

  let elementsArray = [...elements];
  elementsArray.forEach(element => {
    let challengeString = atob(element.getAttribute('data-cr-challenge'));
    let [exp,challenge] = challengeString.split('|');
    let delay = element.dataset.crDelay;

    // ROT13 the challenge - source: https://stackoverflow.com/a/617685/1744743
    let response = challenge.replace(/[a-zA-Z]/g, function (c) {
      return String.fromCharCode((c <= 'Z' ? 90 : 122) >= (c = c.charCodeAt(0) + 13) ? c : c - 26);
    });

    // Set calculated response after defined amount of seconds
    setTimeout(() => {
      element.value = btoa(exp + '|' + response)
    }, delay * 1000)
  });
});