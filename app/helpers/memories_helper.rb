module MemoriesHelper
	def navigation(memory)
		if memory.previous.nil?
			nav = '<div class="col-md-1"></div>'\
			'<div class="col-md-10"></div>'\
			'<div class="col-md-1">"#{ link_to ">", memory_path(memory.next)}"</div>'
		elsif memory.next.nil?
			nav = '<div class="col-md-1">"#{ link_to ">", memory_path(memory.previous)}"</div>'\
			'<div class="col-md-10"></div>'\
			'<div class="col-md-1"></div>'
		else
			nav = '<div class="col-md-1">"#{ link_to ">", memory_path(memory.previous)}"</div>'\
			'<div class="col-md-10"></div>'\
			'<div class="col-md-1">"#{ link_to ">", memory_path(memory.next)}"</div>'
		end
		return nav.html_safe
	end
end
