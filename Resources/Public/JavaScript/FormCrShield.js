/**
 * Required JavaScript for challenge/response spam protection
 */
document.addEventListener('DOMContentLoaded', () =>
{
  [...document.querySelectorAll('[id$="-cr-field"]')].forEach(element =>
  {
    let [expiration,challenge,delay] = atob(element.value).split('|');
    setTimeout(() =>
    {
      element.value = btoa(expiration + '|' + challenge.replace(/[a-z]/gi, char =>
      {
        return String.fromCharCode( char.charCodeAt(0) + ( char.toUpperCase() <= 'M' ? 13 : -13 ) )/* https://stackoverflow.com/a/14553231 */
      }))
    }, 1e3 * (delay ?? 3))
  })
});