import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})

socket.connect()

const createSocket = (topicId) => {
  let channel = socket.channel(`comments:${topicId}`, {})
  channel.join()
  .receive("ok", resp => {
    renderComments(resp.comments) 
  })
  .receive("error", resp => { console.log("Unable to join", resp) })

  channel.on(`comments:${topicId}:new`, renderComment)

  document.querySelector("#post").addEventListener("click",() => {
    let content = document.querySelector("#comment").value
    channel.push("comment:add", {content: content})
  })
}

function renderComments(comments) {
  const renderedComment = comments.map(comments => {
    return commentTemplate(comments)
  })

  document.querySelector("#collection").innerHTML = renderedComment.join(" ")
}

function renderComment(payload) {
  const renderedComment = commentTemplate(payload.comment)

  document.querySelector("#collection").innerHTML += renderedComment
}

function commentTemplate(comments) {
  return `
    <li class="collection-item">
      ${comments.comments}
    </li>
  `
}

window.createSocket = createSocket
