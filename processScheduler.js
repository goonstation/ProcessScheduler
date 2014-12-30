(function ($) {
    function setRef(theRef) {
        ref = theRef;
    }

    function jax(action, data) {
        if (typeof data === 'undefined')
            data = {};
        var params = [];
        for (var k in data) {
            if (data.hasOwnProperty(k)) {
                params.push(encodeURIComponent(k) + '=' + encodeURIComponent(data[k]));
            }
        }
        var newLoc = '?src=' + ref + ';action=' + action + ';' + params.join(';');
        window.location = newLoc;
    }

    function requestRefresh(e) {
      jax("refresh", null);
    }
    
    function handleRefresh(processTable) {
      $('#processTable').html(processTable);
      initProcessTableButtons();
    }
    
    function requestKill(e) {
      var button = $(e.currentTarget);
      jax("kill", {name: button.data("process-name")});
    }
    
    function initProcessTableButtons() {
      $(".kill-btn").on("click", requestKill);
    }
    
    window.setRef = setRef;
    window.handleRefresh = handleRefresh;
    
    $(function() {
      initProcessTableButtons();
      $('#btn-refresh').on("click", requestRefresh);
    });
}(jQuery));