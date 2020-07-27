import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';

let calendar

const getEvents = (calendarEl) => {
  const events = JSON.parse(calendarEl.dataset.bookings);
  return events;
};

const getCalendarElement = () => {
  return document.getElementById('bookings-calendar');
}

const adjustCalendarSize = () => {
  if (getCalendarElement()) {
    calendar.updateSize();
  }
}

const initBookingsCalendar = () => {
  const calendarEl = getCalendarElement();
  if (calendarEl) {
    const events = getEvents(calendarEl);
    calendar = new Calendar(calendarEl, {
      plugins: [ dayGridPlugin ],
      events: events
    });

    calendar.render();
  }
};

export { initBookingsCalendar, adjustCalendarSize };
