$ ->
  selector = 'a[href]:not([data-remote]):not([data-method]):not([data-behavior]):not([data-skip-pjax]):not([href="#"]):not([href*="javascript:"])'
  $(selector).pjax '[data-pjax-container]',
    beforeSend: (xhr)->
      $(document).trigger('start.pjax')
      xhr.setRequestHeader('X-PJAX', 'true')
      $this = $(this)
      if $this.data('pjax-direction')
        $('#page-container').hide "slide", 
          direction: (if $this.data('pjax-direction') is 'right' then 'left' else 'right')
    complete: ->
      $(document).trigger('end.pjax')
      $this = $(this)
      if $this.data('pjax-direction')
        $('#page-container').show "slide", 
          direction: $this.data('pjax-direction')