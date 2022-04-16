var today = new Date();

var events = [
  // {
  //   id: "imwyx6S",
  //   name: "Event #3",
  //   description: "Lorem ipsum dolor sit amet.",
  //   date: new Date(2022,4,5),
  //   type: "event"
  // }, 
  // {
  //   id: "9jU6g6f",
  //   name: "Holiday #1",
  //   description: "Lorem ipsum dolor sit amet.",
  //   date: new Date(2022,3,4),
  //   type: "holiday"
  // },
  // {
  //   id: "0g5G6ja",
  //   name: "Event #1",
  //   description: "Lorem ipsum dolor sit amet.",
  //   date: today,
  //   type: "event",
  // },
];
var active_events = [];
var week_date = [];
var curAdd, curRmv;

function getWeeksInMonth(a, b) {
    var c = [], d = new Date(b, a, 1), e = new Date(b, a + 1, 0), f = e.getDate();
    var g = 1;
    var h = 7 - d.getDay();
    while (g <= f) {
        c.push({
            start: g,
            end: h
        });
        g = h + 1;
        h += 7;
        if (h > f) h = f;
    }
    return c;
}

week_date = getWeeksInMonth(today.getMonth(), today.getFullYear())[2];

$(document).ready(function() {
    $("#demoEvoCalendar").evoCalendar({
        format: "MM dd, yyyy",
        theme:"Orange Coral",
        titleFormat: "MM",
        calendarEvents: events,
    });
  })