/**
 * Required JavaScript for challenge/response spam protection
 */

function getResult (method, challenge) {
  switch (method) {
    case '2':
      return challenge.split('').reverse().join('')
    case '1':
    default:
      return challenge.replace(/[a-z]/gi, char =>
        String.fromCharCode(char.charCodeAt(0) + (char.toUpperCase() <= 'M' ? 13 : -13))
      )
  }
}

document.addEventListener('DOMContentLoaded', () =>
{
  [...document.querySelectorAll('[id$="-cr-field"]')].forEach(element =>
  {
    let [method, expiration,challenge,delay] = atob(element.value).split('|');

    if (delay === undefined) {
      // The CR field has already been submitted by the client, but server side validation may have failed
      return;
    }

    if (method === undefined) {
      // If no method is defined, we fall back to the default obfucation method
      method = '1';
    }

    setTimeout(() => {element.value = btoa(method + '|' + expiration + '|' + getResult(method, challenge))}, 1e3 * delay)
  })
});