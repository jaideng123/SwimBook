class EntriesDatatable
  delegate :params, :h, :link_to, :number_to_currency,:raw,:truncate, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Entry.count,
      iTotalDisplayRecords: entries.total_entries,
      aaData: data
    }
  end

private

  def data
    entries.map do |entry|
      [
	      link_to(truncate(entry.lname,:length => 10), entry),
	      ERB::Util.h(truncate(entry.fname,:length => 10)),
	      if entry.pink
	        raw("<span style=\"background-color: #FF1975\"> 
	      	<font size = \'4\'>&#10003;</font>
    </span>")
	  	  else
	  	    ""
	  	  end,
	  	  if entry.yellow
	        raw("<span style=\"background-color: #FFFF00\"> 
        <font size = \'4'\>&#10003;</font>
    </span>")
	  	  else
	  	    ""
	      end,
	      ERB::Util.h(entry.age),
	      ERB::Util.h(truncate(entry.parent,:length => 12)),
	      ERB::Util.h(truncate(entry.guard,:length => 12)),
	      ERB::Util.h(entry.tested)
	   ]
    end
  end

  def entries
    @entries ||= fetch_entries
  end

  def fetch_entries
    entries = Entry.order("#{sort_column} #{sort_direction}")
    entries = entries.page(page).per_page(per_page)
    entries
  end

  def page
    params[:start].to_i/per_page + 1
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 10
  end

  def sort_column
    columns = %w[lname fname pink yellow age parent guard tested]
    columns[params[:order]["0"][:column].to_i]
  end

  def sort_direction
    params[:order]["0"][:dir] == "desc" ? "desc" : "asc"
  end
end
