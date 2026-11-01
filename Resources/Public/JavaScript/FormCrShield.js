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

/**
 * Fetches a single-use nonce from the uncached nonce endpoint. The nonce cannot be part of the (cacheable)
 * form output, so it is requested per client and attached to the challenge/response value on submission.
 */
function fetchNonce (nonceUrl) {
  const url = new URL(nonceUrl, window.location.origin)

  return fetch(url.toString(), { headers: { Accept: 'application/json' } })
    .then(response => response.ok ? response.json() : null)
    .then(data => (data && data.nonce) ? data.nonce : null)
    .catch(() => null)
}

document.addEventListener('DOMContentLoaded', () =>
{
  [...document.querySelectorAll('[id$="-cr-field"]')].forEach(element =>
  {
    const parts = atob(element.value).split('|')

    // Expected formats (all base64 encoded):
    // - initial challenge (rendered by the server): method|expiration|hmac|delay
    // - solved response (set by this script): method|expiration|response|nonce
    if (parts.length !== 4) {
      return
    }

    let [method, expiration, challenge, delayOrNonce] = parts

    if (method === undefined) {
      method = '1'
    }

    const nonceUrl = element.getAttribute('data-nonce-url')
    if (!nonceUrl) {
      return
    }

    // The 4th segment is a small numeric delay for the initial challenge and a 64 char nonce for an already
    // solved response (e.g. when the form is redisplayed after a server side validation error).
    const alreadySolved = delayOrNonce.length > 6

    if (alreadySolved) {
      // Refresh the (now consumed or possibly expired) nonce and keep the already calculated response
      fetchNonce(nonceUrl).then(nonce => {
        if (nonce) {
          element.value = btoa(method + '|' + expiration + '|' + challenge + '|' + nonce)
        }
      })
      return
    }

    const delay = delayOrNonce
    fetchNonce(nonceUrl).then(nonce => {
      if (!nonce) {
        return
      }
      setTimeout(() => {
        element.value = btoa(method + '|' + expiration + '|' + getResult(method, challenge) + '|' + nonce)
      }, 1e3 * delay)
    })
  })
});
