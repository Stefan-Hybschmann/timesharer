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

const colorButtons = () => {
  const prevButton = document.querySelector(".fc-prev-button")
  const nextButton = document.querySelector(".fc-next-button")
  console.log(prevButton, nextButton)
  prevButton.style.backgroundColor = '#065143'
  nextButton.style.backgroundColor = '#065143'
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
    colorButtons();
  }
};



export { initBookingsCalendar, adjustCalendarSize };
