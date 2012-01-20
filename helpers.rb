module Sinatra
  module ViewHelper
    def questions_path
      "/questions"
    end
    
    def question_path(id)
      "/questions/#{id}"
    end
    
    def new_question_path
      questions_path + "/new"
    end
    
    def edit_question_path(id)
      question_path(id) + "/edit"
    end
    
    def link_to(title, url)
      %Q!<a href="#{url}">#{title}</a>!
    end
    
    def link_to_delete(title, url)
      %Q!<form action="#{url}" method="post">
      	<div style="margin:0;padding:0;">
      		<input type="hidden" name="_method" value="delete" id="_method">
      	</div>
      	<p><input type="submit" value="#{title}"></p>
      </form>!
    end
    
  end
  
  helpers ViewHelper
end