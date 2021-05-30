---
---

successResultCodes  = [200,304]
load_issue_status = ->
    req = new XMLHttpRequest()
    req.onload ->
        console.log this.response
    req.open 'GET', 'https://api.github.com/repos/artofdonkitz/artofdonkitz.github.io/issues', true
    req.send()

elem = document.createElement("p")
elem.id = "bar"
elem.innerText = "==="
document.body.appendChild(elem)
elem.onclick = load_issue_status

