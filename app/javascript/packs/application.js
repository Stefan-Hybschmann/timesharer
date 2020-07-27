require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
// External imports

import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

import { initBookingsCalendar, adjustCalendarSize } from '../plugins/bookings-calendar';
import {flatpicker} from "../plugins/flatpickr"

import { initMapbox } from '../plugins/init_mapbox';

import { showBookingConfirmationModal } from '../plugins/booking-confirmation';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();

  flatpicker();
  initBookingsCalendar();
  initMapbox();
  showBookingConfirmationModal();
});

document.addEventListener('readystatechange', (event) => {
  if (document.readyState === 'complete') {
    adjustCalendarSize()
  }
});

