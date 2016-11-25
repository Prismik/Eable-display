function fetchOrders() {
  function updateTable(data) {
    var targetElement = $('.eable-table tbody');
    var bodyContent = '';
    data.forEach(function (order) {
     bodyContent += '<tr>' +
      '<td>' + order.unique_id + '</td>' +
      '<td>' + order.tablet_id + '</td>' +
      '<td>' + order.title + '</td>' +
      '<td class="price">' + order.cost.toFixed(2) + ' $</td>'
      '</tr>' 
    });
    targetElement.html(bodyContent);
  }

  function handleError(error) {

  }

  $.ajax({
    type:'GET',
    url: "http://127.0.0.1:9090/orders",
    success: updateTable,
    crossDomain : true,
    error: handleError
  });

}

setInterval(fetchOrders, (5 * 1000));
