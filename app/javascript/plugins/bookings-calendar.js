import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';

const getEvents = (calendarEl) => {
  const events = JSON.parse(calendarEl.dataset.bookings);
  return events;
};

const initBookingsCalendar = () => {
  const calendarEl = document.getElementById('bookings-calendar');
  if (calendarEl) {
    const events = getEvents(calendarEl);
    const calendar = new Calendar(calendarEl, {
      plugins: [ dayGridPlugin ],
      events: events
    });

    calendar.render();
  }
};

export { initBookingsCalendar };
