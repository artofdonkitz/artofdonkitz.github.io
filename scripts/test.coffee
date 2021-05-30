---
issues_url: https://api.github.com/repos/artofdonkitz/artofdonkitz.github.io/issues
---

console.log '{{ page.issues_url }}'
issues_display = (v) ->
    console.log v
    gallery.innerText = v[0].title

successResultCodes  = [200,304]
load_issue_status = ->
    req = new XMLHttpRequest()
    req.addEventListener 'readystatechange', ->
        if req.readyState is 4
            if req.status in successResultCodes
                issues_display JSON.parse(req.responseText)
            else
                console.log 'Error'
    req.open 'GET', '{{ page.issues_url }}', true
    req.send()

elem = document.createElement("p")
elem.id = "bar"
elem.innerText = "==="
document.body.appendChild(elem)
elem.onclick = load_issue_status

