module MessagesHelper

  def render_highlight_content(message,query_string)
    excerpt_cont = excerpt(message.title, query_string, radius: 500)
    highlight(excerpt_cont, query_string)
  end

  def render_message_status(message)
    if message.is_hidden
      "(Hidden)"
    else
      "(Public)"
    end
  end
end
