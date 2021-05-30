---
---

successResultCodes  = [200,304]
load_issue_status = ->
    req = new XMLHttpRequest()
    req.addEventListener 'readystatechange', ->
        if req.readyState is 4
            if req.status in successResultCodes
                console.log req.responseText
            else
                console.log 'Error'
    req.open 'GET', 'https://api.github.com/repos/artofdonkitz/artofdonkitz.github.io/issues', true
    req.send()

elem = document.createElement("p")
elem.id = "bar"
elem.innerText = "==="
document.body.appendChild(elem)
elem.onclick = load_issue_status

