$(document).ready =>
  $("#authorities")
    .typeahead
      source: (typeahead, query) ->
        $.ajax
          url: '/authorities'
          data: {query: query}
          success: (data, status, xhr)=>
            typeahead.process(data)
      property: "name"
      onselect: (authority)->
        $("#request_authority_id").val authority.id
