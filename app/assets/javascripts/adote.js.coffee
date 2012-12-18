$(document).ready =>
  $("#search_authority")
    .typeahead
      source: (typeahead, query) ->
        $.ajax
          url: '/authorities'
          data: {query: query}
          success: (data, status, xhr)=>
            typeahead.process(data)
      property: "name"
      onselect: (authority)->
        $("#search_authority").val ""
        $("#authority").val authority.name
        $("#request_authority_id").val authority.id
