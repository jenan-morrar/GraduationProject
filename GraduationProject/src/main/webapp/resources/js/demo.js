var today = new Date();
if($("#reservations").val() != undefined)
	var events = JSON.parse($("#reservations").val());

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
function loadCalendar(events, srvices){
	    $("#demoEvoCalendar").evoCalendar({
        format: "MM dd, yyyy",
        theme:"Orange Coral",
        titleFormat: "MM",
        calendarEvents: events,
    });
};

$(document).ready(function() {

   $("#demoEvoCalendar").evoCalendar({
        format: "MM dd, yyyy",
        theme:"Orange Coral",
        titleFormat: "MM",
        calendarEvents: events,
    });
  })