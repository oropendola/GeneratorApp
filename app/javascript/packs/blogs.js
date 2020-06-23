/* document.addEventListener('turbolinks:load', function() {
  
  var comments = document.querySelector("#comments");

  if(comments.length > 0) {

    var blog_id = comments.getAttribute("data-blog-id");

    App.global_chat = App.cable.subcriptions.create(
       {channel: "BlogsChannel", 
        blog_id: blog_id},
       {connected: function(){},
       	disconnected: function(){},
       	received: function(data) {
           comments.append(data['comment']);
          //return alert(data);
       	},
        send_comment: function(comment, blog_id) {

        	this.perform('send_comment',{comment: comment,blog_id: blog_id})
        }});

   }

}); */

//App.global_chat.send(message: "Esto es ejemplo de chat");