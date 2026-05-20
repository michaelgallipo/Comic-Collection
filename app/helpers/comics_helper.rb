module ComicsHelper
	def sort_link(column, title = nil)
		title ||= column.to_s.titleize
		dir = if params[:sort] == column && params[:direction] == 'asc'
						'desc'
					else
						'asc'
					end
		link_to title, request.query_parameters.merge(sort: column, direction: dir)
	end
end
