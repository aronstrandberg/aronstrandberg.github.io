$(function() {
  var chart, data, height, n, redraw, running, t, w, width, x, y;
  running = true;
  width = document.documentElement.clientWidth;
  height = document.documentElement.clientHeight;
  n = 100;
  t = 10;
  data = [50];
  x = d3.scale.linear().domain([0, data.length]).range([0, width]);
  y = d3.scale.linear().domain([0, n]).rangeRound([0, height]);
  w = function() {
    return width / data.length;
  };
  chart = d3.select("#chart").append("svg:svg").attr("width", width).attr("height", height);
  chart.selectAll("rect").data(data).enter().append("svg:rect").attr("x", function(d, i) {
    return x(i);
  }).attr("y", function(d) {
    return height - y(d);
  }).attr('width', w()).attr("height", function(d) {
    return y(d);
  });
  redraw = function() {
    var rect;
    rect = chart.selectAll('rect').data(data);
    rect.enter().insert('svg:rect', 'line').attr('x', function(d, i) {
      return x(i);
    }).attr('y', function(d) {
      return height - y(d);
    }).attr('width', w()).attr('height', function(d) {
      return y(d);
    }).transition().duration(t).attr('x', function(d, i) {
      return x(i);
    });
    rect.transition().duration(t).attr('x', function(d, i) {
      return x(i);
    }).attr('y', function(d) {
      return height - y(d);
    }).attr('width', w()).attr('height', function(d) {
      return y(d);
    });
  };
  $('*').keypress(function() {
    return running = !running;
  });
  return setInterval(function() {
    if (!running) {
      return;
    }
    data.push(Math.random() * n / 2 + n / 3);
    x.domain([0, data.length]);
    console.log(data);
    console.log(n);
    return redraw();
  }, t);
});
